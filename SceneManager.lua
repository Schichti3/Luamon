local EventHandler = require('EventHandler')

local SceneManager = {}

SceneManager.sceneStack = {}

SceneManager.scenes = nil

function SceneManager:initScenes(scenes)
  self.scenes = scenes
end

function SceneManager:push(sceneName)
  if self.scenes[sceneName] then
    -- NOTE: maybe will man hier noch Code für die Szene ausführen bevor die actually gepusht wird, z.B Animationen könnte man zurücksetzen lassen aber is eine Designentscheidung, ob man das machen möchte
    table.insert(self.sceneStack, self.scenes[sceneName])
    if self.scenes[sceneName].onPush then
      self.scenes[sceneName]:onPush()
    end
  else
    error('Tried to push non existing scene to the sceneStack')
  end
end

function SceneManager:pop()
  local poppedScene = self.sceneStack[#self.sceneStack]
  table.remove(self.sceneStack, #self.sceneStack)
  if poppedScene.onPop then
    poppedScene:onPop()
  end
end

function SceneManager:handleEvents()
  for i = #self.sceneStack, 1, -1 do
    EventHandler:handle(self.sceneStack[i].elements)
  end
end

function SceneManager:draw()
  for i = 1, #self.sceneStack, 1 do
    self.sceneStack[i]:draw()
  end
end

function SceneManager:update(dt)
  for i = 1, #self.sceneStack, 1 do
    self.sceneStack[i]:update(dt)
  end
end

function SceneManager:resize(currentWindowWidth, currentWindowHeight, newWindowWidth, newWindowHeight)
  for _, scene in pairs(self.scenes) do
    if scene.resize then
      scene:resize(currentWindowWidth, currentWindowHeight, newWindowWidth, newWindowHeight)
    end
  end
end

return SceneManager

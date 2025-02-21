local EventHandler = require('EventHandler')

local SceneManager = {}

SceneManager.sceneStack = {}

SceneManager.scenes = nil

function SceneManager:initScenes(scenes)
  self.scenes = scenes
end

function SceneManager:push(sceneName)
  if self.scenes[sceneName] then
    table.insert(self.sceneStack, self.scenes[sceneName])
  else
    error('Tried to push non existing scene to the sceneStack')
  end
end

function SceneManager:pop()
  table.remove(self.sceneStack, #self.sceneStack)
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

return SceneManager

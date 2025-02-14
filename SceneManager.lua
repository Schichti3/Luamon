local EventHandler = require('EventHandler')

local SceneManager = {}

SceneManager.sceneStack = {}

SceneManager.scenes = nil

function SceneManager:initScenes(scenes)
	self.scenes = scenes
end

function SceneManager:push(sceneName)
	table.insert(self.sceneStack, sceneName)
end

function SceneManager:pop()
	table.remove(self.sceneStack, #self.sceneStack)
end

function SceneManager:handleEvents()
	for i = #self.sceneStack, 1, -1 do
		EventHandler:handle(self.sceneStack[i])
	end
end

function SceneManager:draw()
	for i = 1, #self.sceneStack, 1 do
		self.sceneStack[i]:draw()
	end
end

return SceneManager

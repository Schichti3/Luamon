local Controller = require('Controller')

function love.load()
  Controller.assetManager:load('assets')
  Controller.sceneManager:initScenes(require('Scenes'))
  Controller.sceneManager:push('mainMenu')
end

function love.update(dt)
  Controller.sceneManager:handleEvents()
  Controller.sceneManager:update(dt)
end

function love.draw()
  Controller.sceneManager:draw()
  require('DebugInfo'):addText('width', love.graphics.getWidth())
  require('DebugInfo'):addText('height', love.graphics.getHeight())
  require('DebugInfo'):show()
end

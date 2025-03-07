local Controller = require('Controller')
local initialWindowWidth = 800
local initialWindowHeight = 600
local currentWindowWidth = initialWindowWidth
local currentWindowHeight = initialWindowHeight

function love.load()
  -- NOTE: config muss hier geladen werden, die brauchen wir nämlich für das initiieren der scenes
  love.window.setMode(currentWindowWidth, currentWindowHeight, { resizable = true })
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

function love.keypressed(key)
  if require('DebugInfo').active == true then
    if key == 'escape' then
      love.event.quit()
    end
  end
end

function love.resize(newWindowWidth, newWindowHeight)
  Controller.sceneManager:resize(currentWindowWidth, currentWindowHeight, newWindowWidth, newWindowHeight, initialWindowWidth, initialWindowHeight)
  currentWindowWidth = newWindowWidth
  currentWindowHeight = newWindowHeight
end

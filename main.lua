local SceneManager = require('SceneManager')
local EventHandler = require('EventHandler')
local AssetManager = require('AssetManager')
local SimpleButton = require('SimpleButton')
local TextureButton = require('TextureButton')

local newSimpleButton = SimpleButton:new({ text = 'Play' })
local newTextureButton = TextureButton:new({
  x = 200,
  defaultTextureName = 'noah',
  mouseDownTextureName = 'jan',
  hoverTextureName = 'titus',
})
local newTextureButton2 = TextureButton:new({
  x = 200,
  y = 300,
  defaultTextureName = 'playButtonDefault',
  mouseDownTextureName = 'playButtonMouseDown',
  hoverTextureName = 'playButtonHover',
})

function love.load()
  AssetManager:load('assets')
  SceneManager:initScenes(require('Scenes'))
  SceneManager:push('mainMenu')
end

function love.update(dt)
  SceneManager:handleEvents()
  SceneManager:update(dt)
end

function love.draw()
  SceneManager:draw()
  --	newSimpleButton:draw()
  --	newTextureButton:draw()
  --	newTextureButton2:draw()
  require('DebugInfo'):show()
end

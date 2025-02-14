local SceneManager = require("SceneManager")
local EventHandler = require("EventHandler")
local AssetManager = require("AssetManager")
local SimpleButton = require("SimpleButton")
local TextureButton = require("TextureButton")

local newSimpleButton = SimpleButton:new({ text = "Play" })
local newTextureButton = TextureButton:new({
	x = 200,
	defaultTextureName = "noah",
	mouseDownTextureName = "jan",
	hoverTextureName = "titus",
})
local newTextureButton2 = TextureButton:new({
	x = 200,
	y = 300,
	defaultTextureName = "playButtonDefault",
	mouseDownTextureName = "playButtonMouseDown",
	hoverTextureName = "playButtonHover",
})

function love.load()
	AssetManager:load("assets")
end

function love.update()
	SceneManager.handleEvents()
end

function love.draw()
	newSimpleButton:draw()
	newTextureButton:draw()
	newTextureButton2:draw()
	require("DebugInfo"):show()
end

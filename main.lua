local EventHandler = require("EventHandler")
local AssetManager = require("AssetManager")
local SimpleButton = require("SimpleButton")
local TextureButton = require("TextureButton")

local newSimpleButton = SimpleButton:new(nil)
local newTextureButton = TextureButton:new({x = 200, defaultTextureName = "noah"})

require("DebugInfo").active = true

function love.load()
    AssetManager:load("assets")
    EventHandler:addEventReactor(newSimpleButton)
end

function love.update()
    EventHandler:handle()
end

function love.draw()
    newSimpleButton:draw()
    newTextureButton:draw()
    require("DebugInfo"):show()
end
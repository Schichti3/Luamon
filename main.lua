local EventHandler = require("EventHandler")
local AssetManager = require("AssetManager")
local SimpleButton = require("SimpleButton")
local TextureButton = require("TextureButton")

local newSimpleButton = SimpleButton:new(nil)
local newTextureButton = TextureButton:new({x = 200, defaultTextureName = "noah", mouseDownTextureName = "jan", hoverTextureName = "titus"})
local newTextureButton2 = TextureButton:new({x = 200, y = 300, defaultTextureName = "playButtonDefault", mouseDownTextureName = "playButtonMouseDown", hoverTextureName = "playButtonHover"})

require("DebugInfo").active = true

function love.load()
    AssetManager:load("assets")
    EventHandler:addEventReactor(newSimpleButton)
    EventHandler:addEventReactor(newTextureButton)
    EventHandler:addEventReactor(newTextureButton2)
end

function love.update()
    EventHandler:handle()
end

function love.draw()
    newSimpleButton:draw()
    newTextureButton:draw()
    newTextureButton2:draw()
    require("DebugInfo"):show()
end
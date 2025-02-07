local AssetManager = require("AssetManager")

local TextureButton = setmetatable({}, {__index = require("GuiElement")})

TextureButton.activeTextureName = ""
TextureButton.defaultTextureName = ""
TextureButton.hoverTextureName = ""
TextureButton.mouseDownTextureName = ""

function TextureButton:new(templateTable)
    local obj = templateTable or {}
    if obj.defaultTextureName then
        obj.activeTextureName = obj.defaultTextureName
    end
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function TextureButton:draw()
    if self.visible then
        love.graphics.draw(AssetManager:get(self.activeTextureName), self.x, self.y)
    end
end

return TextureButton
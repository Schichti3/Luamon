local AssetManager = require("AssetManager")

local TextureButton = setmetatable({}, { __index = require("Element") })

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
		love.graphics.draw(AssetManager:getTexture(self.activeTextureName), self.x, self.y)
	end
end

function TextureButton:mouseInArea(mouseX, mouseY)
	local imageData = AssetManager:getImageData(self.activeTextureName)

	if imageData == nil then
		return
	end

	local w, h = imageData:getDimensions()
	require("DebugInfo"):addText("w", w)
	require("DebugInfo"):addText("h", h)

	local tolerance = 1
	if
		mouseX >= self.x + tolerance
		and mouseX <= self.x + w - tolerance
		and mouseY >= self.y + tolerance
		and mouseY <= self.y + h - tolerance
	then
		local localX = mouseX - self.x
		local localY = mouseY - self.y

		local r, g, b, a = AssetManager:getImageData(self.activeTextureName):getPixel(localX, localY)

		if a > 0 then
			require("DebugInfo"):addText("onImage", "true")
		else
			require("DebugInfo"):addText("onImage", "false")
		end

		return a > 0
	else
		return false
	end
end

function TextureButton:onMouseDown()
	self.activeTextureName = self.mouseDownTextureName
end

function TextureButton:onMouseUp()
	self.activeTextureName = self.defaultTextureName
end

function TextureButton:onClick() end

function TextureButton:onHover(onElement)
	if onElement then
		self.activeTextureName = self.hoverTextureName
	else
		self.activeTextureName = self.defaultTextureName
	end
end

return TextureButton


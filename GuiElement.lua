-- abstract base table for gui elements
local GuiElement = {}

GuiElement.x = 0
GuiElement.y = 0
GuiElement.visible = true
GuiElement.enabled = true

GuiElement.mouseDown = {left = false, right = false}
GuiElement.keyDown   = {}

GuiElement.new           = function (self) error("Abstract function called") end

GuiElement.draw          = function (self) error("Abstract function called") end

GuiElement.mouseInArea   = function (self, mouseX, mouseY) error("Abstract function called") end

GuiElement.onHover       = function (self, onElement) error("Abstract function called") end
GuiElement.onMouseDown   = function (self, button) error("Abstract function called") end
GuiElement.onMouseUp     = function (self, button) error("Abstract function called") end
GuiElement.onClick       = function (self, button) error("Abstract function called") end

GuiElement.onKeyDown     = function (self) error("Abstract function called") end
GuiElement.onKeyUp       = function (self) error("Abstract function called") end
GuiElement.onKeyPress    = function (self) error("Abstract function called") end


return GuiElement
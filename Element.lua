-- abstract base table for gui elements
local Element = {}

Element.x = 0
Element.y = 0
Element.visible = true
Element.enabled = true

Element.mouseDown = { left = false, right = false }
Element.keyDown = {}

Element.new = function(self)
  error('Abstract function called')
end

Element.draw = function(self)
  error('Abstract function called')
end

Element.update = function(self) end

Element.mouseInArea = function(self, mouseX, mouseY)
  error('Abstract function called')
end
--mouse
Element.onHover = nil
Element.onMouseDown = nil
Element.onMouseUp = nil
Element.onClick = nil
--keyboard
Element.onKeyDown = nil
Element.onKeyUp = nil
Element.onKeyPress = nil

function Element:hasEventHandling()
  if self.onMouseDown or self.onHover or self.onMouseDown or self.onMouseUp or self.onClick then
    return true
  end
  if self.onKeyDown or self.onKeyUp or self.onKeyPress then
    return true
  end
  return false
end

function Element:hasCustomSizeHandling()
  if self.customSizeHandling then
    return true
  end
  return false
end

function Element.setStateValues(targetObj)
  targetObj.mouseDown = { left = false, right = false }
  targetObj.keyDown = {}
end

return Element

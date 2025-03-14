local SpriteHolder = setmetatable({}, { __index = require('Element') })

SpriteHolder.sprite = nil
SpriteHolder.width = 0
SpriteHolder.customSizeHandling = true

function SpriteHolder:new(x, y, w, h, sprite)
  local obj = { x = x, y = y, width = w, height = h, sprite = sprite }
  SpriteHolder.setStateValues(obj)
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function SpriteHolder:draw()
  if self.visible then
    self.sprite:draw(self.x, self.y)
  end
end

function SpriteHolder:update(dt)
  self.sprite:update(dt)
end

function SpriteHolder:customResize(currentWindowWidth, currentWindowHeight, newWindowWidth, newWindowHeight)
  local newX, newY, newW, newH =
    require('Utility').scaleToParent(self.x, self.y, self.width, self.height, currentWindowWidth, currentWindowHeight, newWindowWidth, newWindowHeight)
  self.x = newX
  self.y = newY
  self.width = newW
  self.height = newH
  self.sprite:scaleToHolderDimensions(self.width, self.height)
end

function SpriteHolder:changeSprite(newSprite)
  self.sprite = newSprite
  self.sprite:scaleToHolderDimensions(self.width, self.height)
end

return SpriteHolder

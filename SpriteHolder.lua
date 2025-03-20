local SpriteHolder = setmetatable({}, { __index = require('Element') })
require('Constants')

SpriteHolder.sprite = nil
SpriteHolder.width = 0
SpriteHolder.customSizeHandling = true
SpriteHolder.spritePos = SPRITE_POS.CENTERED

function SpriteHolder:new(x, y, w, h, sprite, spritePos)
  local obj = { x = x, y = y, width = w, height = h, sprite = sprite, spritePos = spritePos }
  obj.sprite:scaleToHolderDimensions(obj.width, obj.height)
  SpriteHolder.setStateValues(obj)
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function SpriteHolder:draw()
  if self.visible then
    self.sprite:draw(self.x, self.y, self.width, self.height, self.spritePos)
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

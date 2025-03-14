local Sprite = {}

Sprite.activeAnimation = ''
Sprite.animations = {}
Sprite.scaleFactorX = 1
Sprite.scaleFactorY = 1

function Sprite:new(activeAnimation, animations, scaleFactorX, scaleFactorY)
  local obj = { activeAnimation = activeAnimation, animations = animations, scaleFactorX = scaleFactorX, scaleFactorY = scaleFactorY }
  setmetatable(obj, {
    __index = function(t, key)
      if key == 'draw' then
        return Sprite.draw
      end
      if key == 'update' then
        return Sprite.update
      end
      if key == 'scaleToHolderDimensions' then
        return Sprite.scaleToHolderDimensions
      end
      if t.animations[key] then
        return t.animations[key]
      end
      if Sprite[key] then
        return Sprite[key]
      end
      return nil
    end,
  })
  return obj
end

function Sprite:draw(x, y)
  love.graphics.setColor(1, 1, 1)
  self.animations[self.activeAnimation]:draw(x, y, self.scaleFactorX, self.scaleFactorY)
end

function Sprite:update(dt)
  self.animations[self.activeAnimation]:update(dt)
end

function Sprite:scaleToHolderDimensions(holderWidth, holderHeight)
  self.scaleFactorX = holderWidth / self.animations[self.activeAnimation].frameWidth
  self.scaleFactorY = holderHeight / self.animations[self.activeAnimation].frameHeight
end

return Sprite

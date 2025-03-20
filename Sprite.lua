require('Constants')
local Sprite = {}

Sprite.activeAnimationName = ''
Sprite.activeAnimation = nil
Sprite.animations = {}
Sprite.scaleFactorX = 1
Sprite.scaleFactorY = 1

function Sprite:new(activeAnimationName, animations, scaleFactorX, scaleFactorY, opts)
  local obj = {
    activeAnimationName = activeAnimationName,
    activeAnimation = animations[activeAnimationName],
    animations = animations,
    scaleFactorX = scaleFactorX,
    scaleFactorY = scaleFactorY,
  }
  if opts then
    if opts.keepAspectRatio then
      obj.keepAspectRatio = true
    else
      obj.keepAspectRatio = false
    end
  end
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
      if key == 'changeActiveAnimation' then
        return Sprite.changeActiveAnimation
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

function Sprite:draw(x, y, holderWidth, holderHeight, spritePos)
  love.graphics.setColor(1, 1, 1)
  if spritePos == SPRITE_POS.CENTERED then
    x = x + require('Utility').getCentered(self.activeAnimation.frameWidth * self.scaleFactorX, holderWidth)
    y = y + require('Utility').getCentered(self.activeAnimation.frameHeight * self.scaleFactorY, holderHeight)
  end
  self.activeAnimation:draw(x, y, self.scaleFactorX, self.scaleFactorY)
  -- self.animations[self.activeAnimationName]:draw(x, y, self.scaleFactorX, self.scaleFactorY)
end

function Sprite:update(dt)
  self.activeAnimation:update(dt)
  -- self.animations[self.activeAnimationName]:update(dt)
end

function Sprite:scaleToHolderDimensions(holderWidth, holderHeight)
  self.scaleFactorX = holderWidth / self.activeAnimation.frameWidth
  self.scaleFactorY = holderHeight / self.activeAnimation.frameHeight
  if self.keepAspectRatio then
    if self.scaleFactorX > self.scaleFactorY then
      self.scaleFactorX = self.scaleFactorY
    else
      self.scaleFactorY = self.scaleFactorX
    end
  end
end

function Sprite:changeActiveAntimation(animationName)
  if self.animations[animationName] == nil then
    error('changeActiveAntimation: ' .. animationName .. ' not existing')
  else
    self.activeAnimationName = animationName
    self.activeAnimation = self.animations[animationName]
  end
end

return Sprite

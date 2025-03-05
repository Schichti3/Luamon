local Sprite = setmetatable({}, { __index = require('Element') })

Sprite.activeAnimation = ''
Sprite.animations = {}

function Sprite:new(x, y, activeAnimation, animations)
  local obj = { x = x, y = y, animations = animations, activeAnimation = activeAnimation }
  Sprite.setStateValues(obj)
  setmetatable(obj, {
    __index = function(t, key)
      if key == 'draw' then
        return Sprite.draw
      end
      if key == 'update' then
        return Sprite.update
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

function Sprite:draw()
  if self.visible then
    love.graphics.setColor(1, 1, 1)
    self.animations[self.activeAnimation]:draw(self.x, self.y)
  end
end

function Sprite:update(dt)
  self.animations[self.activeAnimation]:update(dt)
end

return Sprite

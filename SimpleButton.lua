local SimpleButton = setmetatable({}, { __index = require('Element') })

SimpleButton.width = love.graphics.getWidth() / 6
SimpleButton.height = love.graphics.getHeight() * 0.075
SimpleButton.color = { 0, 0, 0 }

SimpleButton.texts = {}
-- SimpleButton.textColor = { 255, 255, 255 }
-- SimpleButton.textSize = 12
-- SimpleButton.font = love.graphics.getFont()

SimpleButton.border = true
SimpleButton.borderWidth = 4
SimpleButton.borderColor = { 255, 255, 255 }

function SimpleButton:new(templateTable)
  local obj = templateTable or {}
  SimpleButton.setStateValues(obj)
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function SimpleButton:draw()
  if self.visible then
    love.graphics.setColor(love.math.colorFromBytes(self.color[1], self.color[2], self.color[3]))
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    if self.borderWidth > 0 then
      love.graphics.setColor(love.math.colorFromBytes(self.borderColor[1], self.borderColor[2], self.borderColor[3]))
      love.graphics.setLineWidth(self.borderWidth)
      love.graphics.rectangle('line', self.x, self.y, self.width, self.height)
    end
    for _, text in pairs(self.texts) do
      text:draw(self.x, self.y, self.width, self.height)
    end
  end
end

function SimpleButton:mouseInArea(mouseX, mouseY)
  return mouseX >= self.x and mouseX <= self.x + self.width and mouseY >= self.y and mouseY <= self.y + self.height
end

function SimpleButton:onMouseDown() end

function SimpleButton:onMouseUp() end

function SimpleButton:onClick() end

function SimpleButton:onHover(onElement)
  if onElement then
    if self.mouseHovering == false then
      self.color = { self.color[1] - 100, self.color[2] - 100, self.color[3] - 100 }
      self.mouseHovering = true
    end
  else
    if self.mouseHovering then
      self.color = { self.color[1] + 100, self.color[2] + 100, self.color[3] + 100 }
      self.mouseHovering = false
    end
  end
end

return SimpleButton

local Controller = require('Controller')

local Text = {}

Text.pos = TEXT_POS.CENTERED
Text.x = 0
Text.y = 0
Text.textName = 'Text'
Text.textSize = love.graphics.getFont():getHeight()
Text.textColor = { 0, 0, 0 }
Text.font = love.graphics.getFont()
Text.gapToParentBorderX = 0
Text.gapToParentBorderY = 0

function Text:new(pos, textName, parentX, parentY, parentW, parentH, opts)
  local obj = {}
  if opts.textSize then
    obj.textSize = opts.textSize
  end
  if opts.textColor then
    obj.textColor = opts.textColor
  end
  if opts.gapToParentBorderX then
    obj.gapToParentBorderX = opts.gapToParentBorderX
  end
  if opts.gapToParentBorderY then
    obj.gapToParentBorderY = opts.gapToParentBorderY
  end
  obj.pos = pos
  obj.textName = textName
  setmetatable(obj, self)
  self.__index = self
  obj.font = love.graphics.newFont(obj.textSize)
  obj:setXY(parentX, parentY, parentW, parentH)
  return obj
end

function Text:draw()
  love.graphics.setColor(love.math.colorFromBytes(self.textColor[1], self.textColor[2], self.textColor[3]))
  love.graphics.setFont(self.font)
  love.graphics.print(Controller:getText(self.textName), self.x, self.y)
end

function Text:resize(parentX, parentY, parentW, prevParentH, parentH)
  self.textSize = require('Utility').scaleText(self.textSize, prevParentH, parentH)
  self.font = love.graphics.newFont(self.textSize)
  self:setXY(parentX, parentY, parentW, parentH)
end

function Text:setXY(parentX, parentY, parentW, parentH)
  local newX, newY
  if self.pos == TEXT_POS.CENTERED then
    newX, newY = require('Utility').getCenteredTextCoordinates(Controller:getText(self.textName), self.font, parentX, parentY, parentW, parentH)
  elseif self.pos == TEXT_POS.TOPLEFT then
    newX = parentX + self.gapToParentBorderX
    newY = parentY + self.gapToParentBorderY
  elseif self.pos == TEXT_POS.TOPRIGHT then
    newX = parentX + parentW - self.font:getWidth(Controller:getText(self.textName)) - self.gapToParentBorderX
    newY = parentY - self.gapToParentBorderY
  elseif self.pos == TEXT_POS.BOTTOMLEFT then
    newX = parentX + self.gapToParentBorderX
    newY = parentY + parentH - self.font:getHeight() - self.gapToParentBorderY
  elseif self.pos == TEXT_POS.BOTTOMRIGHT then
    newX = parentX + parentW - self.font:getWidth(Controller:getText(self.textName)) - self.gapToParentBorderX
    newY = parentY + parentH - self.font:getHeight() - self.gapToParentBorderY
  end

  self.x = newX
  self.y = newY
end

return Text

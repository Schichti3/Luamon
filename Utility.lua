--- Provides utility functions
local Utility = {}

function Utility.getCenteredTextCoordinates(text, x, y, w, h)
  local textWidth = love.graphics.getFont():getWidth(text)
  local textHeight = love.graphics.getFont():getHeight()
  local newX = x + w / 2 - textWidth / 2
  local newY = y + h / 2 - textHeight / 2
  return newX, newY
end

function Utility.getCentered(toCenter, centerTarget)
  local centered = centerTarget / 2 - toCenter / 2
  return centered
end

return Utility

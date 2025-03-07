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

function Utility.liftUp(x, y, w, h, scaleFactor)
  if scaleFactor < 1 then
    error('liftUp only scales upwards')
  end
  local scaledW = w * scaleFactor
  local scaledH = h * scaleFactor
  local newX = x - ((scaledW - w) / 2)
  local newY = y - ((scaledH - h) / 2)
  return newX, newY, scaledW, scaledH
end

function Utility.liftDown(x, y, w, h, scaleFactor)
  if scaleFactor < 1 then
    error('liftUp only scales upwards')
  end
  local scaledW = w / scaleFactor
  local scaledH = h / scaleFactor
  local newX = x + ((w - scaledW) / 2)
  local newY = y + ((h - scaledH) / 2)
  return newX, newY, scaledW, scaledH
end

function Utility.scaleToParent(x, y, w, h, prevParentW, prevParentH, newParentW, newParentH)
  local wFactor = newParentW / prevParentW
  local hFactor = newParentH / prevParentH
  local scaledW = w * wFactor
  local scaledH = h * hFactor
  local scaledX = x * wFactor
  local scaledY = y * hFactor
  return scaledX, scaledY, scaledW, scaledH
end

function Utility.scaleXYToParent(x, y, prevParentW, prevParentH, newParentW, newParentH)
  local wFactor = newParentW / prevParentW
  local hFactor = newParentH / prevParentH
  local scaledX = x * wFactor
  local scaledY = y * hFactor
  return scaledX, scaledY
end

return Utility

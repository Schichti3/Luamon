--- Provides utility functions
local Utility = {}

function Utility.getCenteredTextCoordinates(text, font, x, y, w, h)
  local textWidth = font:getWidth(text)
  local textHeight = font:getHeight()
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

function Utility.scaleWHToParent(w, h, prevParentW, prevParentH, newParentW, newParentH)
  local wFactor = newParentW / prevParentW
  local hFactor = newParentH / prevParentH
  local scaledW = w * wFactor
  local scaledH = h * hFactor
  return scaledW, scaledH
end

function Utility.scaleText(textSize, prevParentH, newParentH)
  local scaleFactor = newParentH / prevParentH
  local scaledTextSize = textSize * scaleFactor
  return scaledTextSize
end

return Utility

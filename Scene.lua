local Scene = {}

Scene.elements = {}

function Scene:new(elements)
  local newTable = { elements = elements }
  setmetatable(newTable, {
    __index = function(t, key)
      if key == 'draw' then
        return Scene.draw
      end
      if key == 'update' then
        return Scene.update
      end
      if key == 'resize' then
        return Scene.resize
      end
      if key == 'updateTexts' then
        return Scene.updateTexts
      end
      if t.elements[key] then
        return t.elements[key]
      end
      return nil
    end,
  })
  return newTable
end

function Scene:draw()
  for _, element in pairs(self.elements) do
    element:draw()
  end
end

function Scene:update(dt)
  for _, element in pairs(self.elements) do
    element:update(dt)
  end
end

function Scene:resize(currentWindowWidth, currentWindowHeight, newWindowWidth, newWindowHeight, initialWindowWidth, initialWindowHeight)
  for _, element in pairs(self.elements) do
    if element:hasCustomSizeHandling() == false then
      local newX, newY, newW, newH = require('Utility').scaleToParent(
        element.x,
        element.y,
        element.width,
        element.height,
        currentWindowWidth,
        currentWindowHeight,
        newWindowWidth,
        newWindowHeight
      )
      element.x = newX
      element.y = newY
      element.width = newW
      element.height = newH
    else
      element:customResize(currentWindowWidth, currentWindowHeight, newWindowWidth, newWindowHeight, initialWindowWidth, initialWindowHeight)
    end
  end
end

return Scene

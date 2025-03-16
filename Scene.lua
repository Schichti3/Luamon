local Scene = {}

Scene.elements = {}

Scene.visible = true

Scene.onPush = nil
Scene.onPop = nil

function Scene:new(elements, callbacks)
  local newTable = { elements = elements }
  newTable.visible = true
  if callbacks then
    if callbacks.onPop then
      newTable.onPop = callbacks.onPop
    end
    if callbacks.onPush then
      newTable.onPush = callbacks.onPush
    end
  end
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
      if key == 'resetStates' then
        return Scene.resetStates
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
  if self.visible then
    for _, element in pairs(self.elements) do
      element:draw()
    end
  end
end

function Scene:update(dt)
  for _, element in pairs(self.elements) do
    element:update(dt)
  end
end

function Scene:resize(currentWindowWidth, currentWindowHeight, newWindowWidth, newWindowHeight)
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
      if element.texts then
        for _, text in pairs(element.texts) do
          text:resize(newX, newY, newW, newH)
        end
      end
      element.x = newX
      element.y = newY
      element.width = newW
      element.height = newH
    else
      element:customResize(currentWindowWidth, currentWindowHeight, newWindowWidth, newWindowHeight)
    end
  end
end

function Scene:resetStates()
  for _, element in pairs(self.elements) do
    if element.onHover then
      element:onHover(false)
    end
    element:setStateValues()
  end
end

return Scene

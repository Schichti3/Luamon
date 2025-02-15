local Scene = {}

Scene.elements = {}

function Scene:new(elements)
  local newTable = { elements = elements }
  setmetatable(newTable, {
    __index = function(t, key)
      if key == 'draw' then
        return Scene.draw
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

return Scene

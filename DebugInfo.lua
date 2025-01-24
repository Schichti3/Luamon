local DebugInfo = {}

DebugInfo.active = true

DebugInfo.texts = {}

function DebugInfo:show()
    if self.active then
        local yOffset = 0
        for key, text in pairs(self.texts) do
            local displayText = key .. ": " .. text
            local textWidth = love.graphics.getFont():getWidth(displayText)
            love.graphics.print(displayText, love.graphics.getWidth() - textWidth, yOffset)
            yOffset = yOffset + love.graphics.getFont():getHeight(displayText)
        end
    end
end

function DebugInfo:addText(key, text)
    self.texts[key] = text
end

return DebugInfo
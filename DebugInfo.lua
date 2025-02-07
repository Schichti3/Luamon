local DebugInfo = {}

DebugInfo.active = true

DebugInfo.texts = {}

DebugInfo.firstAppendInThisRuntime = true

function DebugInfo:addToOutputFile(filename, text)
    local file = io.open(filename .. ".txt", "a")
    if file then
        if self.firstAppendInThisRuntime then
            file:write("\n")
            self.firstAppendInThisRuntime = false
        end
        file:write(text .. "\n")
        file:close()
    end
end

function DebugInfo:show()
    if self.active then
        local yOffset = 0
        for key, text in pairs(self.texts) do
            local displayText = key .. ": " .. text
            local textWidth = love.graphics.getFont():getWidth(displayText)
            love.graphics.print(displayText, love.graphics.getWidth() - textWidth, yOffset)
            yOffset = yOffset + love.graphics.getFont():getHeight()
        end
    end
end

function DebugInfo:addText(key, text)
    self.texts[key] = text
end

return DebugInfo
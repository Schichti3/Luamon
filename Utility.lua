--- Provides utility functions
local Utility = {}
--- Centers text within a specified area.
-- @param text string, the text to display.
-- @param x number, the x-coordinate of the top-left corner of the area.
-- @param y number, the y-coordinate of the top-left corner of the area.
-- @param w number, the width of the area.
-- @param h number, the height of the area.
-- @return x number centered coordinate 
-- @return y number centered coordinate
function Utility.getCenteredTextCoordinates(text, x, y, w, h)
    local textWidth = love.graphics.getFont():getWidth(text)
    local textHeight = love.graphics.getFont():getHeight()
    local x =  x + w / 2 - textWidth / 2
    local y = y + h / 2 - textHeight / 2
    return x, y
end

return Utility
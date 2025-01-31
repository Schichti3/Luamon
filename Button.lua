local Button = {}

Button.text = "ButtonText"
Button.x = 0
Button.y = 0
Button.width = 100
Button.height = 100
Button.color = {1,1,1}

Button.borderWidth = 2
Button.borderColor = {1,0,0}

Button.visible = true
Button.enabled = true

Button.mouseDown = false

Button.onMouseDown = function (self)
    self.mouseDown = true
    self.color = {1,1,1}
end
Button.onMouseUp = function (self)
    self.mouseDown = false
    self.color = {0,0,1}
end
Button.onHover = function (self, mouseOnElement)
    if mouseOnElement then
        self.color = {0,1,0}
    else
        self.color = {0,0,1}
        self.mouseDown = false
    end
end
Button.onClick = function (self)
    self.text = "clicked"
end

function Button:draw()
    if self.visible then
        love.graphics.setColor(self.color[1],self.color[2],self.color[3])
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)   
        love.graphics.setColor(self.borderColor[1],self.borderColor[2],self.borderColor[3])
        love.graphics.setLineWidth(self.borderWidth)
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
        local newX, newY = require("Utility").getCenteredTextCoordinates(self.text, self.x, self.y, self.width, self.height)
        local textHeight = love.graphics.getFont():getHeight(self.text)
        love.graphics.print(self.text, newX, newY)
    end
end

function Button:new(o)
    local newTable = o or {}
    setmetatable(newTable, self)
    self.__index = self
    return newTable
end

return Button
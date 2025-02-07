local SimpleButton = setmetatable({}, {__index = require("GuiElement")})

SimpleButton.width = 100
SimpleButton.height = 60
SimpleButton.color = {0,0,0}

SimpleButton.text = "Text"
SimpleButton.textColor = {1,1,1}

SimpleButton.border = true
SimpleButton.borderWidth = 2
SimpleButton.borderColor = {1,1,1}

function SimpleButton:new(templateTable)
    local obj = templateTable or {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function SimpleButton:draw()
    if self.visible then
        love.graphics.setColor(self.color[1],self.color[2],self.color[3])
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)   
        love.graphics.setColor(self.borderColor[1],self.borderColor[2],self.borderColor[3])
        love.graphics.setLineWidth(self.borderWidth)
        love.graphics.rectangle("line", self.x, self.y, self.width, self.height)

        local newX, newY = require("Utility").getCenteredTextCoordinates(self.text, self.x, self.y, self.width, self.height)
        love.graphics.setColor(self.textColor[1],self.textColor[2],self.textColor[3])
        love.graphics.print(self.text, newX, newY)
    end
end

function SimpleButton:mouseInArea(mouseX, mouseY)
    return mouseX >= self.x and mouseX <= self.x + self.width and 
           mouseY >= self.y and mouseY <= self.y + self.height
end

function SimpleButton:onMouseDown()
    self.text = "mouseDown!"
end

function SimpleButton:onMouseUp()
    self.text = "mouseUp!"
end

function SimpleButton:onClick()
    self.text = "clicked!"
end

function SimpleButton:onHover(onElement)
    
end


return SimpleButton
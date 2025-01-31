local EventHandler = {}

EventHandler.elements = {}

function EventHandler:addEventReactor(reactorElement)
    table.insert(self.elements, reactorElement)
end

function EventHandler:handle()

    for _, element in ipairs(self.elements) do
        --mouse
        local mouseX, mouseY = love.mouse.getPosition()
        local mouseOnElement = mouseX >= element.x and mouseX <= element.x + element.width and 
                               mouseY >= element.y and mouseY <= element.y + element.height

        if element.onHover then
            element:onHover(mouseOnElement)
        end

        if mouseOnElement then
            local mouseWasDown = element.mouseDown
            local mouseUp = false
            if element.onMouseUp and mouseWasDown and not love.mouse.isDown(1) then
                element:onMouseUp()    
                mouseUp = true
            end         
            if element.onMouseDown and love.mouse.isDown(1) then
                element:onMouseDown()    
            end     

            if element.onClick and mouseWasDown and mouseUp then
                element:onClick()    
            end
        end
        --
        -- keyboard
    end
end

return EventHandler
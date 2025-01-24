local EventHandler = {}

EventHandler.onMouseDown         = {}
EventHandler.onMouseUp           = {}
EventHandler.onClickSubcribers   = {}
EventHandler.onHoverSubcribers   = {}
EventHandler.onEnterSubsrcribers = {}
EventHandler.onExitSubscribers   = {}


function EventHandler:addSubscriber(event, subcriber)
    table.insert(event,subcriber)
end

function EventHandler:checkMouse()
    local mouseX, mouseY = love.mouse.getPosition()
    require("DebugInfo"):addText("clickingElement", tostring(false))
    require("DebugInfo"):addText("mouseXY", tostring(mouseX) .. "," .. tostring(mouseY))
    require("DebugInfo"):addText("mouseDown", tostring(love.mouse.isDown(1)))

    for _, element in ipairs(self.onMouseDown) do
        if love.mouse.isDown(1) then
            if mouseX >= element.x and mouseX <= element.x + element.width and
                mouseY >= element.y and mouseY <= element.y + element.height then
                element:onMouseDown()
            end
        end
    end

    for _, element in ipairs(self.onMouseUp) do
        if not love.mouse.isDown(1) then
            if mouseX >= element.x and mouseX <= element.x + element.width and
                mouseY >= element.y and mouseY <= element.y + element.height then
                element:onMouseUp()
            end
        end
    end
    
    if love.mouse.isDown(1) then --[[left mouse button]]
        for _, element in ipairs(self.onClickSubcribers) do
            if mouseX >= element.x and mouseX <= element.x + element.width and
               mouseY >= element.y and mouseY <= element.y + element.height then
                require("DebugInfo"):addText("clickingElement", tostring(true))
                element:onClick()
            end 
        end    
    end
    
end

return EventHandler
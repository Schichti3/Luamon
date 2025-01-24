local EventHandler = require("EventHandler")
local Button = require("Button")


local newButton = Button:new({x=50,y=50, width=500, height=500, color={0,0,1}})
local newButton2 = Button:new({text = "custom", dhsdfh = 5})

require("DebugInfo").active = true

function love.load()
    EventHandler:addSubscriber(EventHandler.onMouseDown, newButton)
    EventHandler:addSubscriber(EventHandler.onMouseUp, newButton)
end

function love.update()
    EventHandler:checkMouse()
end

function love.draw()
    newButton:draw()
    require("DebugInfo"):show()
end
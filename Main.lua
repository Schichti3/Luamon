local EventHandler = require("EventHandler")
local Button = require("Button")

local Buttons = {}
local x, y = 0, 0
local w, h = 50, 50
for i = 1, 10 do
    table.insert(Buttons, Button:new({x=x, y=y, width=w, height=h, color={0,0,1}}))
    x = x + w
    y = y + h
end

local newButton = Button:new({x=50,y=50, width=500, height=500, color={0,0,1}})
local newButton2 = Button:new({text = "custom", dhsdfh = 5})

require("DebugInfo").active = true

function love.load()
    for _, button in ipairs(Buttons) do
        EventHandler:addEventReactor(button)
    end
end

function love.update()
    EventHandler:handle()
end

function love.draw()
    for _, button in ipairs(Buttons) do
        button:draw()
    end
    require("DebugInfo"):show()
end
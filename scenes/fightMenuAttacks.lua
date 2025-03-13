require('scenes.sceneRequirements')

local buttonWidth = love.graphics.getWidth() / 2 - love.graphics.getWidth() / 8
local buttonHeight = love.graphics.getHeight() / 2 - love.graphics.getHeight() / 3
local buttonGap = love.graphics.getHeight() / 4
local buttonStartX = love.graphics.getWidth() * 0.09375

return Scene:new({
  attack1 = SimpleButton:new({
    width = buttonWidth,
    height = buttonHeight,
    x = buttonStartX,
    y = buttonGap,
  }),
  attack2 = SimpleButton:new({
    width = buttonWidth,
    height = buttonHeight,
    x = buttonWidth + buttonGap,
    y = buttonGap,
  }),
  attack3 = SimpleButton:new({
    width = buttonWidth,
    height = buttonHeight,
    x = buttonStartX,
    y = (love.graphics.getHeight() / 2),
  }),
  attack4 = SimpleButton:new({
    width = buttonWidth,
    height = buttonHeight,
    x = buttonWidth + buttonGap,
    y = (love.graphics.getHeight() / 2),
  }),
})

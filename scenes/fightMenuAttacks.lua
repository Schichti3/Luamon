require('scenes.sceneRequirements')

local attackButtonWidth = love.graphics.getWidth() / 2 - love.graphics.getWidth() / 8
local attackButtonHeight = love.graphics.getHeight() / 2 - love.graphics.getHeight() / 3
local attackButtonGap = love.graphics.getHeight() / 4
local attackButtonStartX = love.graphics.getWidth() * 0.09375
local attackButton2ndRowX = love.graphics.getWidth() - attackButtonStartX - attackButtonWidth

return Scene:new({
  attack1 = SimpleButton:new({
    width = attackButtonWidth,
    height = attackButtonHeight,
    x = attackButtonStartX,
    y = attackButtonGap,
  }),
  attack2 = SimpleButton:new({
    width = attackButtonWidth,
    height = attackButtonHeight,
    x = attackButton2ndRowX,
    y = attackButtonGap,
  }),
  attack3 = SimpleButton:new({
    width = attackButtonWidth,
    height = attackButtonHeight,
    x = attackButtonStartX,
    y = (love.graphics.getHeight() / 2),
  }),
  attack4 = SimpleButton:new({
    width = attackButtonWidth,
    height = attackButtonHeight,
    x = attackButton2ndRowX,
    y = (love.graphics.getHeight() / 2),
  }),
  inventory = SimpleButton:new({
    width = attackButtonWidth / 2,
    height = attackButtonHeight,
    text = 'inventory',
    x = 0,
    y = love.graphics.getHeight() - attackButtonHeight,
  }),
  back = SimpleButton:new({
    width = attackButtonWidth / 2,
    height = attackButtonHeight,
    text = 'back',
    x = love.graphics.getWidth() - (attackButtonWidth / 2),
    y = love.graphics.getHeight() - attackButtonHeight,
    onClick = function()
      Controller.sceneManager:pop()
    end,
  }),
  team = SimpleButton:new({
    width = attackButtonWidth / 2,
    height = attackButtonHeight,
    text = 'team',
    x = require('Utility').getCentered((attackButtonWidth / 2), love.graphics.getWidth()),
    y = love.graphics.getHeight() - attackButtonHeight,
  }),
})

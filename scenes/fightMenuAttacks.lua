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
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
  }),
  attack2 = SimpleButton:new({
    width = attackButtonWidth,
    height = attackButtonHeight,
    x = attackButton2ndRowX,
    y = attackButtonGap,
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
  }),
  attack3 = SimpleButton:new({
    width = attackButtonWidth,
    height = attackButtonHeight,
    x = attackButtonStartX,
    y = (love.graphics.getHeight() / 2),
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
  }),
  attack4 = SimpleButton:new({
    width = attackButtonWidth,
    height = attackButtonHeight,
    x = attackButton2ndRowX,
    y = (love.graphics.getHeight() / 2),
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
  }),
  inventory = SimpleButton:new({
    width = attackButtonWidth / 2,
    height = attackButtonHeight,
    text = 'inventory',
    x = 0,
    y = love.graphics.getHeight() - attackButtonHeight,
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
  }),
  back = SimpleButton:new({
    width = attackButtonWidth / 2,
    height = attackButtonHeight,
    text = 'back',
    x = love.graphics.getWidth() - (attackButtonWidth / 2),
    y = love.graphics.getHeight() - attackButtonHeight,
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
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
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
  }),
}, {
  onPush = function(self)
    self.attack1.texts = {
      Text:new(TEXT_POS.CENTERED, 'start', self.attack1.x, self.attack1.y, self.attack1.width, self.attack1.height, nil),
    }
    self.attack2.texts = {
      Text:new(TEXT_POS.CENTERED, 'start', self.attack2.x, self.attack2.y, self.attack2.width, self.attack2.height, nil),
    }
    self.attack3.texts = {
      Text:new(TEXT_POS.CENTERED, 'start', self.attack3.x, self.attack3.y, self.attack3.width, self.attack3.height, nil),
    }
    self.attack4.texts = {
      Text:new(TEXT_POS.CENTERED, 'start', self.attack4.x, self.attack4.y, self.attack4.width, self.attack4.height, nil),
    }
  end,
})

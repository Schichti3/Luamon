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
  InventoryButton = SimpleButton:new({
    width = attackButtonWidth / 2,
    height = attackButtonHeight,
    texts = {
      Text:new(TEXT_POS.CENTERED, 'inventory', 0, love.graphics.getHeight() - attackButtonHeight, attackButtonWidth / 2, attackButtonHeight, nil),
    },
    x = 0,
    y = love.graphics.getHeight() - attackButtonHeight,
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
  }),
  BackButton = SimpleButton:new({
    width = attackButtonWidth / 2,
    height = attackButtonHeight,
    text = 'back',
    texts = {
      Text:new(
        TEXT_POS.CENTERED,
        'back',
        love.graphics.getWidth() - (attackButtonWidth / 2),
        love.graphics.getHeight() - attackButtonHeight,
        attackButtonWidth / 2,
        attackButtonHeight,
        nil
      ),
    },
    x = love.graphics.getWidth() - (attackButtonWidth / 2),
    y = love.graphics.getHeight() - attackButtonHeight,
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
    onClick = function()
      Controller.sceneManager:pop()
      Controller.changeElementVariable('fightMenuMain', 'FightButton', 'visible', true)
      Controller.changeElementVariable('fightMenuMain', 'ExitButton', 'visible', true)
    end,
  }),
  TeamButton = SimpleButton:new({
    width = attackButtonWidth / 2,
    height = attackButtonHeight,
    texts = {
      Text:new(
        TEXT_POS.CENTERED,
        'team',
        require('Utility').getCentered((attackButtonWidth / 2), love.graphics.getWidth()),
        love.graphics.getHeight() - attackButtonHeight,
        attackButtonWidth / 2,
        attackButtonHeight,
        nil
      ),
    },
    x = require('Utility').getCentered((attackButtonWidth / 2), love.graphics.getWidth()),
    y = love.graphics.getHeight() - attackButtonHeight,
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
  }),
}, {
  onPush = function(self)
    local loadedLuamon = require('Luamon')['noah']
    self.attack1.texts = {
      Text:new(TEXT_POS.CENTERED, loadedLuamon.ability1.name, self.attack1.x, self.attack1.y, self.attack1.width, self.attack1.height, nil),
      Text:new(
        TEXT_POS.BOTTOMRIGHT,
        loadedLuamon.ability1:getUsesText(),
        self.attack1.x,
        self.attack1.y,
        self.attack1.width,
        self.attack1.height,
        { customText = true, gapToParentBorderX = self.attack1.borderWidth, gapToParentBorderY = self.attack1.borderWidth }
      ),
      Text:new(
        TEXT_POS.TOPLEFT,
        loadedLuamon.ability1.type,
        self.attack1.x,
        self.attack1.y,
        self.attack1.width,
        self.attack1.height,
        { gapToParentBorderX = self.attack2.borderWidth, gapToParentBorderY = self.attack2.borderWidth }
      ),
    }
    self.attack2.texts = {
      Text:new(TEXT_POS.CENTERED, loadedLuamon.ability2.name, self.attack2.x, self.attack2.y, self.attack2.width, self.attack2.height, nil),
      Text:new(
        TEXT_POS.BOTTOMRIGHT,
        loadedLuamon.ability2:getUsesText(),
        self.attack2.x,
        self.attack2.y,
        self.attack2.width,
        self.attack2.height,
        { customText = true, gapToParentBorderX = self.attack2.borderWidth, gapToParentBorderY = self.attack2.borderWidth }
      ),
      Text:new(
        TEXT_POS.TOPLEFT,
        loadedLuamon.ability2.type,
        self.attack2.x,
        self.attack2.y,
        self.attack2.width,
        self.attack2.height,
        { gapToParentBorderX = self.attack2.borderWidth, gapToParentBorderY = self.attack2.borderWidth }
      ),
    }
    self.attack3.texts = {
      Text:new(TEXT_POS.CENTERED, loadedLuamon.ability3.name, self.attack3.x, self.attack3.y, self.attack3.width, self.attack3.height, nil),
      Text:new(
        TEXT_POS.BOTTOMRIGHT,
        loadedLuamon.ability3:getUsesText(),
        self.attack3.x,
        self.attack3.y,
        self.attack3.width,
        self.attack3.height,
        { customText = true, gapToParentBorderX = self.attack3.borderWidth, gapToParentBorderY = self.attack3.borderWidth }
      ),
      Text:new(
        TEXT_POS.TOPLEFT,
        loadedLuamon.ability3.type,
        self.attack3.x,
        self.attack3.y,
        self.attack3.width,
        self.attack3.height,
        { gapToParentBorderX = self.attack3.borderWidth, gapToParentBorderY = self.attack3.borderWidth }
      ),
    }
    self.attack4.texts = {
      Text:new(TEXT_POS.CENTERED, loadedLuamon.ability4.name, self.attack4.x, self.attack4.y, self.attack4.width, self.attack4.height, nil),
      Text:new(
        TEXT_POS.BOTTOMRIGHT,
        loadedLuamon.ability4:getUsesText(),
        self.attack4.x,
        self.attack4.y,
        self.attack4.width,
        self.attack4.height,
        { customText = true, gapToParentBorderX = self.attack4.borderWidth, gapToParentBorderY = self.attack4.borderWidth }
      ),
      Text:new(
        TEXT_POS.TOPLEFT,
        loadedLuamon.ability4.type,
        self.attack4.x,
        self.attack4.y,
        self.attack4.width,
        self.attack4.height,
        { gapToParentBorderX = self.attack4.borderWidth, gapToParentBorderY = self.attack4.borderWidth }
      ),
    }
  end,
})

require('scenes.sceneRequirements')

local buttonWidth = love.graphics.getWidth() / 2 - love.graphics.getWidth() / 8
local buttonHeight = love.graphics.getHeight() / 2 - love.graphics.getHeight() / 3
local centeredX = require('Utility').getCentered(buttonWidth, love.graphics.getWidth())
local playerSpriteWidth = love.graphics.getWidth() / 4
local playerSpriteHeight = love.graphics.getHeight() / 3
local playerSpriteX = require('Utility').getCentered(playerSpriteWidth, love.graphics.getWidth() / 2)
local playerSpriteY = require('Utility').getCentered(playerSpriteHeight, love.graphics.getHeight())

return Scene:new({
  PlayerLuamonSprite = SpriteHolder:new(playerSpriteX, playerSpriteY, playerSpriteWidth, playerSpriteHeight, Sprites['noah'], SPRITE_POS.CENTERED),
  FightButton = SimpleButton:new({
    width = buttonWidth,
    height = buttonHeight,
    texts = {
      Text:new(
        TEXT_POS.CENTERED,
        'fight',
        require('Utility').getCentered(buttonWidth, love.graphics.getWidth()),
        love.graphics.getHeight() - buttonHeight,
        buttonWidth,
        buttonHeight,
        nil
      ),
    },
    x = centeredX,
    y = love.graphics.getHeight() - buttonHeight,
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
    onClick = function(self)
      Controller.changeElementVariable('fightMenuMain', 'FightButton', 'visible', false)
      Controller.changeElementVariable('fightMenuMain', 'ExitButton', 'visible', false)
      Controller.sceneManager:push('fightMenuAttacks')
    end,
  }),
  ExitButton = SimpleButton:new({
    width = buttonWidth / 2,
    height = buttonHeight,
    texts = {
      Text:new(
        TEXT_POS.CENTERED,
        'exit',
        love.graphics.getWidth() - (buttonWidth / 2),
        love.graphics.getHeight() - buttonHeight,
        buttonWidth / 2,
        buttonHeight,
        nil
      ),
    },
    x = love.graphics.getWidth() - (buttonWidth / 2),
    y = love.graphics.getHeight() - buttonHeight,
    color = { 247, 252, 252 },
    borderColor = { 255, 24, 20 },
    onClick = function(self)
      Controller.sceneManager:pop()
      Controller.sceneManager:push('mainMenu')
    end,
  }),
}, {})

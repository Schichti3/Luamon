require('scenes.sceneRequirements')

local buttonWidth = love.graphics.getWidth() / 3
local buttonGap = love.graphics.getHeight() * 0.3
local titleY = love.graphics.getHeight() / 6
local titleW = love.graphics.getWidth() / 2
local titleH = love.graphics.getHeight() / 4
local centeredX = require('Utility').getCentered(buttonWidth, love.graphics.getWidth())
local centeredY = require('Utility').getCentered(SimpleButton.height, love.graphics.getHeight())
local settingsY = require('Utility').getCentered(SimpleButton.height, love.graphics.getHeight() + buttonGap)

return Scene:new({
  TitleAnimation = SpriteHolder:new(
    require('Utility').getCentered(titleW, love.graphics.getWidth()),
    titleY,
    titleW,
    titleH,
    Sprite:new('idle', {
      idle = Animation:new('titleAnimated', 400, 150, 0.08, -0.0018), --https://cooltext.com/
    }, titleW / 400, titleH / 150),
    SPRITE_POS.TOPLEFT
  ),
  StartButton = SimpleButton:new({
    width = buttonWidth,
    x = centeredX,
    y = centeredY,
    texts = {
      Text:new(TEXT_POS.CENTERED, 'start', centeredX, centeredY, buttonWidth, SimpleButton.height, {}),
    },
    text = 'start',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function(self)
      -- self:onHover(false)
      Controller.sceneManager:pop()
      Controller.sceneManager:push('fightMenuMain')
    end,
  }),
  SettingsButton = SimpleButton:new({
    width = buttonWidth,
    x = require('Utility').getCentered(buttonWidth, love.graphics.getWidth()),
    y = settingsY,
    texts = {
      Text:new(TEXT_POS.CENTERED, 'settings', centeredX, settingsY, buttonWidth, SimpleButton.height, {}),
    },
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function()
      Controller.sceneManager:pop()
      Controller.sceneManager:push('settings')
    end,
  }),
})

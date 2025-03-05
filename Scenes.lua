local Scene = require('Scene')
local Sprite = require('Sprite')
local Animation = require('Animation')
local SimpleButton = require('SimpleButton')
local TextureButton = require('TextureButton')
local Controller = require('Controller')

local Scenes = {}

Scenes['mainMenu'] = Scene:new({
  spriteTest2 = Sprite:new(50, 50, 'idle', { idle = Animation:new('nohidance2', 84, 212, 0.2), attack = Animation:new('nohidance', 84, 212, 0.2) }),
  TitleAnimation = Sprite:new(require('Utility').getCentered(400, love.graphics.getWidth()), 100, 'idle', {
    idle = Animation:new('titleAnimated', 400, 150, 0.08, -0.0018),
  }),
  StartButton = SimpleButton:new({
    width = 200,
    x = require('Utility').getCentered(200, love.graphics.getWidth()),
    y = require('Utility').getCentered(SimpleButton.height, love.graphics.getHeight()),
    text = 'Start',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
  }),
  SettingsButton = SimpleButton:new({
    width = 200,
    x = require('Utility').getCentered(200, love.graphics.getWidth()),
    y = require('Utility').getCentered(SimpleButton.height, love.graphics.getHeight() + 180),
    text = 'Settings',
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
Scenes['settings'] = Scene:new({
  BackButton = SimpleButton:new({
    width = 200,
    x = require('Utility').getCentered(200, love.graphics.getWidth()),
    y = require('Utility').getCentered(SimpleButton.height, love.graphics.getHeight() + 180),
    text = 'Back',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function()
      Controller.sceneManager:pop()
      Controller.sceneManager:push('mainMenu')
    end,
  }),
})

Scenes['fightMain'] = {}
Scenes['fightAttacks'] = Scene:new({
  attack1 = SimpleButton:new({
    x = 200,
    y = 200,
    text = 'attack1',
    onClick = function()
      Controller.changeElementVariable('fightAttacks', 'attack1', 'text', 'clicked')
    end,
  }),
})
Scenes['fightLuamonSelection'] = {}
Scenes['fightInventory'] = {}

return Scenes

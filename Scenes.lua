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
    idle = Animation:new('titleAnimated', 400, 150, 0.0000001),
  }),
  StartButton = SimpleButton:new({
    width = 200,
    x = require('Utility').getCentered(200, love.graphics.getWidth()),
    y = require('Utility').getCentered(SimpleButton.height, love.graphics.getHeight()),
    text = 'Start',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 192, 192, 192 },
    textColor = { 0, 0, 0 },
  }),
})
Scenes['settings'] = {}
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

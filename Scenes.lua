local Scene = require('Scene')
local Sprite = require('Sprite')
local Animation = require('Animation')
local SimpleButton = require('SimpleButton')
local TextureButton = require('TextureButton')
local Controller = require('Controller')

local Scenes = {}

Scenes['mainMenu'] = Scene:new({
  playButton = TextureButton:new({
    x = 200,
    y = 300,
    defaultTextureName = 'playButtonDefault',
    mouseDownTextureName = 'playButtonMouseDown',
    hoverTextureName = 'playButtonHover',
    onMouseUp = function()
      Controller.changeSpriteAnimation('mainMenu', 'spriteTest2', 'idle')
    end,
    onClick = function()
      Controller.sceneManager:push('fightAttacks')
    end,
  }),
  spriteTest2 = Sprite:new(50, 50, 'idle', { idle = Animation:new('nohidance2', 84, 0.2), attack = Animation:new('nohidance', 84, 0.2) }),
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

local Scene = require('Scene')
local Sprite = require('Sprite')
local Animation = require('Animation')
local SimpleButton = require('SimpleButton')
local TextureButton = require('TextureButton')
local Controller = require('Controller')

local Scenes = {}
Scenes['mainMenu'] = require('Scenes.mainMenu')
Scenes['settings'] = require('Scenes.settings')
Scenes['fightMain'] = {}
Scenes['fightAttacks'] = Scene:new({
  attack1 = SimpleButton:new({
    x = 200,
    y = 200,
    text = 'attack1',
    onClick = function(self)
      self.text = 'clicked'
    end,
  }),
})
Scenes['fightLuamonSelection'] = {}
Scenes['fightInventory'] = {}

return Scenes

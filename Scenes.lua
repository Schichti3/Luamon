local Scene = require('Scene')
local Animation = require('Animation')
local SimpleButton = require('SimpleButton')
local TextureButton = require('TextureButton')
local Scenes = {}

Scenes['mainMenu'] = Scene:new({
  playButton = TextureButton:new({
    x = 200,
    y = 300,
    defaultTextureName = 'playButtonDefault',
    mouseDownTextureName = 'playButtonMouseDown',
    hoverTextureName = 'playButtonHover',
  }),
  spriteTest = Animation:new({ x = 50, y = 50, spritesheetName = 'nohidance2', timePerFrame = 0.2, frameWidth = 84 }),
})
Scenes['settings'] = {}
Scenes['fightMain'] = {}
Scenes['fightAttacks'] = {}
Scenes['fightLuamonSelection'] = {}
Scenes['fightInventory'] = {}

return Scenes

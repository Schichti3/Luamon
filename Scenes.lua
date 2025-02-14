local SimpleButton = require('SimpleButton')
local TextureButton = require('TextureButton')
local Scenes = {}

Scenes["mainMenu"] = {

playButton = TextureButton:new({
	x = 200,
	y = 300,
	defaultTextureName = "playButtonDefault",
	mouseDownTextureName = "playButtonMouseDown",
	hoverTextureName = "playButtonHover",
})
}
Scenes["settings"] = {}
Scenes["fightMain"] = {}
Scenes["fightAttacks"] = {}
Scenes["fightLuamonSelection"] = {}
Scenes["fightInventory"] = {}

return Scenes

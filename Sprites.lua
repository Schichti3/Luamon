local Sprite = require('Sprite')
local Animation = require('Animation')

local Sprites = {}

Sprites['noah'] = Sprite:new(
  'idle',
  { idle = Animation:new('nohidance2', 84, 212, 0.2), attack = Animation:new('nohidance2', 84, 212, 0.2) },
  1,
  1,
  { keepAspectRatio = true }
)

return Sprites

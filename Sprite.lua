local Sprite = setmetatable({}, { __index = require('Element') })

Sprite.animations = {}

function Sprite:new(templateTable) end

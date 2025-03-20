local Sprites = require('Sprites')
local Abilities = require('Abilities')
local Luamon = {}

local function createLuamon(luamonName, type1, type2, statsPerLevel, sprite, ability1, ability2, ability3, ability4)
  Luamon[luamonName] = {
    type1 = type1,
    type2 = type2,
    statsPerLevel = statsPerLevel,
    sprite = sprite,
    currentLevel = 1,
    currentXP = 0,
    currentHP = 0,
    ability1 = ability1,
    ability2 = ability2,
    ability3 = ability3,
    ability4 = ability4,
  }
end

local function defineStats(hp, xpForLvlUp, baseAtkMultiplicator, baseCritMultiplicator, canLearnAttackWhenReached)
  return {
    hp = hp,
    xpForLvlUp = xpForLvlUp,
    baseAtkMultiplicator = baseAtkMultiplicator,
    baseCritMultiplicator,
    canLearnAttackWhenReached = canLearnAttackWhenReached,
  }
end

createLuamon(
  'noah',
  'normal',
  nil,
  { defineStats(100, 100, 0.1, 0.05, nil), defineStats(110, 110, 0.1, 0.05, nil) },
  Sprites['noah'],
  Abilities['tackle'],
  Abilities['none'],
  Abilities['none'],
  Abilities['none']
)

return Luamon

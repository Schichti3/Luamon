local Abilities = {}

local function defineAbility(name, maxUses, type, damage, critical, effect)
  Abilities[name] = { name = name, maxUses = maxUses, type = type, damage = damage, critical = critical, effect = effect, currentUses = maxUses }
end

defineAbility('tackle', 20, 'normal', 40, 0.2, nil)

return Abilities

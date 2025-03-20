local Abilities = {}

local function defineAbility(name, maxUses, type, damage, critical, effect)
  Abilities[name] = { name = name, maxUses = maxUses, type = type, damage = damage, critical = critical, effect = effect, currentUses = maxUses }

  Abilities[name].getUsesText = function(self)
    if self.maxUses > 0 and self.currentUses >= 0 then
      return self.currentUses .. '/' .. self.maxUses
    else
      return ' '
    end
  end
end

defineAbility('none', 0, 'whitespace', 0, 0, nil)
defineAbility('tackle', 20, 'normal', 40, 0.2, nil)

return Abilities

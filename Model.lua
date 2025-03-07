require('Constants')
local Model = {}

Model.config = {
  windowWidth = { value = nil, default = 800 },
  windowHeight = { value = nil, default = 600 },
  windowMode = { value = nil, default = WINDOW_MODE.WINDOWED },
  fullscreen = { value = nil, default = false },
  borderless = { value = nil, default = false },
}

function Model:changeConfig(configName, value)
  if self.config[configName] ~= nil then
    self.config[configName].value = value
  else
    error('changeConfig: configName not found')
  end
end

function Model:getConfigValue(configName)
  if self.config[configName] ~= nil then
    if self.config[configName].value ~= nil then
      return self.config[configName].value
    else
      return self.config[configName].default
    end
  end
  error('getConfigValue: configName not found')
end

return Model

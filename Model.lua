require('Constants')
local Model = {}

Model.texts = {
  german = {
    start = 'Start',
    settings = 'Einstellungen',
    back = 'Zurück',
    fullscreenOn = 'Vollbild an',
    fullscreenOff = 'Vollbild aus',
    german = 'Deutsch',
    english = 'Englisch',
    inventory = 'Inventar',
    team = 'Team',
  },
  english = {
    start = 'Start',
    settings = 'Settings',
    back = 'Back',
    fullscreenOn = 'Fullscreen on',
    fullscreenOff = 'Fullscreen off',
    german = 'German',
    english = 'English',
    inventory = 'Inventory',
    team = 'Team',
  },
}

Model.config = {
  textsLanguage = 'german',
  windowWidth = { value = nil, default = 800 },
  windowHeight = { value = nil, default = 600 },
  windowMode = { value = nil, default = WINDOW_MODE.WINDOWED },
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

function Model:getText(textName)
  local text = self.texts[self.config.textsLanguage][textName]
  if text then
    return text
  else
    return 'TextNotFound: ' .. textName
  end
end

function Model:changeLanguage(languageName)
  if self.texts[languageName] then
    self.config.textsLanguage = languageName
  end
end

return Model

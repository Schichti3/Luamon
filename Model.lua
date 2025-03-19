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
    tackle = 'Tackle',
    normal = 'Normal',
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
    tackle = 'Tackle',
    normal = 'Normal',
  },
}

Model.configDefaults = {
  textsLanguage = 'english',
  windowWidth = 800,
  windowHeight = 600,
  windowMode = WINDOW_MODE.WINDOWED,
}

Model.config = {
  textsLanguage = Model.configDefaults.textsLanguage,
  windowWidth = Model.configDefaults.windowWidth,
  windowHeight = Model.configDefaults.windowHeight,
  windowMode = Model.configDefaults.windowMode,
}

function Model:changeConfig(changes)
  for configName, value in pairs(changes) do
    if self.config[configName] then
      self.config[configName] = value
    else
      error('changeConfig: configName"' .. configName .. '" not found')
    end
  end
  self.saveToFile(self.config, 'config.lua')
end

function Model:getConfigValue(configName)
  if self.config[configName] ~= nil then
    if self.config[configName] ~= nil then
      return self.config[configName]
    else
      error('getConfigValue: value is nil')
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
    self.saveToFile(self.config, 'config.lua')
  end
end

function Model:loadConfig()
  local loadedFile, err = love.filesystem.load('config.lua')
  if not err then
    local loadedConfig = loadedFile()
    for key, value in pairs(loadedConfig) do
      if self.config[key] ~= nil then
        if type(self.config[key]) == type(value) then
          self.config[key] = value
        end
      end
    end
  end
end

function Model.saveToFile(t, file, recursiveCall, contentsString)
  local contents
  if not recursiveCall then
    contents = 'return {'
  else
    contents = contentsString
  end

  for key, value in pairs(t) do
    if type(value) == 'number' or type(value) == 'nil' then
      contents = contents .. key .. '=' .. value .. ','
    end
    if type(value) == 'string' then
      contents = contents .. key .. '="' .. value .. '",'
    end
    if type(value) == 'table' then
      contents = contents .. key .. '= {'
      Model.saveToFile(value, file, true, contents)
      contents = contents .. '},'
    end
  end

  if not recursiveCall then
    contents = contents .. '}'
    love.filesystem.write(file, contents)
  end
end

return Model

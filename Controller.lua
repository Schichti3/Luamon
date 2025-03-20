require('Constants')
local Controller = {}

Controller.assetManager = require('AssetManager')
Controller.sceneManager = require('SceneManager')
Controller.model = require('Model')

Controller.textHolderReferences = {}

function Controller.changeElementVariable(sceneName, elementName, variableName, value)
  local Scenes = require('Scenes')
  if Scenes[sceneName] == nil then
    error('changeElementVariable failed, sceneName: ' .. sceneName .. ' is invalid')
  end
  if Scenes[sceneName][elementName] == nil then
    error('changeElementVariable failed, elementName: ' .. elementName .. ' is invalid')
  end
  if Scenes[sceneName][elementName][variableName] == nil then
    error('changeElementVariable failed, variableName: ' .. variableName .. ' is invalid')
  end

  Scenes[sceneName][elementName][variableName] = value
end

function Controller.changeSpriteAnimation(sceneName, spriteName, animationName)
  local Scenes = require('Scenes')
  if not Scenes[sceneName] then
    error('changeSpriteAnimation failed, sceneName: ' .. sceneName .. ' is invalid')
  end
  if not Scenes[sceneName][spriteName] then
    error('changeSpriteAnimation failed, spriteName: ' .. spriteName .. ' is invalid')
  end
  if not Scenes[sceneName][spriteName].animations[animationName] then
    error('changeSpriteAnimation failed, animationName: ' .. animationName .. ' is invalid')
  end

  Scenes[sceneName][spriteName].activeAnimation = animationName
end

function Controller:initWindow()
  local windowMode = self.model:getConfigValue('windowMode')
  local w = self.model:getConfigValue('windowWidth')
  local h = self.model:getConfigValue('windowHeight')
  if windowMode == WINDOW_MODE.WINDOWED then
    love.window.setMode(w, h, { fullscreen = false, borderless = false, resizable = true })
  elseif windowMode == WINDOW_MODE.FULLSCREEN then
    love.window.setMode(w, h, { fullscreen = true, fullscreentype = 'exclusive', resizable = true })
  elseif windowMode == WINDOW_MODE.BORDERLESS_FULLSCREEN then
    love.window.setMode(w, h, { fullscreen = true, fullscreentype = 'desktop', resizable = true })
  end
end

function Controller:changeResolution(width, height)
  self.model:changeConfig({ windowWidth = width, windowHeight = height })
end

function Controller:changeWindowMode(mode)
  if mode == WINDOW_MODE.WINDOWED then
    local w = self.model:getConfigValue('windowWidth')
    local h = self.model:getConfigValue('windowHeight')
    local fullscreenW, fullscreenH = love.window.getDesktopDimensions()
    if h == fullscreenH then
      -- local winW, winH = love.graphics.getDimensions()
      -- h = fullscreenH - (fullscreenH - winH)
      h = fullscreenH - 60
    end
    love.window.setMode(w, h, { fullscreen = false, borderless = false, resizable = true })
    love.resize(w, h)
    self.model:changeConfig({ windowHeight = h, windowMode = WINDOW_MODE.WINDOWED })
  elseif mode == WINDOW_MODE.FULLSCREEN then
    local w, h = love.window.getDesktopDimensions()
    love.window.setMode(w, h, { fullscreen = true, fullscreentype = 'exclusive', resizable = true })
    love.resize(w, h)
    self.model:changeConfig({ windowMode = WINDOW_MODE.FULLSCREEN, windowWidth = w, windowHeight = h })
  elseif mode == WINDOW_MODE.BORDERLESS_FULLSCREEN then
    local w, h = love.window.getDesktopDimensions()
    love.window.setMode(w, h, { fullscreen = true, fullscreentype = 'desktop', resizable = true })
    love.resize(w, h)
    self.model:changeConfig({ windowMode = WINDOW_MODE.BORDERLESS_FULLSCREEN, windowWidth = w, windowHeight = h })
  end
end

function Controller:getText(textName)
  return self.model:getText(textName)
end

function Controller:getConfigValue(configName)
  return self.model:getConfigValue(configName)
end

function Controller:changeLanguage(languageName)
  self.model:changeLanguage(languageName)
  --Note: resizing elements, because the text might have different sizes now!!!
  --change will be necessary, when a real external saving logic is implemented
  self.sceneManager:resize(
    self.model:getConfigValue('windowWidth'),
    self.model:getConfigValue('windowHeight'),
    self.model:getConfigValue('windowWidth'),
    self.model:getConfigValue('windowHeight')
  )
end

function Controller:loadConfig()
  self.model:loadConfig()
end

return Controller

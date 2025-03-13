require('Constants')
local Controller = {}

Controller.assetManager = require('AssetManager')
Controller.sceneManager = require('SceneManager')
Controller.model = require('Model')

Controller.textHolderReferences = {}

function Controller.changeElementVariable(sceneName, elementName, variableName, value)
  local Scenes = require('Scenes')
  if not Scenes[sceneName] then
    error('changeElementVariable failed, sceneName: ' .. sceneName .. ' is invalid')
  end
  if not Scenes[sceneName][elementName] then
    error('changeElementVariable failed, elementName: ' .. elementName .. ' is invalid')
  end
  if not Scenes[sceneName][elementName][variableName] then
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

function Controller:changeResolution(width, height)
  love.window.setMode(width, height, { borderless = self.model:getConfigValue('borderless'), fullscreen = self.model:getConfigValue('fullscreen') })
  self.model:changeConfig('windowWidth', width)
  self.model:changeConfig('windowHeight', height)
end

function Controller:changeWindowMode(mode)
  if mode == WINDOW_MODE.WINDOWED then
    local w = self.model:getConfigValue('windowWidth')
    local h = self.model:getConfigValue('windowHeight')
    love.window.setMode(w, h, { fullscreen = false, resizable = true })
    self.model:changeConfig('windowMode', WINDOW_MODE.WINDOWED)
    love.resize(w, h)
  elseif mode == WINDOW_MODE.FULLSCREEN then
    local w, h = love.window.getDesktopDimensions()
    love.window.setMode(w, h, { fullscreen = true, fullscreentype = 'exclusive', resizable = true })
    self.model:changeConfig('windowMode', WINDOW_MODE.FULLSCREEN)
    love.resize(w, h)
  elseif mode == WINDOW_MODE.BORDERLESS_FULLSCREEN then
    local w, h = love.window.getDesktopDimensions()
    love.window.setMode(w, h, { fullscreen = true, fullscreentype = 'desktop', resizable = true })
    self.model:changeConfig('windowMode', WINDOW_MODE.BORDERLESS_FULLSCREEN)
    love.resize(w, h)
  end
end

function Controller:getText(textName)
  local text = self.model:getText(textName)
  if text then
    return text
  else
    return 'TextNotFound: ' .. textName
  end
end

function Controller:getConfigValue(configName)
  return self.model:getConfigValue(configName)
end

function Controller:changeLanguage(languageName)
  self.model:changeLanguage(languageName)
  --Note: resizing elements, because the text might have different sizes now!!!
  --change will be necessary, when a real external saving logic is implemented
  -- self.sceneManager:resize(800, 600, 800, 600)
end

return Controller

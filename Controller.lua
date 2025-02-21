local Controller = {}

Controller.assetManager = require('AssetManager')
Controller.sceneManager = require('SceneManager')

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

return Controller

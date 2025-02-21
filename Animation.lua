local AssetManager = require('AssetManager')
local Animation = {}

Animation.spritesheetName = ''
Animation.quad = nil
Animation.frameHeight = 0
Animation.frameWidth = 0
Animation.frameIndex = 1
Animation.frameCount = 0
Animation.timePerFrame = 1
Animation.timeOnCurrentFrame = 0

function Animation:new(spritesheetName, frameWidth, timePerFrame)
  local obj = { spritesheetName = spritesheetName, frameWidth = frameWidth, timePerFrame = timePerFrame }
  setmetatable(obj, self)
  self.__index = self
  obj.frameHeight = AssetManager:getTexture(obj.spritesheetName):getHeight()
  obj.frameCount = AssetManager:getTexture(obj.spritesheetName):getWidth() / obj.frameWidth
  obj.quad = love.graphics.newQuad(
    0,
    0,
    obj.frameWidth,
    obj.frameHeight,
    AssetManager:getTexture(obj.spritesheetName):getWidth(),
    AssetManager:getTexture(obj.spritesheetName):getHeight()
  )
  return obj
end

function Animation:draw(x, y)
  love.graphics.draw(AssetManager:getTexture(self.spritesheetName), self.quad, x, y)
end

function Animation:update(dt)
  self.timeOnCurrentFrame = self.timeOnCurrentFrame + dt
  if self.timeOnCurrentFrame >= self.timePerFrame then
    self.timeOnCurrentFrame = 0
    self.frameIndex = self.frameIndex + 1
    if self.frameIndex > self.frameCount then
      self.frameIndex = 1
    end
    self.quad:setViewport((self.frameIndex - 1) * self.frameWidth, 0, self.frameWidth, self.frameHeight)
  end
end

return Animation

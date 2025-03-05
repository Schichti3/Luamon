local AssetManager = require('AssetManager')
local Animation = {}

Animation.spritesheetName = ''
Animation.quad = nil
Animation.frameHeight = 0
Animation.frameWidth = 0
Animation.frameRowIndex = 1
Animation.framesPerRowIndex = 1
Animation.framesPerRow = 0
Animation.framesRowCount = 0
Animation.baseTimePerFrame = 1
Animation.timePerFrame = Animation.baseTimePerFrame
Animation.timeOnCurrentFrame = 0
Animation.frameTimeAcceleration = 0

function Animation:new(spritesheetName, frameWidth, frameHeight, baseTimePerFrame, frameTimeAcceleration)
  local obj = {
    spritesheetName = spritesheetName,
    frameWidth = frameWidth,
    frameHeight = frameHeight,
    baseTimePerFrame = baseTimePerFrame,
    timePerFrame = baseTimePerFrame,
    frameTimeAcceleration = frameTimeAcceleration,
  }
  setmetatable(obj, self)
  self.__index = self
  obj.framesPerRow = AssetManager:getTexture(obj.spritesheetName):getWidth() / obj.frameWidth
  obj.framesRowCount = AssetManager:getTexture(obj.spritesheetName):getHeight() / obj.frameHeight
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
    self.timePerFrame = self.timePerFrame + self.frameTimeAcceleration
    self.timeOnCurrentFrame = 0
    self.framesPerRowIndex = self.framesPerRowIndex + 1
    if self.framesPerRowIndex > self.framesPerRow then
      self.framesPerRowIndex = 1
      self.frameRowIndex = self.frameRowIndex + 1
    end
    if self.frameRowIndex > self.framesRowCount then
      self.frameRowIndex = 1
      if self.frameTimeAcceleration ~= 0 then
        self.timePerFrame = self.baseTimePerFrame
      end
    end
    self.quad:setViewport((self.framesPerRowIndex - 1) * self.frameWidth, (self.frameRowIndex - 1) * self.frameHeight, self.frameWidth, self.frameHeight)
  end
end

return Animation

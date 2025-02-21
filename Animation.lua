local AssetManager = require('AssetManager')
local Animation = setmetatable({}, { __index = require('Element') })

Animation.spritesheetName = ''
Animation.quad = nil
Animation.frameHeight = 0
Animation.frameWidth = 0
Animation.frameIndex = 1
Animation.frameCount = 0
Animation.timePerFrame = 0.2
Animation.timeOnCurrentFrame = 0

function Animation:new(templateTable)
  local obj = templateTable or {}
  setmetatable(obj, self)
  self.__index = self
  if obj.spritesheetName ~= '' then
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
  else
    error('Trying to create a new sprite without a spritesheetName')
  end
  return obj
end

function Animation:draw()
  love.graphics.draw(AssetManager:getTexture(self.spritesheetName), self.quad, self.x, self.y)
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

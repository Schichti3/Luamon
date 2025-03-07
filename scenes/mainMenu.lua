require('scenes.sceneRequirements')

return Scene:new({
  spriteTest2 = Sprite:new(50, 50, 'idle', { idle = Animation:new('nohidance2', 84, 212, 0.2), attack = Animation:new('nohidance', 84, 212, 0.2) }),
  TitleAnimation = Sprite:new(require('Utility').getCentered(400, love.graphics.getWidth()), 100, 'idle', {
    idle = Animation:new('titleAnimated', 400, 150, 0.08, -0.0018),
  }),
  StartButton = SimpleButton:new({
    width = 200,
    x = require('Utility').getCentered(200, love.graphics.getWidth()),
    y = require('Utility').getCentered(SimpleButton.height, love.graphics.getHeight()),
    text = 'Start',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onHover = function(self, hoveredOn)
      if hoveredOn then
        self.color = { 122, 122, 121 }
      else
        self.color = { 247, 252, 252 }
      end
    end,
  }),
  SettingsButton = SimpleButton:new({
    width = 200,
    x = require('Utility').getCentered(200, love.graphics.getWidth()),
    y = require('Utility').getCentered(SimpleButton.height, love.graphics.getHeight() + 180),
    text = 'Settings',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function()
      Controller.sceneManager:pop()
      Controller.sceneManager:push('settings')
    end,
    onHover = function(self, hoveredOn)
      if hoveredOn then
        self.color = { 122, 122, 121 }
      else
        self.color = { 247, 252, 252 }
      end
    end,
  }),
})

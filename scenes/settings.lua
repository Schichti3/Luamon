require('scenes.sceneRequirements')

return Scene:new({
  BackButton = SimpleButton:new({
    width = 200,
    x = love.graphics.getWidth() - 200 - 20,
    y = love.graphics.getHeight() - SimpleButton.height - 20,
    text = 'Zurück',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function()
      Controller.sceneManager:pop()
      Controller.sceneManager:push('mainMenu')
    end,
    onHover = function(self, hoveredOn)
      if hoveredOn then
        self.color = { 122, 122, 121 }
      else
        self.color = { 247, 252, 252 }
      end
    end,
  }),
  FullScreenToggle = SimpleButton:new({
    width = 200,
    x = 20,
    y = 20,
    text = 'Vollbild an',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function(self)
      if self.text == 'Vollbild an' then
        Controller:changeWindowMode(WINDOW_MODE.FULLSCREEN)
        self.text = 'Vollbild aus'
      else
        Controller:changeWindowMode(WINDOW_MODE.WINDOWED)
        self.text = 'Vollbild an'
      end
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

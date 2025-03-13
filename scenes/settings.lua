require('scenes.sceneRequirements')

local buttonWidth = love.graphics.getWidth() / 3
local buttonPadding = love.graphics.getWidth() / 30

return Scene:new({
  BackButton = SimpleButton:new({
    width = buttonWidth,
    x = love.graphics.getWidth() - buttonWidth - buttonPadding,
    y = love.graphics.getHeight() - SimpleButton.height - buttonPadding,
    text = 'back',
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
    width = buttonWidth,
    x = buttonPadding,
    y = buttonPadding,
    text = 'fullscreenOn',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function(self)
      if self.text == 'fullscreenOn' then
        Controller:changeWindowMode(WINDOW_MODE.FULLSCREEN)
        self.text = 'fullscreenOff'
      else
        Controller:changeWindowMode(WINDOW_MODE.WINDOWED)
        self.text = 'fullscreenOn'
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
  LanguageChange = SimpleButton:new({
    width = buttonWidth,
    x = love.graphics.getWidth() - buttonWidth - buttonPadding,
    y = buttonPadding,
    text = 'german',
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function(self)
      if self.text == 'german' then
        self.text = 'english'
        Controller:changeLanguage('english')
      else
        self.text = 'german'
        Controller:changeLanguage('german')
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

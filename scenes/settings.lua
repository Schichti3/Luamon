require('scenes.sceneRequirements')

local buttonWidth = love.graphics.getWidth() / 3
local buttonPadding = love.graphics.getWidth() / 30

return Scene:new({
  BackButton = SimpleButton:new({
    width = buttonWidth,
    x = love.graphics.getWidth() - buttonWidth - buttonPadding,
    y = love.graphics.getHeight() - SimpleButton.height - buttonPadding,
    texts = {
      Text:new(
        TEXT_POS.CENTERED,
        'back',
        love.graphics.getWidth() - buttonWidth - buttonPadding,
        love.graphics.getHeight() - SimpleButton.height - buttonPadding,
        buttonWidth,
        SimpleButton.height,
        {}
      ),
    },
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
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function(self)
      if self.texts[1].textName == 'fullscreenOn' then
        Controller:changeWindowMode(WINDOW_MODE.FULLSCREEN)
        self.texts[1].textName = 'fullscreenOff'
      else
        Controller:changeWindowMode(WINDOW_MODE.WINDOWED)
        self.texts[1].textName = 'fullscreenOn'
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
    borderColor = { 255, 24, 20 },
    borderWidth = 4,
    color = { 247, 252, 252 },
    textColor = { 0, 0, 0 },
    onClick = function(self)
      if self.texts[1].textName == 'german' then
        self.texts[1].textName = 'english'
        Controller:changeLanguage('english')
      else
        self.texts[1].textName = 'german'
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
}, {
  onPush = function(self)
    if Controller:getConfigValue('windowMode') == WINDOW_MODE.FULLSCREEN then
      self.FullScreenToggle.texts = {
        Text:new(
          TEXT_POS.CENTERED,
          'fullscreenOff',
          self.FullScreenToggle.x,
          self.FullScreenToggle.y,
          self.FullScreenToggle.width,
          self.FullScreenToggle.height,
          {}
        ),
      }
    else
      self.FullScreenToggle.texts = {
        Text:new(
          TEXT_POS.CENTERED,
          'fullscreenOn',
          self.FullScreenToggle.x,
          self.FullScreenToggle.y,
          self.FullScreenToggle.width,
          self.FullScreenToggle.height,
          {}
        ),
      }
    end
    if Controller:getConfigValue('textsLanguage') == 'german' then
      self.LanguageChange.texts = {
        Text:new(TEXT_POS.CENTERED, 'german', self.LanguageChange.x, self.LanguageChange.y, self.LanguageChange.width, self.LanguageChange.height, {}),
      }
    elseif Controller:getConfigValue('textsLanguage') == 'english' then
      self.LanguageChange.texts = {
        Text:new(TEXT_POS.CENTERED, 'english', self.LanguageChange.x, self.LanguageChange.y, self.LanguageChange.width, self.LanguageChange.height, {}),
      }
    end
  end,
})

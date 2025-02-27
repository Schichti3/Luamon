Scenes['mainMenu'] = Scene:new({
  playButton = TextureButton:new({
    x = 200,
    y = 300,
    defaultTextureName = 'playButtonDefault',
    mouseDownTextureName = 'playButtonMouseDown',
    hoverTextureName = 'playButtonHover',
    onMouseDown = function()
      Controller.changeSpriteAnimation('mainMenu', 'spriteTest2', 'attack')
    end,
    onMouseUp = function()
      Controller.changeSpriteAnimation('mainMenu', 'spriteTest2', 'idle')
    end,
    onClick = function()
      Controller.sceneManager:push('fightAttacks')
    end,
  }),
  spriteTest2 = Sprite:new(50, 50, 'idle', { idle = Animation:new('nohidance2', 84, 0.2), attack = Animation:new('nohidance', 84, 0.2) }),
})

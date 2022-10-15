require('tables')

buttonx = 300
buttony = 100
fontScale = love.graphics.newFont("fonts/Monocraft.otf", 20)
mainMenuMusic = love.audio.newSource("sounds/MainMenuMusic.wav", "stream")
isOnPlayButton = false

function love.load()
  --Charger le curseur
  mouse.cursor = love.graphics.newImage("images/cursor.png")
  
  --Charger le logo
  logo = love.graphics.newImage("images/logo.png")
end

function love.draw()
  if scene.isOnMenu == true then
    
    --Jouer la musique
    love.audio.play(mainMenuMusic)
    
    --Si la souris touche le bouton
    collidesWithButton()
    
    --Dessiner bouton 1
    createButton()
    
    --Définir couleur du curseur
    love.graphics.setColor(1, 0, 0)
  end
  --Dessiner le curseur <TOUJOURS EN DERNIER>
  love.graphics.draw(mouse.cursor, mouse.x, mouse.y)
end

function love.update(dt)
  mouse.x = love.mouse.getX()
  mouse.y = love.mouse.getY()
  
end

function love.keypressed(key)
   if key == "space" then
      local state = not love.mouse.isVisible()   -- the opposite of whatever it currently is
      love.mouse.setVisible(state)
   end
end

function createButton()
  button = love.graphics.rectangle("fill", buttonx, buttony, 200, 40)
  
  love.graphics.setColor(0.1, 0, 0)
  love.graphics.setFont(fontScale)
  love.graphics.print("Jouer", buttonx + 68, buttony + 8)
end

function collidesWithButton()
  if math.abs(mouse.x - buttonx) < 200 and math.abs(mouse.y - buttony) < 40 then
    love.graphics.setColor(1, 0.8, 0.9)
    isOnPlayButton = true
  else
    love.graphics.setColor(1, 1, 1)
    isOnPlayButton = false
  end
end

function love.mousepressed(x, y, button)
  if button == 1 and isOnPlayButton == true then
    scene.isOnMenu = false
  end
end
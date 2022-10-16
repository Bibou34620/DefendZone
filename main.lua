require('tables')

buttonplayx = 300
buttonplayy = 180

buttonquitx = 300
buttonquity = 280

buttonFont = love.graphics.newFont("fonts/Monocraft.otf", 20)
astuceFont = love.graphics.newFont("fonts/Monocraft.otf", 15)
mainMenuMusic = love.audio.newSource("sounds/MainMenuMusic.wav", "stream")
isOnPlayButton = false

function love.load()
  --Charger le curseur
  mouse.cursor = love.graphics.newImage("images/cursor.png")
  
  --Charger le logo
  logo = love.graphics.newImage("images/logo.png")
  
  --Charger le background
  bg = love.graphics.newImage("images/background.png")
  
  --Charger zone
  zone = love.graphics.newImage("images/zone.png")
end

function love.draw()
  if scene.isOnMenu == true then
    
    --Jouer la musique
    love.audio.play(mainMenuMusic)
    
    --Si la souris touche le bouton
    collidesWithPlayButton()
    
    collidesWithQuitButton()
    
    --Dessiner bouton Play
    createPlayButton()
    
    --Dessiner bouton Quit
    createQuitButton()
    
    drawAstuce()
    
    setCursorColor()
  
  end
  
  if scene.isOnGame == true then
    
    love.graphics.setColor(1, 1, 1)
    
    love.audio.stop(mainMenuMusic)
    
    --Dessiner le background
    love.graphics.draw(bg)
    
    --Dessiner la zone
    love.graphics.draw(zone, 50)
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

function createPlayButton()
  love.graphics.setColor(1, 1, 1)
  
  button = love.graphics.rectangle("fill", buttonplayx, buttonplayy, 200, 40)
  
  love.graphics.setColor(0.1, 0, 0)
  love.graphics.setFont(buttonFont)
  love.graphics.print("Jouer !", buttonplayx + 61, buttonplayy + 8)
end

function createQuitButton()
  
  love.graphics.setColor(1, 1, 1)
  
  buttonquit = love.graphics.rectangle("fill", buttonquitx, buttonquity, 200, 40)
  
  love.graphics.setColor(0.1, 0, 0)
  love.graphics.setFont(buttonFont)
  love.graphics.print("Quitter", buttonquitx + 58, buttonquity + 8)
end

function collidesWithPlayButton()
  if math.abs(mouse.x - buttonplayx) < 200 and math.abs(mouse.y - buttonplayy) < 40 then
    isOnPlayButton = true
  else
    isOnPlayButton = false
  end
end

function collidesWithQuitButton()
  if math.abs(mouse.x - buttonquitx) < 200 and math.abs(mouse.y - buttonquity) < 40 then
    isOnQuitButton = true
  else
    isOnQuitButton = false
  end
end

function love.mousepressed(x, y, button)
  if button == 1 and isOnPlayButton == true then
    scene.isOnMenu = false
    scene.isOnGame = true
  end
  
  if button == 1 and isOnQuitButton == true then
    love.event.quit()
  end
end

function drawAstuce()
  love.graphics.setColor(1, 1, 1)
  
  love.graphics.setFont(astuceFont)
  
  love.graphics.print("Astuce: Appuyez sur Espace pour Cacher/Afficher le curseur", 120, 500)
end

function setCursorColor()
  --Définir couleur du curseur
  love.graphics.setColor(1, 0, 0)
end
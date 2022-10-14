require('tables')

function love.load()
  --Charger le curseur
  mouse.cursor = love.mouse.newCursor("images/cursor.png")
  
  --Charger le logo
  logo = love.graphics.newImage("images/logo.png")
end

function love.draw()
  --Dessiner le curseur
  love.mouse.setCursor(mouse.cursor)
  
  --Dessiner le logo
  love.graphics.draw(logo)
end

function love.update(dt)
  
end
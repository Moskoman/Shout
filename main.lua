player = require ("src.player")

function love.load () 

end

function love.update ()

end

function love.draw ()
	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", 50, 50, player.width, player.height)
end 
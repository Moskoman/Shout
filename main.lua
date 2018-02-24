player = require ("src.player")

function love.load () 

end

function love.update (dt)
	player:update()
end

function love.draw ()
	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", player.posX, player.posY, player.width, player.height)
end 
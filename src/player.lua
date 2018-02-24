player = {} 

player.width = 20
player.height = 20
player.posX = 40
player.posY = 40
player.speed = 3

function player:update ()
	self.CheckInput ()

end

function player:CheckInput ()
	if (love.keyboard.isDown ("s")) then
		player.posY = player.posY + player.speed
	end
	if (love.keyboard.isDown("w")) then
		player.posY = player.posY - player.speed
	end
	if (love.keyboard.isDown("a")) then
		player.posX = player.posX - player.speed
	end
	if (love.keyboard.isDown("d")) then
		player.posX = player.posX + player.speed
	end
end

return player
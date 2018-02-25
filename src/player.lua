player = {} 
personManager = require ("src.personManager")

player.size = 20
player.posX = 40
player.posY = 100
player.speed = 3
player.shoutRange = 30
player.image = love.graphics.newImage ("assets/white.png")
player.isShouting = false

function player:update ()
	self.CheckInput ()

end

function player:CheckInput ()
	if (love.keyboard.isDown ("down")) then
		player.posY = player.posY + player.speed
	end
	if (love.keyboard.isDown("up")) then
		player.posY = player.posY - player.speed
	end
	if (love.keyboard.isDown("left")) then
		player.posX = player.posX - player.speed
	end
	if (love.keyboard.isDown("right")) then
		player.posX = player.posX + player.speed
	end
	if (love.keyboard.isDown ("space")) then 
		player:Shout ()
		player.isShouting = true
	else
		player.isShouting = false
	end

end

function player:Shout ()
	for i, v in ipairs (personManager.Persons) do
		if (player.posX + player.shoutRange >= v.posX  and player.posX - player.shoutRange < v.posX) and (player.posY + player.shoutRange >= v.posY and player.posY - player.shoutRange < v.posY) then
			v.image = v:ChangeColor (2)
		end
	end
end

return player
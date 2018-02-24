player = {} 
personManager = require ("src.personManager")

player.size = 20
player.posX = 40
player.posY = 40
player.speed = 3
player.shoutRange = 20

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
	if (love.keyboard.isDown ("space")) then 
		player:Shout ()
	end

end

function player:Shout ()
	for i, v in ipairs (personManager.Persons) do
		if (player.posX + player.shoutRange >= v.posX  and player.posX - player.shoutRange < v.posX) and (player.posY + player.shoutRange >= v.posY and player.posY - player.shoutRange < v.posY) then
			v.image = v:ChangeColor (1)
		end
	end
end

return player
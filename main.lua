player = require ("src.player")
personManager = require ("src.personManager")

function love.load () 
	PopulateLevel ()
end

function love.update (dt)
	player:update()
end

function love.draw ()

	for i, v in ipairs (personManager.Persons) do
		love.graphics.setColor (v.color)
		love.graphics.rectangle ("fill", v.posX, v.posY, v.size, v.size)
	end


	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", player.posX, player.posY, player.size, player.size)
end 

function PopulateLevel()
	for i, v in ipairs (personManager.PersonsPosition) do
		posX = v[1]
		posY = v[2]
		color = v[3]
		personManager:MakeNewPerson (posX, posY, color)
	end
end
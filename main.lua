player = require ("src.player")
personManager = require ("src.personManager")
camera = require ("src.camera")
background = love.graphics.newImage ("assets/background.png")

function love.load () 
	PopulateLevel ()
end

function love.update (dt)
	player:update()
	personManager:update()
end

function love.draw ()

	camera:set()

	love.graphics.draw (background, -30, -10)

	for i, v in ipairs (personManager.Persons) do
		love.graphics.draw (v.image, v.posX, v.posY, 0, v.size, v.size)
	end


	love.graphics.setColor (255, 255, 255)
	love.graphics.rectangle ("fill", player.posX, player.posY, player.size, player.size)

	camera:unset()

end 

function PopulateLevel()
	for i, v in ipairs (personManager.PersonsPosition) do
		posX = v[1]
		posY = v[2]
		color = v[3]
		personManager:MakeNewPerson (posX, posY, color)
	end
end
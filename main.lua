player = require ("src.player")
personManager = require ("src.personManager")
camera = require ("src.camera")
HUD = require("src.HUD")
background = love.graphics.newImage ("assets/background.png")
shoutImage = love.graphics.newImage ("assets/shout.png")

function love.load () 
	PopulateLevel ()
	HUD:load()
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

	love.graphics.draw (player.image, player.posX, player.posY, 0, 1, 1)
	if (player.isShouting) then
		love.graphics.draw (shoutImage, player.posX - 14, player.posY - 16, 0, 1, 1)
	end

	for i, v in ipairs (HUD.stuffToDraw) do
		love.graphics.draw (v.image, camera.x + v.offsetX, camera.y + v.offsetY, 0, 1 , 1)
	end

	-- Gang Bar Monkeyness
		love.graphics.setColor (111,111,111)
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 4 * 100, 30)

		love.graphics.setColor (HUD.gangBars[1].color)
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 4 * HUD.gangBars[1].population, 30)
		
		love.graphics.setColor (HUD.gangBars[2].color)
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 4 * HUD.gangBars[2].population, 30)

		love.graphics.setColor (HUD.gangBars[3].color)
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 4 * HUD.gangBars[3].population, 30)

		love.graphics.setColor (HUD.gangBars[4].color)
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 4 * HUD.gangBars[4].population, 30)

		love.graphics.setColor (255, 255, 255, 255)

		print (i)


	HUD:UpdateScore()

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
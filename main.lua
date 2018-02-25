GlobalTimer = 0
player = require ("src.player")
personManager = require ("src.personManager")
camera = require ("src.camera")
HUD = require("src.HUD")
menu = love.graphics.newImage ("assets/menu.png")
background = love.graphics.newImage ("assets/background.png")
shoutImage = love.graphics.newImage ("assets/shout.png")
endingSong = love.audio.newSource ("assets/Cr00k3d - Being_Green (Muppets Cover).mp3")

local playState = false


function love.load () 
	GlobalTimer = 0

	GameLoad()

end

function love.update (dt)
	GlobalTimer = GlobalTimer + dt


	if (playState) then
		GameUpdate()
	else
		MenuUpdate()
	end

end

function love.draw ()

	MenuDraw()

	if (playState) then
		GameDraw()
	end

end 

function PopulateLevel()
	for i, v in ipairs (personManager.PersonsPosition) do
		posX = v[1]
		posY = v[2]
		color = v[3]
		personManager:MakeNewPerson (posX, posY, color)
	end
end

function GameDraw ()

	camera:set()

	love.graphics.draw (background, -30, -10)

	for i, v in ipairs (personManager.Persons) do
		love.graphics.draw (v.image, v.posX, v.posY, 0, v.size, v.size)
		if (v.isShouting) then
			love.graphics.draw (shoutImage, v.posX - 14, v.posY - 16, 0, 1, 1)
		end
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
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 6 * 100, 30)

		love.graphics.setColor (HUD.gangBars[1].color)
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 6 * HUD.gangBars[1].population, 30)
		
		love.graphics.setColor (HUD.gangBars[2].color)
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 6 * HUD.gangBars[2].population, 30)

		love.graphics.setColor (HUD.gangBars[3].color)
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 6 * HUD.gangBars[3].population, 30)

		love.graphics.setColor (HUD.gangBars[4].color)
		love.graphics.rectangle ("fill", camera.x + barsOffset, camera.y + barsOffset, 1 + 6 * HUD.gangBars[4].population, 30)

		love.graphics.setColor (255, 255, 255, 255)

	HUD:UpdateScore()

	camera:unset()
end

function GameUpdate ()

	player:update()
	personManager:update()

end

function GameLoad ()

	PopulateLevel ()
	HUD:load()

end

function MenuDraw()
	
	love.graphics.draw (menu, 0, 0)

end

function MenuUpdate ()

	if (love.keyboard.isDown ("space")) then
		GameLoad()
		playState = true
	end

end
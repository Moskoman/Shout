HUD = {}
camera = require ("src.camera")
personManager = require ("src.personManager")

HUD.stuffToDraw = {}
HUD.currentScore = 0

HUD.gangBars = {}

function HUD:load () 

	upgrades = {}
	upgrades.image = love.graphics.newImage ("assets/upgrades.png")
	upgrades.offsetX = 470
	upgrades.offsetY = 20
	table.insert (HUD.stuffToDraw, upgrades)

	mail = {}
	mail.image = love.graphics.newImage ("assets/mail.png")
	mail.offsetX = 520
	mail.offsetY = 20
	table.insert (HUD.stuffToDraw, mail)

	influence_icon = {}
	influence_icon.image = love.graphics.newImage ("assets/influence_icon.png")
	influence_icon.offsetX = camera.x + mail.offsetX + 60
	influence_icon.offsetY = camera.y + mail.offsetY 
	table.insert (HUD.stuffToDraw, influence_icon)

	barsOffset = 20

	whiteGang = {}
	redGang = {}
	blueGang = {}
	greenGang = {}
	whiteGang.population = 0
	redGang.population = 0
	blueGang.population = 0
	greenGang.population = 0
	whiteGang.color = {255, 255, 255}
	redGang.color = {210, 30, 30}
	blueGang.color = {30, 30, 210}
	greenGang.color = {30, 210, 30}

				
	HUD.gangBars = { whiteGang, redGang, blueGang, greenGang}


end

function HUD:UpdateScore ()

	for i, v in ipairs (personManager.Persons) do
		if (v.isWhite) then
			HUD.currentScore = HUD.currentScore + 1
		end
	end
	self.currentScore = math.floor(100 * self.currentScore/#personManager.Persons)
	love.graphics.print (self.currentScore .. "/100%", camera.x + mail.offsetX + 50, camera.y + mail.offsetY + 30)
	HUD.currentScore = 0
	whiteGang.population = math.floor (100 * #personManager.gangs.white / #personManager.Persons)
	redGang.population = math.floor (100 * #personManager.gangs.red / #personManager.Persons)
	blueGang.population = math.floor (100 * #personManager.gangs.blue / #personManager.Persons)
	greenGang.population = math.floor (100 * #personManager.gangs.green / #personManager.Persons)

	for x = 1, #HUD.gangBars, 1 do
		if (HUD.gangBars [x + 1]) then
			if (HUD.gangBars[x].population < HUD.gangBars[x + 1].population) then
				local smallerPopulation = HUD.gangBars [x + 1]
				table.remove (HUD.gangBars, x + 1)
				table.insert (HUD.gangBars, x, smallerPopulation)
				x = 0
			end
		end
	end
end

return HUD
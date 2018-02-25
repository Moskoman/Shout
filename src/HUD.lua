HUD = {}
camera = require ("src.camera")
personManager = require ("src.personManager")

HUD.stuffToDraw = {}
HUD.currentScore = 0

HUD.gangBars = {}

function HUD:load () 



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

	love.graphics.print ("WHT: " .. whiteGang.population .. "/100%", camera.x + 30, camera.y + 56)
	love.graphics.print ("RED: " .. redGang.population .. "/100%", camera.x + 180, camera.y + 56)
	love.graphics.print ("BLU: " .. blueGang.population .. "/100%", camera.x + 330, camera.y + 56)
	love.graphics.print ("GRE: " .. greenGang.population .. "/100%", camera.x + 480, camera.y + 56)

end

return HUD
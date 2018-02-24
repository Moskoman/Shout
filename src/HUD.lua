HUD = {}
camera = require ("src.camera")
personManager = require ("src.personManager")

HUD.stuffToDraw = {}
HUD.currentScore = 0

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
				

end

function HUD:UpdateScore ()

	for i, v in ipairs (personManager.Persons) do
		if (v.isBlue) then
			HUD.currentScore = HUD.currentScore + 1
		end
	end
	self.currentScore = 100 * self.currentScore/#personManager.Persons
	love.graphics.print (self.currentScore .. "/100%", camera.x + mail.offsetX + 50, camera.y + mail.offsetY + 30)
	HUD.currentScore = 0

end

return HUD
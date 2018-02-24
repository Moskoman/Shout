HUD = {}

HUD.stuffToDraw = {}

function HUD:load () 

	upgrades = {}
	upgrades.image = love.graphics.newImage ("assets/upgrades.png")
	upgrades.offsetX = 400
	upgrades.offsetY = 20
	table.insert (HUD.stuffToDraw, upgrades)

	mail = {}
	mail.image = love.graphics.newImage ("assets/mail.png")
	mail.offsetX = 520
	mail.offsetY = 20
	table.insert (HUD.stuffToDraw, mail)

end

return HUD
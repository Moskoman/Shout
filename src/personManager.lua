personManager = {}
person = require ("src.person")

personManager.Persons = {}
personManager.PersonsPosition = {{100, 60, 0}, {300, 200,1}, {100, 82, 1}, {142, 525, 0}, {635, 300, 1}, {400, 420, 3}, {500, 240, 3}, {300, 500, 1}, {300, 300, 3}, {300, 330, 3}, {330, 300, 3}, {400, 300, 1}, {700, 200, 0}, {700, 250, 1}, {450, 500, 3}, {100, 400, 1}, {130, 250, 1}, {170, 250, 1}, {370, 400, 3}, { 600, 400, 1}, {700, 300, 0}, { 740, 240, 1}, {732, 210, 3}, {500, 400, 1}, {800, 400, 0}, {800, 140, 1}, {300, 440, 3}, {100, 100, 0}, {100, 500, 1 } }

personManager.gangs = {}
personManager.gangs.white = {}
personManager.gangs.blue = {}
personManager.gangs.green = {}
personManager.gangs.red = {}

function personManager:MakeNewPerson (posX, posY, color)
	a = {}
	a = person:New (posX, posY, color)
	table.insert (personManager.Persons, a)
	return a

end

function personManager:update()
	for i, v in ipairs (personManager.Persons) do
		v:update()
	end
	self:updateGangs()
end

function personManager:updateGangs ()

	personManager.gangs.white = {}
	personManager.gangs.blue = {}
	personManager.gangs.green = {}
	personManager.gangs.red = {}


	for i, v in ipairs (personManager.Persons) do
		if (v.gangColor == 0) then
		table.insert (personManager.gangs.red, v)
		elseif (v.gangColor == 1) then
		table.insert (personManager.gangs.blue, v)
		elseif (v.gangColor == 2) then
		table.insert (personManager.gangs.white, v)
		elseif (v.gangColor == 3) then
		table.insert (personManager.gangs.green, v)
		end
	end
end


return personManager
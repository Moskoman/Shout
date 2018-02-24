personManager = {}
person = require ("src.person")

personManager.Persons = {}
personManager.PersonsPosition = {{100, 60, 0}, {300, 200,1}, {100, 82, 0}, {142, 525, 0}, {635, 300, 1}, {400, 420, 3}, {500, 240, 3}}

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
end

return personManager
personManager = {}
person = require ("src.person")

personManager.Persons = {}
personManager.PersonsPosition = {{100, 60, 0}, {300, 200,1}}

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
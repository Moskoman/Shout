personManager = {}
person = require ("src.person")

personManager.Persons = {}
personManager.PersonsPosition = {{100, 200, {255, 0, 0}}}

function personManager:MakeNewPerson (posX, posY, color)
	a = {}
	a = person:New (posX, posY, color)
	table.insert (personManager.Persons, a)
	return a

end

return personManager
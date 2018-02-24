person = {}

person.posX = 60
person.posY = 60
person.size = 20

function person:New (posX, posY, color)

	a = a or {}
	setmetatable (a, self)
	self.__index = self
	self.posX = posX
	self.posY = posY
	self.size = person.size
	self.color = color
	return a

end

return person
person = {}

person.posX = 60
person.posY = 60
person.size = 20
person.color = {255, 0, 0}

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

function person:ChangeColor (newColor)
	if (newColor == 0) then
		self.color = {0, 0, 255}
	elseif (newColor == 1) then
		self.color = {255, 255, 255}
	end

end

return person
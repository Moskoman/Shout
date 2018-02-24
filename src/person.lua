person = {}

person.posX = 60
person.posY = 60
person.size = 1
person.color = {255, 0, 0}
person.image = love.graphics.newImage ("assets/red.png")

function person:New (posX, posY, color)

	newPerson = {}
	setmetatable (newPerson, self)
	self.__index = self
	newPerson.posX = posX
	newPerson.posY = posY
	newPerson.size = person.size
	newPerson.image = person:ChangeColor(color)
	return newPerson

end

function person:ChangeColor (newColor)
	if (newColor == 0) then
		image = love.graphics.newImage ("assets/red.png")
	elseif (newColor == 1) then
		image = love.graphics.newImage ("assets/blue.png")
	end

	return image

end

return person
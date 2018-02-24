person = {}

person.posX = 60
person.posY = 60
person.size = 1
person.image = love.graphics.newImage ("assets/red.png")
person.followCounter = 1
person.isBlue = false
person.speed = 2

function person:New (posX, posY, color)

	newPerson = {}
	setmetatable (newPerson, self)
	self.__index = self

	print (color)
	if (color == 1) then
		newPerson.isBlue = true
	else
		newPerson.isBlue = false
	end
	
	newPerson.posX = posX
	newPerson.posY = posY
	newPerson.size = person.size
	newPerson.image = self:ChangeColor(color)
	return newPerson

end

function person:update ()
	if (self.isBlue) then
		 self:FollowCentralPath()
	end

end

function person:ChangeColor (newColor)
	if (newColor == 0) then
		image = love.graphics.newImage ("assets/red.png")
	elseif (newColor == 1) then
		image = love.graphics.newImage ("assets/blue.png")
		self.isBlue = true
	end

	return image

end

function person:FollowCentralPath ()

	if (self.followCounter == 1) then
		self.posX = self.posX + 2
	elseif (self.followCounter == 2) then
		self.posY = self.posY + person.speed
	end

end

return person
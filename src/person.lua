person = {}

person.posX = 60
person.posY = 60
person.size = 1
person.image = love.graphics.newImage ("assets/red.png")
person.followCounter = 1
person.isWhite = false
person.speed = 2
person.gangColor = 0
person.canShout = true
person.isShouting = false
person.shoutCD = 2
person.lastShoutTime = 0
person.shoutEnd = 0

function person:New (posX, posY, color)

	newPerson = {}
	setmetatable (newPerson, self)
	self.__index = self

	if (color == 2) then
		newPerson.isWhite = true
	else
		newPerson.isWhite = false
	end
	
	newPerson.posX = posX
	newPerson.posY = posY
	newPerson.size = person.size
	newPerson.image = newPerson:ChangeColor(color)
	newPerson.isShouting = false
	newPerson.canShout = true
	return newPerson

end

function person:update ()

	self:ResetShoutCoolDown ()

	if (self.isWhite) then
		 self:FollowCentralPath()
	end

	if (self.canShout) then
		if (math.random(1000) >= 985) then
			self.isShouting = true
		end
	end

	if (self.isShouting == true) then
		self.isShouting = true
		self:Shout ()
	end



end

function person:ChangeColor (newColor)
	if (newColor == 0) then
		image = love.graphics.newImage ("assets/red.png")
		self.gangColor = 0
	elseif (newColor == 1) then
		image = love.graphics.newImage ("assets/blue.png")
		self.gangColor = 1
	elseif (newColor == 2) then
		image = love.graphics.newImage ("assets/white.png")
		self.gangColor = 2	
		self.isWhite = true
	elseif (newColor == 3) then
		self.gangColor = 3
		image = love.graphics.newImage ("assets/green.png")
	end

	return image

end

function person:FollowCentralPath ()

	if (self.followCounter == 1) then
		if (self.posX < 784) then
			self.posX = self.posX + 2
		else
			self.followCounter = 2
		end

	elseif (self.followCounter == 2) then
		if (self.posY < 430) then
			self.posY = self.posY + person.speed
		else
			self.followCounter = 3
		end

	elseif (self.followCounter == 3) then
		if (self.posX > 160) then
			self.posX = self.posX - person.speed
		else 
			self.followCounter = 4
		end

	elseif (self.followCounter == 4) then
		if (self.posY > 200) then
			self.posY = self.posY - person.speed
		else
			self.followCounter = 1
		end
	end

end

function person:Shout ()
	for i, v in ipairs (personManager.Persons) do
		if (self.posX + 30 >= v.posX  and self.posX - 30 < v.posX) and (self.posY + 30 >= v.posY and self.posY - 30 < v.posY) then
			if (v.gangColor ~= self.gangColor) then
				v.image = v:ChangeColor (self.gangColor)
			end
		end
	end

	self.shoutEnd = self.shoutEnd + 1

	if (self.shoutEnd >= 20) then
		self.canShout = false
		self.isShouting = false
		self.lastShoutTime = GlobalTimer
	end
end

function person:ResetShoutCoolDown ()
	if (self.lastShoutTime + self.shoutCD > GlobalTimer) then
		self.canShout = true
		self.shoutEnd = 0
	end
end

return person
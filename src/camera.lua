camera = {}

player = require ("src.player")

camera.x = 0
camera.y = 0
camera.scaleX = 1
camera.scaleY = 1
camera.followPlayerOffset = 200

function camera:set (cameraPositionX, playerY)
	love.graphics.push ()
	love.graphics.rotate (0)
	love.graphics.scale (1/self.scaleX, 1/self.scaleY)
	love.graphics.translate (-self.x, -self.y)
	camera:FollowPlayer()

end

function camera:unset ()
	love.graphics.pop ()
end

function camera:setPosition(newPositionX, newPositionY)
	self.x = newPositionX or self.x
	self.y = newPositionY or self.y
end

function camera:FollowPlayer ()
	if (camera.x < 330 and camera.x + camera.followPlayerOffset <= player.posX) then
		camera.x = camera.x + 2
	end

	if (camera.y < 90 and camera.y + camera.followPlayerOffset <= player.posY) then
		camera.y = camera.y + 2
	end

	if (camera.x > -20 and camera.x + camera.followPlayerOffset > player.posX) then
		camera.x = camera.x - 2
	end

	if (camera.y > -10 and camera.y + camera.followPlayerOffset > player.posY) then
		camera.y = camera.y - 2
	end

end
return camera 


player={}

function player:load()--putsplayeronstuff
self.x=50
self.y=love.graphics.getHeight()/2
self.width=20
self.height=100
self.speed=500
end

function player:update(dt)--overallrightrendering
self:move(dt)
self:checkBoundaries()
end

function player:draw()--drawsplayer
love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end

function player:move(dt)--movementfunk
if love.keyboard.isDown("w") then
self.y=self.y-self.speed*dt
elseif love.keyboard.isDown("s") then
self.y=self.y+self.speed*dt
end
end

function player:checkBoundaries()
if self.y < 0 then
self.y = 0
elseif self.y + self.height > love.graphics.getHeight() then
self.y = love.graphics.getHeight() - self.height
end
end
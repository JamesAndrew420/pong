

ball = {}

function ball:load()--putsplayeronstuff
self.x=love.graphics.getWidth()/2
self.y=love.graphics.getHeight()/2
self.width=20
self.height=20
self.speed=500
self.xVel = -self.speed
self.yVel = 0
end

function ball:update(dt)--overallrightrendering
self:move(dt)
self:collide()
end

function ball:move(dt)
self.x = self.x + self.xVel * dt
self.y = self.y + self.yVel * dt
end

function ball:collide()
if checkCollision(self, player) then
self.xVel = self.speed
local midBall =  self.y + (self.height/2)
local midPlayer = player.y + (player.height/2)
local collisionPosition = midBall - midPlayer
self.yVel = collisionPosition * 5
end
if checkCollision(self, ai) then
self.xVel = -self.speed
local midBall =  self.y + (self.height/2)
local midAI = ai.y + (ai.height/2)
local collisionPosition = midBall - midAI
self.yVel = collisionPosition * 5
end
if self.y < 0 then
self.y = 0
self.yVel = -self.yVel 
elseif self.y + self.height > love.graphics.getHeight() then
self.y = love.graphics.getHeight() - self.height
self.yVel = -self.yVel
end

if self.x < 0 then
self.x = love.graphics.getWidth() / 2 - self.width / 2
self.y = love.graphics.getHeight() / 2 - self.height / 2
self.yVel = 0
self.xVel = self.speed
end
if self.x +self.width > love.graphics.getWidth() then
self.x = love.graphics.getWidth() / 2 - self.width / 2
self.y = love.graphics.getHeight() / 2 - self.height / 2
self.yVel = 0
self.xVel = -self.speed
end
end
function ball:draw()--drawsplayer
love.graphics.rectangle("fill",self.x,self.y,self.width,self.height)
end

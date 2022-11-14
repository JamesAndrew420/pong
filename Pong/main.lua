
require("player")
require("ball")
require("ai")

function love.load()
player:load()
ball:load()
ai:load()
end

function love.update(dt)
player:update(dt)
ball:update(dt)
ai:update(dt)
end

function love.draw()
player:draw()
ball:draw()
ai:draw()
end

function checkCollision(a, b)
if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
return true
else
return false
end
end
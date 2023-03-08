Powerup = Class{}

function Powerup:init(skin)
    -- simple positional and dimensional variables
    self.width = 16
    self.height = 16

    -- these variables are for keeping track of our velocity on both the
    -- X and Y axis, since the ball can move in two dimensions
    self.dy = 0
    self.dx = 0

    -- references type of powerup. Ball powerup is #7
    self.skin = skin
end

function Powerup:update(dt)
    -- updates movement
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Powerup:place()
    self.x = VIRTUAL_WIDTH / 2
    self.y = 0
end

function Powerup:collides(paddle)
    --TODO: Trigger powerup effect when it hits paddle
end

function Powerup:render()
    love.graphics.draw(gTextures['main'], gFrames['powerups'][self.skin],
    self.x, self.y)
end
Powerup = Class{}

function Powerup:init(skin)
    -- simple positional and dimensional variables
    self.width = 16
    self.height = 16

    -- these variables are for keeping track of our velocity on both the
    -- X and Y axis, since the ball can move in two dimensions
    self.dy = 0
    self.dx = 0

    self.x = 0
    self.y = 0

    -- references type of powerup. Ball powerup is #7
    self.skin = skin
    self.inPlay = false
end

function Powerup:update(dt)
    -- updates movement
    self.x = self.x + self.dx * dt
    self.y = self.y + self.dy * dt
end

function Powerup:reset()
    self.x = 200
    self.y = 50
end

function Powerup:collides(target)
        -- first, check to see if the left edge of either is farther to the right
    -- than the right edge of the other
    if self.x > target.x + target.width or target.x > self.x + self.width then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + target.height or target.y > self.y + self.height then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end

function Powerup:render()
    if self.inPlay then
        love.graphics.draw(gTextures['main'], gFrames['powerups'][self.skin],
        self.x, self.y)
    end
end
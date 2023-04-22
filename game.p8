Game = {}
Game.__index = Game

function Game:new()
  local s = 3
  local game = {
    speed = s,
    cycle = s,
    food = Food:new({64,64}),
    item = Item:new({64,64}),
    paused = false
  }
  setmetatable(game, Game)
  return game
end

function Game:Update()
  self.cycle = self.cycle - 1
  if self.cycle == 0 then
    self.cycle = self.speed
    return true
  end
  return false
end
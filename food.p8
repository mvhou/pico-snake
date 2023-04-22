Food = {}
Food.__index = Food

function Food:new(occupied)
  local food = {
    pos = generate_food(occupied)
  }
  setmetatable(food, Food)
  return food
end

function Food:Draw()
  print_pixel(self.pos, RED)
end
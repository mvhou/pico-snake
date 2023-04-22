Item = {}
Item.__index = Item

function Item:new(snake)
  p = generate_food(snake)
  local item = {
    type = "Collide",
    symbol = "P",
    pos = p,
    duration = 100,
    power = function() return false end
  }
  setmetatable(item, Item)
  return item
end

function Item:Draw()
  print_pixel(self.pos, PINK)
end

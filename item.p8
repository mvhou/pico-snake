Item = {}
Item.__index = Item

function Item:new(snake)
  p = generate_food(snake)
  local item = {
    symbol = "P",
    pos = p,
    duration = 100,
    effects = {
      {
        type = "Collide",
        effect = function() return false end,
      },
      {
        type = "Draw",
        effect = function(self)
          for i = 1, #self.body do
            print_pixel(self.body[i], LIGHT_GREY)
          end
        end
      }
    }
  }
  setmetatable(item, Item)
  return item
end

function Item:Draw()
  print_pixel(self.pos, PINK)
end

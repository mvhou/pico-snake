Snake = {}
Snake.__index = Snake

function Snake:new()
  local snake = {
    alive = true,
    pos = {64,64},
    min = 8,
    max = 124,
    length = 15,
    body = {{64,64}},
    current_direction = {axis = 2, vector = 1},
    new_direction = {axis = 2, vector = 1},
    item_duration = nil,
    item = nil,
  }
  setmetatable(snake, Snake)
  return snake
end

function Snake:Change_direction(direction)
  if direction == nil then return end
  if direction.axis == self.current_direction.axis then return end
  self.new_direction.axis = direction.axis
  self.new_direction.vector = direction.vector
end

function Snake:Move()
  self.current_direction.axis = self.new_direction.axis
  self.current_direction.vector = self.new_direction.vector
  self.body[#self.body + 1] = {self.pos[1], self.pos[2]}
  if #self.body > self.length then remove_by_index(self.body, 1) end
  self.pos[self.current_direction.axis] = wrapAround(self.pos[self.current_direction.axis], self.current_direction.vector * 4, self.min, self.max)
end

function Snake:Item()
  if self.item == nil then return end
  self.item_duration = self.item_duration - 1
  if self.item_duration == 0 then
    self[self.item] = nil
    self.item = nil
    self.item_duration = nil
  end
end

function Snake:Collide(position)
  print(self.body[1], 40, 40, 7)
  for i = 1, #self.body do
    if are_colliding(self.pos, self.body[i]) then
      return true
    end
  end
  return false
end

function Snake:Eat(food)
  if not are_colliding(food, self.pos) then return false end
  self.length = self.length + 1
  return true
end

function Snake:Use(item)
  self[item.type] = item.power
  self.item_duration = item.duration
  self.item = item.type
  return true
end

function Snake:Draw()
  for i = 1, #self.body do
    print_pixel(self.body[i], DARK_GREEN)
  end
end

function remove_by_index(arr, idx)
  for i = idx, #arr - 1 do
    arr[i] = arr[i + 1]
  end
  arr[#arr] = nil
  return arr
end

function wrapAround(v, delta, minval, maxval)
  local mod = maxval - minval
  v = v + delta - minval
  v = v + (1 - flr(v / mod)) * mod
  return v % mod + minval
end


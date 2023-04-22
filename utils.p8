function are_colliding(a, b)
  if a[1] == b[1] and a[2] == b[2] then
    return true
  end
  return false
end

-- function check_collisions(positions_1, positions_2)
--   for _,p1 in iPaipositions_1 do
--     for _,p2 in positions_2 do
--       if are_colliding(p1, p2) then return true end
--       end
--   end
--   return false
-- end

function random_position()
  return {flr(rnd(28)) * 4 + 8, flr(rnd(28)) * 4 + 8}
end

function generate_food(snake)
  local new_food = random_position()
  if snake == nil or snake.body == nil then return new_food end
  while count(snake.body, new_food) > 0 do
    new_food = random_position()
  end
  return new_food
end

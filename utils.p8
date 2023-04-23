function are_colliding(a, b)
  if a[1] == b[1] and a[2] == b[2] then
    return true
  end
  return false
end

function random_position()
  return {flr(rnd(28)) * 4 + 8, flr(rnd(28)) * 4 + 8}
end

function remove_by_index(arr, idx)
  for i = idx, #arr - 1 do
    arr[i] = arr[i + 1]
  end
  arr[#arr] = nil
  return arr
end

function wrap_around(v, delta, minval, maxval)
  local mod = maxval - minval
  v = v + delta - minval
  v = v + (1 - flr(v / mod)) * mod
  return v % mod + minval
end

function generate_food(snake)
  local new_food = random_position()
  if snake == nil or snake.body == nil then return new_food end
  while count(snake.body, new_food) > 0 do
    new_food = random_position()
  end
  return new_food
end

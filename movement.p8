RIGHT = {axis = 1, vector = 1}
LEFT = {axis = 1, vector = -1}
DOWN = {axis = 2, vector = 1}
UP = {axis = 2, vector = -1}

function get_direction()
  if (btn(0)) then return LEFT end
  if (btn(1)) then return RIGHT end
  if (btn(2)) then return UP end
  if (btn(3)) then return DOWN end
  return nil
end

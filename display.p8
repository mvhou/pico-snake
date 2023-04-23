OFFSET = {0,0}
PIXEL_SIZE = 3
PIXEL_RADIUS = 1.5
MIN = 8
MAX = 124

function print_edge(min, max)
  local x0 = min - 3
  local x1 = max - 2
  local y0 = min - 3
  local y1 = max - 2
  rect(x0, y0, x1, y1, YELLOW)
end

function print_power(duration)
  if duration == nil then print("none", 80, 0, 7) else
    print(duration, 80, 0, 7)
  end
end

function print_hud(snake)
  print_edge(snake.min, snake.max)
  print_power(snake.effects_duration)
end

function print_pixel(position, color)
  rectfill(position[1] - PIXEL_RADIUS,
  position[2] - PIXEL_RADIUS,
  position[1] + PIXEL_RADIUS,
  position[2] + PIXEL_RADIUS,
  color)
end

function print_stats(snake, food)
  print("x: "..snake.pos[1], 30, 100, WHITE)
  print("y: "..snake.pos[2], 60, 100, WHITE)
  print("food: "..food[1]..", "..food[2], 20, 20, WHITE)
end

BLACK = 0
DARK_BLUE = 1
DARK_PURPLE = 2
DARK_GREEN = 3
BROWN = 4
DARK_GREY = 5
LIGHT_GREY = 6
WHITE = 7
RED = 8
ORANGE = 9
YELLOW = 10
GREEN = 11
BLUE = 12
LAVENDER = 13
PINK = 14
LIGHT_PEACH = 15

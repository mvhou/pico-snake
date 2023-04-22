pico-8 cartridge // http://www.pico-8.com
version 41
__lua__

#include snake.p8
#include movement.p8
#include display.p8
#include utils.p8
#include game.p8
#include item.p8
#include food.p8

-- SNAKE
-- BY MARK

function _init()
    g_game = Game:new()
    g_snake = Snake:new()
end

function update(game, snake)
    snake:Move()
    snake:Item()
    if snake:Collide() then
        snake.alive = false
    end
    if snake:Eat(game.food.pos) then
        game.food = Food:new(snake.body)
    end
    if are_colliding(snake.pos, game.item.pos) then
        snake:Use(game.item)
        game.item = Item:new(snake.body)
    end
end

function _update()
    if btn(4) and g_game.speed > 1 then g_game.speed = g_game.speed - 1 end
    if btn(5) and g_game.speed < 100 then g_game.speed = g_game.speed + 1 end
    g_snake:Change_direction(get_direction())
    if g_game:Update() and g_snake.alive and not g_game.paused then
        update(g_game, g_snake)
    end
end

function _draw()
    cls(12)
    print("speed: "..g_game.speed, 20, 0, 7)
    print_hud(g_snake)
    g_snake:Draw()
    g_game.item:Draw()
    g_game.food:Draw()
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

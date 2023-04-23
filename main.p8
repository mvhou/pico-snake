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

-- -- SNAKE
-- -- BY MARK

function _init()
    g_game = Game:new()
    g_snake = Snake:new()
end

function update(game, snake)
    snake:Move()
    snake:Effect()
    if snake:Collide() then
        snake.alive = false
    end
    if snake:Eat(game.food.pos) then
        game.food = Food:new(snake.body)
    end
    if game.item != nil and are_colliding(snake.pos, game.item.pos) then
        snake:UseItem(game.item)
        game.item = nil
    end
    if game.item == nil and snake.effects_duration == nil then
        game.item = Item:new()
    end
end

function _update()
    g_snake:Change_direction(get_direction())
    if g_game:Update() and g_snake.alive and not g_game.paused then
        update(g_game, g_snake)
    end
end

function _draw()
    cls(12)
    print_hud(g_snake)
    g_snake:Draw()
    if g_game.item != nil then g_game.item:Draw() end
    g_game.food:Draw()
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

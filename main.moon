require "color"
import game_board, score_board from require "board" 
import Cell from require "ui"
import Snake from require 'snake'

-- Declaring snake var before initialized in love.load to give all functions access to var\
local snake, test_food, timer

love.draw = () ->
    score_board\draw()
    
    -- example text render
    THEME.black\draw()
    love.graphics.print("Hello world", 25, 10, 0, 1, 1)

    game_board\draw()

    -- example food item render
    test_food\draw()

    snake\draw()

love.update = (dt) ->
    timer += dt
    if timer >= 0.10
        snake\update()
        timer = 0

love.load = ->
    snake = Snake()
    test_food = Cell(8, 6, THEME.orange)
    timer = 0


love.keypressed = (key) ->
    switch key
        when "k"
            love.event.quit(0)
        when "r"
            -- reload command
            love.load()
        -- control snake commands
        when "a", "left"
            snake.input_direction = "left"
        when "s", "down"
            snake.input_direction = "down"
        when "d", "right"
            snake.input_direction = "right"
        when "w", "up"
            snake.input_direction = "up"
        when "q"
            snake.input_direction = "up_left"
        when "e"
            snake.input_direction = "up_right"
        when "z"
            snake.input_direction = "down_left"
        when "c"
            snake.input_direction = "down_right"
        
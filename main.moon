require "color"
import game_board, score_board from require "board" 
import Cell from require "ui"
import Snake from require 'snake'

-- Delcaring snake var before initialized in love.load to give all functions access to var\
local snake

love.draw = () ->
    score_board\draw()
    
    -- example text render
    THEME.black\draw()
    love.graphics.print("Hello world", 25, 10, 0, 1, 1)

    game_board\draw()

    -- example food item render
    test_food = Cell(8, 6, THEME.orange)
    test_food\draw()

    snake\draw()

love.update = (dt) ->
    print(dt)

love.load = ->
    snake = Snake()

love.keypressed = (key) ->
    switch key
        when "q"
            love.event.quit(0)
        when "r"
            -- reload command
            love.load()
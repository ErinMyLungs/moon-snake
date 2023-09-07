require "color"
import game_board, score_board from require "board" 
import Cell, draw_hi from require "ui"

love.draw = () ->
    score_board\draw()
    
    -- example text render
    THEME.black\draw()
    love.graphics.print("Hello world", 25, 10, 0, 1, 1)

    game_board\draw()

    -- example food item render
    test_food = Cell(8, 6, THEME.orange)
    test_food\draw()

    -- example multi-cell drawing
    draw_hi()

love.update = (dt) ->
    print(dt)

love.keypressed = (key) ->
    switch key
        when "q"
            love.event.quit(0)
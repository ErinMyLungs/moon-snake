require "color"
import game_board, score_board from require "board" 
import draw_cell, draw_hi from require "ui"

love.draw = () ->
    score_board\draw()
    
    -- example text render
    THEME.black\render()
    love.graphics.print("Hello world", 25, 10, 0, 1, 1)

    game_board\draw()

    -- example food item render
    THEME.orange\render()
    draw_cell(8, 6)

    -- example multi-cell drawing
    draw_hi()


love.keypressed = (key) ->
    switch key
        when "q"
            love.event.quit(0)
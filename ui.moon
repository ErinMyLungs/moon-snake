-- A module for UI helper functions
{:cell_size} = GAME_CONFIG

draw_cell = (x, y) -> 

    love.graphics.rectangle(
        "fill",
        (x - 1) * cell_size,
        (y + 4) * cell_size,
        cell_size - 1,
        cell_size - 1
    )

draw_hi = ->
    THEME.green\render()
    for i = 2, 6
        draw_cell(2, i)
        draw_cell(4, i)

    for i = 2, 4
        draw_cell(i, 4)
    
    for i = 2, 6
        if i == 3
            continue
        draw_cell(6, i)

{:draw_cell, :draw_hi}
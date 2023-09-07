-- A module for UI helper functions/classes
{:cell_size} = GAME_CONFIG

class Cell
    -- a class representing a single cell to render. Used for snake segments and food item.

    new: (x, y, color=THEME.green) =>
        -- raw coords for comparisons/collision detection
        @x = x
        @y = y
        -- Translating cells to offset past scoreboard
        -- Transforming coordinates to make one unit of change moves one cell instead of one absolute unit
        @render_x = (x - 1) * cell_size
        @render_y = (y + 4) * cell_size
        -- creating width and height with -1 so there is a slight boarder between each cell
        @width = cell_size-1
        @height = cell_size - 1
        @color = color
    
    draw: =>
        @color\draw()
        love.graphics.rectangle(
            "fill",
            @render_x,
            @render_y,
            @width,
            @height
        )
    
    equal: (cell) =>
        return @x == cell.x and @y == cell.y

draw_hi = ->
    for i = 2, 6
        -- draw H
        Cell(2, i)\draw()
        Cell(4, i)\draw()
        if i <= 4
            Cell(i, 4)\draw()
        -- draw i
        if i != 3
            Cell(6, i)\draw()

{:draw_hi, :Cell}
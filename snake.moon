import Cell from require "ui"

class Snake
    new: (length = 3) =>
        @length = length
        @color = THEME.green
        @alive = true
        @snake_segments = [Cell(i, 1, color) for i=1,length]
        
    
    
    draw: () =>
        for segment in *@snake_segments
            segment\draw()
    
    kill: () =>
        -- TODO: propagate color change to existing segments
        -- Expand cell class or directly change?
        @alive = false
        @color = THEME.snake_grey

{:Snake}
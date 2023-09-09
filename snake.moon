import Cell from require "ui"

class Snake

    unacceptable_directions = {
        -- Directions which input direction will be ignored because it's opposite
        left: 'right'
        right: 'left'
        up: 'down'
        down: 'up'
    }

    new: (length = 3, direction="right") =>
        @length = length
        @snake_direction=direction
        @input_direction=direction
        @color = THEME.green
        @alive = true
        @snake_segments = [Cell(i, 1, @color) for i=1,length]
    
    draw: () =>
        for segment in *@snake_segments
            segment\draw()
    
    kill: () =>
        @alive = false
        @color = THEME.snake_grey
        @snake_segments = [cell\change_color(@color) for cell in *@snake_segments]
    
    _get_next_position: () =>
        local delta_x, delta_y
        switch @snake_direction
            when "right"
                delta_x = 1
                delta_y = 0
            when "left"
                delta_x = -1
                delta_y = 0
            when "up"
                delta_x = 0
                delta_y = -1
            when "down"
                delta_x = 0
                delta_y = 1
        -- pop off tail
        table.remove(@snake_segments, 1)

        -- select head cell and translate over in direction of snake
        last_cell = @snake_segments[#@snake_segments]
        table.insert(@snake_segments, last_cell\translate(delta_x, delta_y))
    
    update: () =>
        if not @alive
            return
        if unacceptable_directions[@snake_direction] ~= @input_direction
            @snake_direction = @input_direction
        @_get_next_position()


        

{:Snake}
import Cell from require "ui"

class Snake

    unacceptable_directions = {
        -- Directions which input direction will be ignored because it's opposite
        left: 'right'
        right: 'left'
        up: 'down'
        down: 'up'
        up_left: "down_right"
        down_right: "up_left"
        up_right: "down_left"
        down_left: "up_right"
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

    _detect_collision: (cell) =>
        for segment in *@snake_segments
            if cell == segment
                return true
        return false
    
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
            when "up_left"
                delta_x = -1
                delta_y = -1
            when "up_right"
                delta_x = 1
                delta_y = -1
            when "down_left"
                delta_x = -1
                delta_y = 1
            when "down_right"
                delta_x = 1
                delta_y = 1

        last_cell = @snake_segments[#@snake_segments]
        next_move = last_cell\translate(delta_x, delta_y)
        
        -- pop off tail
        tail = table.remove(@snake_segments, 1)

        collided_with_self = @_detect_collision(next_move)
        if collided_with_self
            table.insert(@snake_segments, 1, tail)
            @kill!
            return
        
        -- insert new head of snake for animating move
        table.insert(@snake_segments, next_move)
    
    update: () =>
        if not @alive
            return
        if unacceptable_directions[@snake_direction] ~= @input_direction
            @snake_direction = @input_direction
        @_get_next_position()


        

{:Snake}
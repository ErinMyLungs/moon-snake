import Cell from require 'ui'

{:grid_x_count, :grid_y_count} = GAME_CONFIG


class Food
    new: (snake) =>
        print snake
        @snake = snake
        @food = @\get_random_position()
        
    
    get_random_position: () =>
        snake_segments = @snake.snake_segments
        check_validity = (candidate_cell) ->
            for segment in *snake_segments
                if candidate_cell == segment
                    return false
            return true
        local candidate_cell
        i = 0
        while i < 10000
            -- to prevent deadlock in case every position is covered by snake
            candidate_cell = Cell(
                love.math.random(1, grid_x_count),
                love.math.random(1, grid_y_count),
                THEME.orange
            )
            if check_validity(candidate_cell)
                break
            i += 1
        return candidate_cell
    
    draw: () =>
        @food\draw()
    
    update_and_check_collide: () =>
        head = @snake\get_head()
        if head ~= @food
            return false
        @food = @get_random_position()
        return true


{:Food}    
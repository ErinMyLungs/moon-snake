class Board
    new: (x_position=0, y_position=0, width, height, board_color) =>
        @x_position = x_position
        @y_position = y_position
        @width = width
        @height = height
        @board_color = board_color
    
    draw: =>
        @board_color\draw()
        love.graphics.rectangle(
            "fill",
            @x_position,
            @y_position,
            @width,
            @height
        )

{:cell_size, :grid_x_count, :grid_y_count} = GAME_CONFIG

game_board = Board(0, 75, grid_x_count * cell_size, grid_y_count * cell_size, THEME.grey)
score_board = Board(0, 0, (grid_x_count * cell_size), 75, THEME.white)

{:game_board, :score_board}

    
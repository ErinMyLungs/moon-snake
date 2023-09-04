export GAME_CONFIG = {
    cell_size: 15
    grid_x_count: 20
    grid_y_count: 15
}

love.conf = (t) -> 
    t.window.width = 300
    t.window.height = 300
    t.window.title = "MoonSnake!"
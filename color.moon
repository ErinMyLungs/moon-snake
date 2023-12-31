--- class representing a color to render in love
class Color

    ---@param r number # the amount of red, default 0
    ---@param g number # the amount of green, default 0
    ---@param b number # the amount of blue, default 0
    ---@param a number # the alpha channel, default 1 - warning will affect all next draws including images.
    new: (r=0, g=0, b=0, a=1) =>
        @r=r
        @g=g
        @b=b
        @a=a
    

    draw: =>
        love.graphics.setColor(
            @r, @g, @b, @a
        )
    
    name: =>
        -- Fetches name of variable color is assigned to in theme
        -- otherwise returns 'Unknown'
        return COLOR_TO_NAME[@] if COLOR_TO_NAME[@] else "Unknown"
    
    __tostring: () =>
        return "<Color '#{@\name!}'>"

export THEME = {
    -- snake colors
    green: Color(0.6, 1, 0.32),
    snake_grey: Color(0.5, 0.5, 0.5)
    -- UI/background colors
    white: Color(1, 1, 1),
    grey: Color(0.28, 0.28, 0.28),
    -- food color
    orange: Color(1, .3, .3),
    black: Color()
}

export COLOR_TO_NAME = { color, name for name,color in pairs THEME}

{:Color}
#create grid and components
#square dimensions in pixels (e.g. 10x10px)
class Square
    @Colors = Red:1, Green:2, Blue:3 #tbc
    constructor: (@color, @width, @height) ->

#grid dimensions in squares (e.g. 10x10square)
class Grid

    squares = [gwidth][gheight]

    #gwidht, gheight: dimensions of grid
    #swidth, sheight: dimensions of squares in grid
    constructor: (@gwidth, @gheight, swidth, sheight) ->
        #fill squares-array
        for i in [1..width]
            for j in [1..height]
                square[i][j] = new Square
                square[i][j].color = Square.Colors[Math.floor(Math.random() * 3) + 1]
                square[i][j].width = swidth
                square[i][j].height = sheight

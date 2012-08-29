#create grid and components
#square dimensions in pixels (e.g. 10x10px)
class Square
    @Colors = ["FF0000", "00FF00", "0000FF"] #tbc
    constructor: (@color, @width, @height) ->

#grid dimensions in squares (e.g. 10x10square)
class Grid

    squares = []

    #gwidht, gheight: dimensions of grid
    #swidth, sheight: dimensions of squares in grid
    constructor: (@gwidth, @gheight, swidth, sheight) ->
        #fill squares-array
        for i in [0..gheight-1]
            squares[i] = []
            for j in [0..gwidth-1]
                color= Square.Colors[Math.floor(Math.random() * 3)]
                squares[i][j] = new Square(color, swidth, sheight)

    printGridInfo: ->
        for sq in squares
            document.getElementById("msgs").innerHTML += "#{sq.color}, #{sq.width}, #{sq.height}"

    drawGrid: (canvas) ->
        ctx = canvas.getContext("2d")

        for arr, y in squares
            for sq, x in arr

                ctx.fillStyle=sq.color
                l_o_x=sq.width*x
                l_o_y=sq.height*y
                r_u_x=sq.width*(x+1)
                r_u_y=sq.height*(y+1)
                ctx.fillRect(l_o_x, l_o_y, r_u_x, r_u_y)



tmp = new Grid(15,15,10,10)
tmp.drawGrid(document.getElementById("canvy"))


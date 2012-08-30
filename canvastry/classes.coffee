##############
# SQUARE
#create grid and components
#square dimensions in pixels (e.g. 10x10px)
class Square
    @Colors = ["FF0000", "00FF00", "0000FF"] #tbc
    constructor: (@color, @width, @height) ->

###############
# GRID
#grid dimensions in squares (e.g. 10x10square)
class Grid
    squares = []

    #gwidht, gheight: dimensions of grid
    #swidth, sheight: dimensions of squares in grid
    constructor: (@gwidth, @gheight, @swidth, @sheight) ->
        #fill squares-array
        for i in [0..gheight-1]
            squares[i] = []
            for j in [0..gwidth-1]
                color= Square.Colors[Math.floor(Math.random() * 3)]
                squares[i][j] = new Square(color, swidth, sheight)

    printGridInfo: ->
        for sq in squares
            document.getElementById("msgs").innerHTML += "#{sq.color}, #{sq.width}, #{sq.height}"

    drawGrid: () ->
        canvas = document.getElementById("dynCan")
        ctx = canvas.getContext("2d")

        for arr, y in squares
            for sq, x in arr

                ctx.fillStyle=sq.color
                l_o_x=sq.width*x
                l_o_y=sq.height*y
                r_u_x=sq.width*(x+1)
                r_u_y=sq.height*(y+1)
                ctx.fillRect(l_o_x, l_o_y, r_u_x, r_u_y)

    redrawSquare: ([x,y]) ->
        sq = squares[y][x]
        sq.color= Square.Colors[Math.floor(Math.random() * Square.Colors.length)]
        @drawGrid()

# canvyClick ist der event handler für clicks in den canvas
window.canvyClick = (event) ->
    event = event || window.event
    canvas = document.getElementById("dynCan")
    x = event.pageX - canvas.offsetLeft
    y = event.pageY - canvas.offsetTop
    updateCoordinates(x, y)
    clickMod(x,y)

clickMod = (x, y) ->
    tmp.redrawSquare(calcGridCoords(x, y))

calcGridCoords = (x, y) ->
    gr_x = Math.floor(x/10)
    gr_y = Math.floor(y/10)
    return [gr_x, gr_y]

updateCoordinates = (x, y) ->
    $("#x_coord").text(x)
    $("#y_coord").text(y)
    [x_grid, y_grid] = calcGridCoords(x, y)
    $("#x_grid").text(x_grid)
    $("#y_grid").text(y_grid)

#################################################
# BUILDPAGE

document.write("<p>Dies ist ein durch ein KaffeeSkript
                erzeugter Paragraph</p>

                <canvas id='dynCan' width='150' height='150'
                style='border:1px solid #000000;'
                onclick='window.canvyClick()'></canvas>
               
                <p>Grid: X: <b id='x_grid'> no x_grid </b> | 
                Y: <b id='y_grid'> no y_grid </b></p>

                <p>X: <b id='x_coord'> no x_value </b> |
                Y: <b id='y_coord'> no y_value </b></p>")
 

tmp = new Grid(15,15,10,10)
tmp.drawGrid(document.getElementById("dynCan"))


$("#msgs").innerHTML="blubb"

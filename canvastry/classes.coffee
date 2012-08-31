class Square
    constructor: (@color, @width, @height) ->

    rndColor: ->
        @color = getRandomColor()

    changeColor: (color) ->
        @color = color

    changeState: (state) ->
        @state = state

class Grid
    squares = []

    #gwidht, gheight: dimensions of grid
    #swidth, sheight: dimensions of squares in grid
    constructor: (@canvas_name, @gwidth, @gheight, @swidth, @sheight) ->
        #fill squares-array
        for i in [0..gheight-1]
            squares[i] = []
            for j in [0..gwidth-1]
                #color= Square.Colors[Math.floor(Math.random() * Square.Colors.length)]
                color = getRandomColor()
                squares[i][j] = new Square(color, swidth, sheight)

    drawGrid: () ->
        canvas = document.getElementById(@canvas_name)
        ctx = canvas.getContext("2d")
        for arr, x in squares
            for sq, y in arr

                ctx.fillStyle=sq.color
                l_o_x=sq.width*x
                l_o_y=sq.height*y
                r_u_x=sq.width*(x+1)
                r_u_y=sq.height*(y+1)
                ctx.fillRect(l_o_x, l_o_y, r_u_x, r_u_y)

    redrawSquare: (x,y) ->
        sq = squares[x][y]
        sq.rndColor()
        @drawGrid()

    redrawArea: (x, y) ->
        datColor = squares[x][y].color
        squares[(x-1)%@gwidth][y].changeColor(datColor)
        squares[(x+1)%@gwidth][y].changeColor(datColor)
        squares[x][(y-1)%@gheight].changeColor(datColor)
        squares[x][(y+1)%@gheight].changeColor(datColor)
        @drawGrid()

    redrawArea__: (x, y) ->
        datColor = squares[x][y].color
        squares[(x-1)%@gwidth][y].changeColor(datColor)
        squares[(x+1)%@gwidth][y].changeColor(datColor)
        squares[x][(y-1)%@gheight].changeColor(datColor)
        squares[x][(y+1)%@gheight].changeColor(datColor)
        @drawGrid()

    clickListener: (event) ->
        event = event || window.event
        canvas = document.getElementById(@canvas_name)
        x = event.pageX - canvas.offsetLeft
        y = event.pageY - canvas.offsetTop
        [gr_x, gr_y] = @calcGridCoords(x, y)
        updateCoordinates(gr_x, gr_y)
        #@activateSquare(gr_x, gr_y)
        #@redrawSquare(gr_x, gr_y)
        @redrawArea__(gr_x, gr_y)

    activateSquare: (x, y) ->
        @activeSquare(x, y, 10)
        
    activeSquare: (x, y, count) ->
        if count <= 0
            return
        @redrawSquare(x, y)
        count = count-1
        setTimeout @activeSquare(x, y, count), 1000
    
    calcGridCoords: (x, y) ->
        gr_x = Math.floor(x/@swidth)
        gr_y = Math.floor(y/@sheight)
        return [gr_x, gr_y]


updateCoordinates = (x, y) ->
    $("#x_grid").text(x)
    $("#y_grid").text(y)

getRandomColor = () ->
    letters = '0123456789ABDCEF'.split('')
    color = '#'
    for i in [0..5]
        color += letters[Math.round(Math.random() * 15)]
    color

#################################################
# BUILDPAGE

#globalität ist nicht so schön...
@grid = new Grid("dynCan", 10, 10, 20, 20)

document.write("<p>Dies ist ein durch ein KaffeeSkript
                erzeugter Paragraph</p>

                <canvas id='dynCan' width="+(grid.gwidth*grid.swidth)+"
                height="+(grid.gheight*grid.sheight)+"
                onclick='grid.clickListener()'></canvas>
               
                <p>Grid: X: <b id='x_grid'> no x_grid </b> | 
                Y: <b id='y_grid'> no y_grid </b></p>")
 


grid.drawGrid(document.getElementById("dynCan"))

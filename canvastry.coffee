#create grid and components
#square dimensions in pixels (e.g. 10x10px)
class Square
    @Colors = Red:1, Green:2, Blue:3 #tbc
    constructor: (@color, @width, @height) ->

#grid dimensions in squares (e.g. 10x10square
class Grid
    constructor: (@width, @height) ->

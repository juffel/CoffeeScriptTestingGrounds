canvyClick = (event) ->
    event = event || window.event
    canvas = document.getElementById("dynCan")
    x = event.pageX - dynCan.offsetLeft
    y = event.pageY - dynCan.offsetTop

    document.getElementById("x_coord").innerHTML=x
    document.getElementById("y_coord").innerHTML=y

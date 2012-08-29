canvyClick = (event) ->
    event = event || window.event
    canvas = document.getElementById("canvy")
    x = event.pageX - canvy.offsetLeft
    y = event.pageY - canvy.offsetTop
    
    alert("from deeds:"+x+" "+y)


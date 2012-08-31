
#addiert zwei HTML-Farben der Form "RRGGBB"
addColors = (c1, c2) ->
    red = unhex(c1[0..1])+unhex(c2[0..1])
    green = unhex(c1[2..3])+unhex(c2[2..3])
    blue = unhex(c1[4..5])+unhex(c2[4..5])
    red %= 256
    green %= 256
    blue %= 256
    result = hex(red)+hex(green)+hex(blue)

#addiert zwei HTML-Farbkomponenten der Form "XX"
_addColors = (c1, c2) ->
    unh_c1 = unhex(c1)
    unh_c2 = unhex(c2)
    hex(unh_c1+unh_c2)

#wandelt einen hex-string in eine dezimal-zahl um
unhex = (hex) ->
    k = hex.length-1
    result = 0
    for h in hex
        result += Math.pow(16,k)*(unhsgl(h))
        k--
    return result

#wandelt eine einstellige hex-zahl in eine dez-zahl um
unhsgl = (hex) ->
    unhx = "0123456789ABCDEF"
    return unhx.indexOf(hex)

#wandelt eine dez-zahl in einen hex-string um
hex = (dec) ->
    hexes = "0123456789ABCDEF"
    reste = ""
    value = dec
    i = 2
    while (value > 0) || (i > 0)
        reste = hexes[(value%16)]+reste
        value = Math.floor(value/16)
        i -= 1
    return reste

addColors("FF0000", "0000FF")

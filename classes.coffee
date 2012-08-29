class Human
    constructor: (first_name, last_name, age, fav_meal) ->
        @first_name = first_name
        @last_name = last_name
        @age = age
        @fav_meal = fav_meal

hum001 = new Human("Hans", "Wurst", "19", "Linzer Torte")

document.write "#{hum001.first_name} mag am liebsten #{hum001.fav_meal}.<br>"

test = 1
document.write "Warum gibt es nicht die #{test}e wahrheit?"

document.write "<br>Eine Klasse der Form:<br>
                <br>class Human
                <br>    constructor: (first_name, last_name, age, fav_meal) ->
                <br>        @first_name = first_name
                <br>        @last_name = last_name
                <br>        @age = age
                <br>        @fav_meal = fav_meal<br>
<br>erzeugt Menschen-Objekte (:P) mit den vier sog. instance properties Vorname, Nachname, Alter und Lieblingsspeise. Mit CoffeeScript l&aumlsst sich das noch k&uumlrzer formulieren:<br>
<br>class Human
<br>    constructor: (@first_name, @last_name, @age, @fav_meal) -><br>
<br> Diese zwei Beschreibungen einer Klasse Mensch kompilieren zu identischem JS-Code."

# nun mal was um den '=>' zu testen:
class Product
    constructor: (@name) ->
    price: 5

    sell: ->
        alert "Ich verkaufe dieses Produkt f&ur #{@price} Dinger"

prod = new Product
price = 10
prod.sell()
# leider keine ahnung was genau das '=>' tut....

# mal was zu Vererbung!
class SomeProduct extends Product
    constructor: (name) ->
        super("Some#{name}")

thingy = new SomeProduct("Thingy")
alert "#{thingy.name}"

// Generated by CoffeeScript 1.3.3
(function() {
  var Human, Product, SomeProduct, hum001, price, prod, test, thingy,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Human = (function() {

    function Human(first_name, last_name, age, fav_meal) {
      this.first_name = first_name;
      this.last_name = last_name;
      this.age = age;
      this.fav_meal = fav_meal;
    }

    return Human;

  })();

  hum001 = new Human("Hans", "Wurst", "19", "Linzer Torte");

  document.write("" + hum001.first_name + " mag am liebsten " + hum001.fav_meal + ".<br>");

  test = 1;

  document.write("Warum gibt es nicht die " + test + "e wahrheit?");

  document.write("<br>Eine Klasse der Form:<br>                <br>class Human                <br>    constructor: (first_name, last_name, age, fav_meal) ->                <br>        @first_name = first_name                <br>        @last_name = last_name                <br>        @age = age                <br>        @fav_meal = fav_meal<br><br>erzeugt Menschen-Objekte (:P) mit den vier sog. instance properties Vorname, Nachname, Alter und Lieblingsspeise. Mit CoffeeScript l&aumlsst sich das noch k&uumlrzer formulieren:<br><br>class Human<br>    constructor: (@first_name, @last_name, @age, @fav_meal) -><br><br> Diese zwei Beschreibungen einer Klasse Mensch kompilieren zu identischem JS-Code.");

  Product = (function() {

    function Product(name) {
      this.name = name;
    }

    Product.prototype.price = 5;

    Product.prototype.sell = function() {
      return alert("Ich verkaufe dieses Produkt f&ur " + this.price + " Dinger");
    };

    return Product;

  })();

  prod = new Product;

  price = 10;

  prod.sell();

  SomeProduct = (function(_super) {

    __extends(SomeProduct, _super);

    function SomeProduct(name) {
      SomeProduct.__super__.constructor.call(this, "Some" + name);
    }

    return SomeProduct;

  })(Product);

  thingy = new SomeProduct("Thingy");

  alert("" + thingy.name);

}).call(this);

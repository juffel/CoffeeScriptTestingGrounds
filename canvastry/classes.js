// Generated by CoffeeScript 1.3.3
(function() {
  var Grid, Square, getRandomColor, updateCoordinates;

  Square = (function() {

    function Square(color, width, height) {
      this.color = color;
      this.width = width;
      this.height = height;
    }

    Square.prototype.rndColor = function() {
      return this.color = getRandomColor();
    };

    Square.prototype.changeColor = function(color) {
      return this.color = color;
    };

    Square.prototype.changeState = function(state) {
      return this.state = state;
    };

    return Square;

  })();

  Grid = (function() {
    var squares;

    squares = [];

    function Grid(canvas_name, gwidth, gheight, swidth, sheight) {
      var color, i, j, _i, _j, _ref, _ref1;
      this.canvas_name = canvas_name;
      this.gwidth = gwidth;
      this.gheight = gheight;
      this.swidth = swidth;
      this.sheight = sheight;
      for (i = _i = 0, _ref = gheight - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
        squares[i] = [];
        for (j = _j = 0, _ref1 = gwidth - 1; 0 <= _ref1 ? _j <= _ref1 : _j >= _ref1; j = 0 <= _ref1 ? ++_j : --_j) {
          color = getRandomColor();
          squares[i][j] = new Square(color, swidth, sheight);
        }
      }
    }

    Grid.prototype.drawGrid = function() {
      var arr, canvas, ctx, l_o_x, l_o_y, r_u_x, r_u_y, sq, x, y, _i, _len, _results;
      canvas = document.getElementById(this.canvas_name);
      ctx = canvas.getContext("2d");
      _results = [];
      for (x = _i = 0, _len = squares.length; _i < _len; x = ++_i) {
        arr = squares[x];
        _results.push((function() {
          var _j, _len1, _results1;
          _results1 = [];
          for (y = _j = 0, _len1 = arr.length; _j < _len1; y = ++_j) {
            sq = arr[y];
            ctx.fillStyle = sq.color;
            l_o_x = sq.width * x;
            l_o_y = sq.height * y;
            r_u_x = sq.width * (x + 1);
            r_u_y = sq.height * (y + 1);
            _results1.push(ctx.fillRect(l_o_x, l_o_y, r_u_x, r_u_y));
          }
          return _results1;
        })());
      }
      return _results;
    };

    Grid.prototype.redrawSquare = function(x, y) {
      var sq;
      sq = squares[x][y];
      sq.rndColor();
      return this.drawGrid();
    };

    Grid.prototype.redrawArea = function(x, y) {
      var datColor;
      datColor = squares[x][y].color;
      squares[(x - 1) % this.gwidth][y].changeColor(datColor);
      squares[(x + 1) % this.gwidth][y].changeColor(datColor);
      squares[x][(y - 1) % this.gheight].changeColor(datColor);
      squares[x][(y + 1) % this.gheight].changeColor(datColor);
      return this.drawGrid();
    };

    Grid.prototype.redrawArea__ = function(x, y) {
      var datColor;
      datColor = squares[x][y].color;
      squares[(x - 1) % this.gwidth][y].changeColor(datColor);
      squares[(x + 1) % this.gwidth][y].changeColor(datColor);
      squares[x][(y - 1) % this.gheight].changeColor(datColor);
      squares[x][(y + 1) % this.gheight].changeColor(datColor);
      return this.drawGrid();
    };

    Grid.prototype.clickListener = function(event) {
      var canvas, gr_x, gr_y, x, y, _ref;
      event = event || window.event;
      canvas = document.getElementById(this.canvas_name);
      x = event.pageX - canvas.offsetLeft;
      y = event.pageY - canvas.offsetTop;
      _ref = this.calcGridCoords(x, y), gr_x = _ref[0], gr_y = _ref[1];
      updateCoordinates(gr_x, gr_y);
      return this.redrawArea__(gr_x, gr_y);
    };

    Grid.prototype.activateSquare = function(x, y) {
      return this.activeSquare(x, y, 10);
    };

    Grid.prototype.activeSquare = function(x, y, count) {
      if (count <= 0) {
        return;
      }
      this.redrawSquare(x, y);
      count = count - 1;
      return setTimeout(this.activeSquare(x, y, count), 1000);
    };

    Grid.prototype.calcGridCoords = function(x, y) {
      var gr_x, gr_y;
      gr_x = Math.floor(x / this.swidth);
      gr_y = Math.floor(y / this.sheight);
      return [gr_x, gr_y];
    };

    return Grid;

  })();

  updateCoordinates = function(x, y) {
    $("#x_grid").text(x);
    return $("#y_grid").text(y);
  };

  getRandomColor = function() {
    var color, i, letters, _i;
    letters = '0123456789ABDCEF'.split('');
    color = '#';
    for (i = _i = 0; _i <= 5; i = ++_i) {
      color += letters[Math.round(Math.random() * 15)];
    }
    return color;
  };

  this.grid = new Grid("dynCan", 10, 10, 20, 20);

  document.write("<p>Dies ist ein durch ein KaffeeSkript                erzeugter Paragraph</p>                <canvas id='dynCan' width=" + (grid.gwidth * grid.swidth) + "                height=" + (grid.gheight * grid.sheight) + "                onclick='grid.clickListener()'></canvas>                               <p>Grid: X: <b id='x_grid'> no x_grid </b> |                 Y: <b id='y_grid'> no y_grid </b></p>");

  grid.drawGrid(document.getElementById("dynCan"));

}).call(this);

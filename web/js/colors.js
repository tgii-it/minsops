$(function () {

//last update : 03.04.2018
    var availableTags = ["BLUE", "BROWN", "BURGUNDY","CAMOF", "COAT", "CROWN", "GREEN", "LT BLUE", "MAROON", "WHITE"];
    $("#i_color").autocomplete({
        source: availableTags
    });
});
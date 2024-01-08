$(function () {

//last update : 03.04.2018
    var availableTags = ["BRILLIANT PRINTERS", "NUTECH PRINTERS", "SWAPNA PRINTERS"];
    $("#i_printed_at").autocomplete({
        source: availableTags
    });
});
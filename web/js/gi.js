$(function () {
//last update : 03.04.2018
    $('#gideonname').autocomplete({
        source: availableTags,
        minLength:3,
        delay:500,
        });
});
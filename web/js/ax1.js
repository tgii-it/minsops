$(function () {
//last update : 27.03.2019
    $('#auxname, #loa_auxname').autocomplete({
        source: availableTags,
        minLength:3,
        delay:500,
        });
});
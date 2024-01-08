$(function () {

//last update : 03.04.2018
    var availableTags = ["ASSAMESE","BENGALI","BHOJPURI","BORO","ENGLISH","GARO","GUJARATI","HINDI","HINDI PS AND PR","HOLY BIBLE","HOLY BIBLE PWB","KANNADA","KANNADA H AND H","KHASI","KOK BOROK ","KONKANI ","MALAYALAM","MANIPURI","MARATHI","MIZO","NEPALI","ORIYA","PUNJABI","SANTALI","TAMIL","TAMIL H AND H","TAMIL PS AND PR","TELUGU","URDU"];
        $("#i_language").autocomplete({
            source: availableTags
        });
});
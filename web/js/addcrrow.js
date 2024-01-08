$(document).ready(function () {
    var counter = 21;

    $("#addrow1").on("click", function () {
        if (counter === 21) {
            document.getElementById("cr21").hidden = false;
        } else if (counter === 22) {
            document.getElementById("cr22").hidden = false;
        } else if (counter === 23) {
            document.getElementById("cr23").hidden = false;
        } else if (counter === 24) {
            document.getElementById("cr24").hidden = false;
        } else if (counter === 25) {
            document.getElementById("cr25").hidden = false;
        } else if (counter === 26) {
            document.getElementById("cr26").hidden = false;
        } else if (counter === 27) {
            document.getElementById("cr27").hidden = false;
        } else if (counter === 28) {
            document.getElementById("cr28").hidden = false;
        } else if (counter === 29) {
            document.getElementById("cr29").hidden = false;
        } else if (counter === 30) {
            document.getElementById("cr30").hidden = false;
        }
        counter++;
    });

    $("table.order-list").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").val('');
        $(this).closest("tr").hide();
        counter -= 1;
    });

});
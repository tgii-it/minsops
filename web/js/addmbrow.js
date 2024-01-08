$(document).ready(function () {
    var counter = 11;

    $("#addrow").on("click", function () {
        // var newRow = $("<tr>");
        // var cols = "";
        if (counter === 11) {
            document.getElementById("mb11").hidden = false;
        } else if (counter === 12) {
            document.getElementById("mb12").hidden = false;
        } else if (counter === 13) {
            document.getElementById("mb13").hidden = false;
        } else if (counter === 14) {
            document.getElementById("mb14").hidden = false;
        } else if (counter === 15) {
            document.getElementById("mb15").hidden = false;
        } else if (counter === 16) {
            document.getElementById("mb16").hidden = false;
        } else if (counter === 17) {
            document.getElementById("mb17").hidden = false;
        } else if (counter === 18) {
            document.getElementById("mb18").hidden = false;
        } else if (counter === 19) {
            document.getElementById("mb19").hidden = false;
        } else if (counter === 20) {
            document.getElementById("mb20").hidden = false;
        }
        counter++;
    });

    $("table.order-list").on("click", ".ibtnmbDel", function (event) {
        $(this).closest("tr").val('');
        $(this).closest("tr").hide();
        counter -= 1;
    });

});

//   function calculateRow(row) {
//       var price = +row.find('input[name^="price"]').val();

//   }

//    function calculateGrandTotal() {
//      var grandTotal = 0;
//      $("table.order-list").find('input[name^="price"]').each(function () {
//         grandTotal += +$(this).val();
//     });
//     $("#grandtotal").text(grandTotal.toFixed(2));
//  }
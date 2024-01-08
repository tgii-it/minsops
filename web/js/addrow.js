$(document).ready(function () {
    var counter = 21;
    $("#addrow123").on("click", function () {
        var newRow = $("<tr>");
        var cols = "";
        cols += '<td><input type="hidden" class="form-control" name="miniblitz' + counter + '" value="CHURCH RALKY"/>CHURCH RALLY</td>';
        cols += '<td><input type="text" class="form-control" name="edate' + counter + '" id="edate' + counter + '"/></td>';
        cols += '<td><input type="text" class="form-control" name="goal' + counter + '"/></td>';
        cols += '<td><input type="button" class="ibtnDel btn btn-md btn-danger "  value="Delete"></td>';
        newRow.append(cols);
        $("table.order-list").append(newRow);
        counter++;
    });
    $("table.order-list").on("click", ".ibtnDel", function (event) {
        $(this).closest("tr").remove();
        counter -= 1
    });
});
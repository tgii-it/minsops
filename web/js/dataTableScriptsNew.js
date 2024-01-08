
$(document).on('click', '.insert', function (e) {
    $('#e503_camp').prop("disabled", false);
    $('#contactperson').prop("disabled", false);
    var mid = $('#mid').val();
    var camp = $('#e503_camp').val();
    var epaydate = $('#epaydate').val();
    var remitter = $('#contactperson').val();
    $('#snackbar1').show();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $.ajax({
            url: 'pay.jsp?action=Insert',
            type: "post",
            data: $('.add').serialize(),
            success: function (data) {
                alert(data);
                $('#insert').show();
                var table;
                table = $('#payments').DataTable({
                    destroy: true,
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    "iDisplayLength": 3,
                    lengthMenu: [
                        [3, 5, 10, 25, -1],
                        ['3 rows', '5 rows', '10 rows', '25 rows', 'Show all']
                    ],
                    buttons: [
                        'pageLength',
                        {
                            text: 'Reload Table',
                            action: function () {
                                table.ajax.reload();
                            }
                        }
                    ],
                    'select': {'style': 'multi'},
                    'order': [[1, 'asc']],
                    ajax: {
                        method: "POST",
                        url: "pay_table?type=Annual Renewal&mid=" + mid,
                        dataSrc: "datas"
                    },
                    columns: [
                        {"data": "e503month"},
                        {"data": "e503year"},
                        {"data": "camp"},
                        {"data": "contactperson"},
                        {"data": "paymode"},
                        {"data": "trno"},
                        {"data": "trdate"},
                        {"data": "tramount"},
                        {"data": "trbank"},
                        {"data": "trbranch"},
                        {"data": "trremarks"},
                        {"data": "action"}
                    ], columnDefs: [
                        {className: 'text-right', targets: [7]}

                    ],
                    "footerCallback": function (row, data, start, end, display) {
                        var api = this.api(), data;
                        // Remove the formatting to get integer data for summation
                        var intVal = function (i) {
                            return typeof i === 'string' ?
                                    i.replace(/[\$,]/g, '') * 1 :
                                    typeof i === 'number' ?
                                    i : 0;
                        };
                        // Total over all pages

                        total7 = api
                                .column(7)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        // Total over this page

                        pageTotal7 = api
                                .column(7, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        // Update footer

                        $(api.column(7).footer()).html(
                                '' + pageTotal7 + '<br>(' + total7 + ')'
                                );
                        $('#payCheck').val(total7);
                    }
                });
                $('#myModal form')[0].reset();
                $('.modal-backdrop').remove();
                $('#mid').val(mid);
                $('#e503_camp').val(camp);
                $('#epaydate').val(epaydate);
                $('#contactperson').val(remitter);
                $('#e503_camp').prop("disabled", true);
                $('#contactperson').prop("disabled", true);
            }
        });
    } else {
        $('#myModal').modal('show');
        return false;
    }
});

$(document).on('click', '.insert_cro', function (e) {
    var mid = $('#cro_mid').val();
    var v_cp_date = $('#cp_date').val();
    var v_cp_amount = $('#cp_amount').val();
    if (v_cp_date == null) {
        alert("Please select CP date");
    }
    if (v_cp_amount == null) {
        alert("Please enter CP Amount");
    }
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'cro_insert.jsp',
            type: "post",
            data: $('.add_cro').serialize(),
            success: function (data) {
                $('#cro_table').DataTable().ajax.reload();
                $('#cp_date').val('');
                $('#cp_amount').val('');
                $('#speaker_name').val('');
                $('#church_name').val('');
                $('#church_address').val('');
                $('#pastor_name').val('');
                $('#pastor_number').val('');
                $('#pastor_email').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#cro_modal').modal('show');
        });

        var table = $('#cro_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_cro_e503.jsp?mid=' + $('#mid').val(),
                dataSrc: "datas"
            },
            columns: [
                {"data": "cp_date"},
                {"data": "church_name"},
                {"data": "pastor_name"},
                {"data": "speaker_name"},
                {"data": "cpcnt"},
                {"data": "cp_amount"},
                {"data": "edit"},
                {"data": "pastor_mobile"},
                {"data": "pastor_email"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0, 7]},
                {className: 'text-center', targets: [4, 6]},
                {className: 'text-right', targets: [5]},
                {className: 'text-left', targets: [7, 8]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total4 = api
                        .column(4)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total5 = api
                        .column(5)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal4 = api
                        .column(4, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal5 = api
                        .column(5, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(4).footer()).html(
                        '' + pageTotal4 + '<br>(' + total4 + ')'
                        );
                $(api.column(5).footer()).html(
                        '' + pageTotal5 + '<br>(' + total5 + ')'
                        );
                $('#cpcnt').val(total4);
                $('#croamount').val(total5);
                crochange();
            }
        });
    } else {
        $('#cro_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.insert_donor', function (e) {
    var mid = $('#external_id').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'donor_insert.jsp',
            type: "post",
            data: $('.add_donor').serialize(),
            success: function (data) {
                $('#donor_table').DataTable().ajax.reload();
                $('#donor_name').val('');
                $('#donor_mobile1').val('');
                $('#donor_mobile2').val('');
                $('#donor_email1').val('');
                $('#donor_email2').val('');
                $('#donor_amount').val('');
                $('#donor_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#donor_modal').modal('show');
        });
        $('#external_id').val(mid);
        var table = $('#donor_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_donor_e503.jsp?mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "name"},
                {"data": "mobile1"},
                {"data": "mobile2"},
                {"data": "email1"},
                {"data": "email2"},
                {"data": "camount"},
                {"data": "edit"},
                {"data": "remarks"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0]},
                {className: 'text-center', targets: [4, 6]},
                {className: 'text-right', targets: [5]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total5 = api
                        .column(5)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal5 = api
                        .column(5, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(5).footer()).html(
                        '' + pageTotal5 + '<br>(' + total5 + ')'
                        );
                $('#ffoamount').val(total5);
                ffochange();
            }
        });
    } else {
        $('#donor_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.pwt_add_gideon', function (e) {
    var gideon_language = $("#gideon_language").val();
    var gideon_type = $("#gideon_type").val();
    var gideon_color = $("#gideon_color").val();
    var gideon_cost = $("#gideon_cost").val();
    var gideon_qty = $("#gideon_qty").val();
    var mid = $("#mid4").val();
    var camp = $("#camp3").val();
    var username = $("#username").val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'pwt_add_e503.jsp',
            type: "post",
            data: {"language": gideon_language, "type": gideon_type, "color": gideon_color, "qty": gideon_qty, "cost": gideon_cost, "camp": camp, "username": username, "mid": mid},
            success: function (data) {
                $('#pwt_gid_table').DataTable().ajax.reload();
                $('#gideon_language').val('0');
                $('#gideon_type').val('PWT-Gideon');
                $('#gideon_color').val('Brown');
                $('#gideon_qty').val('');
                $('#gideon_cost').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#pwt_gideon_modal').modal('show');
        });
        $('#mid4').val(mid);
        var table = $('#pwt_gid_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_pwt_e503.jsp?type=gideon&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "type"},
                {"data": "language"},
                {"data": "color"},
                {"data": "qty"},
                {"data": "cost"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-center', targets: [3, 5]},
                {className: 'text-right', targets: [4]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total4 = api
                        .column(4)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal4 = api
                        .column(4, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $(api.column(4).footer()).html(
                        '' + pageTotal4 + '<br>(' + total4 + ')'
                        );
                $('#pwtgcnt').val(total3);
                $('#pwtgamount').val(total4);
                pwtgcntchange();
            }
        });
    } else {
        $('#pwt_gideon_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.pwt_add_aux', function (e) {
    var aux_language = $("#aux_language").val();
    var aux_type = $("#aux_type").val();
    var aux_color = $("#aux_color").val();
    var aux_qty = $("#aux_qty").val();
    var aux_cost = $("#aux_cost").val();
    var camp = $("#camp4").val();
    var mid = $("#mid5").val();
    var username = $("#username").val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'pwt_add_e503.jsp',
            type: "post",
            data: {"language": aux_language, "type": aux_type, "color": aux_color, "qty": aux_qty, "cost": aux_cost, "camp": camp, "username": username, "mid": mid},
            success: function (data) {
                $('#pwt_aux_table').DataTable().ajax.reload();
                $('#aux_language').val('0');
                $('#aux_type').val('PWT-Auxiliary');
                $('#aux_color').val('Lt Blue');
                $('#aux_qty').val('');
                $('#aux_cost').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#pwt_aux_modal').modal('show');
        });
        $('#mid5').val(mid);
        var table = $('#pwt_aux_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_pwt_e503.jsp?type=aux&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "type"},
                {"data": "language"},
                {"data": "color"},
                {"data": "qty"},
                {"data": "cost"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-center', targets: [3, 5]},
                {className: 'text-right', targets: [4]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total4 = api
                        .column(4)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal4 = api
                        .column(4, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $(api.column(4).footer()).html(
                        '' + pageTotal4 + '<br>(' + total4 + ')'
                        );
                $('#pwtacnt').val(total3);
                $('#pwtaamount').val(total4);
                pwtacntchange();
            }
        });
    } else {
        $('#pwt_aux_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.pwt_add_hb', function (e) {
    var hb_language = $("#hb_language").val();
    var hb_type = $("#hb_type").val();
    var hb_color = $("#hb_color").val();
    var hb_qty = $("#hb_qty").val();
    var hb_cost = $("#hb_cost").val();
    var camp = $("#camp5").val();
    var mid = $("#mid6").val();
    var username = $("#username").val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'pwt_add_e503.jsp',
            type: "post",
            data: {"language": hb_language, "type": hb_type, "color": hb_color, "qty": hb_qty, "cost": hb_cost, "camp": camp, "username": username, "mid": mid},
            success: function (data) {
                $('#pwt_hb_table').DataTable().ajax.reload();
                $('#hb_language').val('English');
                $('#hb_type').val('PWT-Holy Bible');
                $('#hb_color').val('Burgundy');
                $('#hb_qty').val('');
                $('#hb_cost').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#pwt_hb_modal').modal('show');
        });
        $('#mid6').val(mid);
        var table = $('#pwt_hb_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_pwt_e503.jsp?type=hb&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "type"},
                {"data": "language"},
                {"data": "color"},
                {"data": "qty"},
                {"data": "cost"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-center', targets: [3, 5]},
                {className: 'text-right', targets: [4]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total4 = api
                        .column(4)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal4 = api
                        .column(4, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $(api.column(4).footer()).html(
                        '' + pageTotal4 + '<br>(' + total4 + ')'
                        );
                $('#pwthbcnt').val(total3);
                $('#pwthbamount').val(total4);
                pwthbcntchange();
            }
        });
    } else {
        $('#pwt_hb_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.pwt_add_lb', function (e) {
    var lb_type = $("#lb_type").val();
    var lb_language = $("#lb_language").val();
    var lb_color = $("#lb_color").val();
    var lb_qty = $("#lb_qty").val();
    var lb_cost = $("#lb_cost").val();
    var camp = $("#camp6").val();
    var mid = $("#mid7").val();
    var username = $("#username").val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'pwt_add_e503.jsp',
            type: "post",
            data: {"language": lb_language, "type": lb_type, "color": lb_color, "qty": lb_qty, "cost": lb_cost, "camp": camp, "username": username, "mid": mid},
            success: function (data) {
                $('#pwt_lb_table').DataTable().ajax.reload();
                $('#lb_language').val('English');
                $('#lb_type').val('PWT-Leather Bound');
                $('#lb_color').val('0');
                $('#lb_qty').val('');
                $('#lb_cost').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#pwt_lb_modal').modal('show');
        });
        $('#mid7').val(mid);
        var table = $('#pwt_lb_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_pwt_e503.jsp?type=lb&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "type"},
                {"data": "language"},
                {"data": "color"},
                {"data": "qty"},
                {"data": "cost"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-center', targets: [3, 5]},
                {className: 'text-right', targets: [4]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total4 = api
                        .column(4)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal4 = api
                        .column(4, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $(api.column(4).footer()).html(
                        '' + pageTotal4 + '<br>(' + total4 + ')'
                        );
                $('#pwtlbcnt').val(total3);
                $('#pwtlbamount').val(total4);
                pwtlbcntchange();
            }
        });
    } else {
        $('#pwt_lb_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.special_add_slim', function (e) {
    var slim_type = $("#slim_type").val();
    var slim_cost = $("#slim_cost").val();
    var slim_qty = $("#slim_qty").val();
    var camp = $("#camp7").val();
    var mid = $("#mid8").val();
    var username = $("#username").val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'special_add_e503.jsp',
            type: "post",
            data: {"type": slim_type, "qty": slim_qty, "cost": slim_cost, "camp": camp, "username": username, "mid": mid},
            success: function (data) {
                $('#special_table').DataTable().ajax.reload();
                $('#slim_type').val('Slim Line');
                $('#slim_cost').val('');
                $('#slim_qty').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#slim_modal').modal('show');
        });
        $('#mid8').val(mid);
        var table = $('#special_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_special_e503.jsp?type=slimline&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "type"},
                {"data": "qty"},
                {"data": "cost"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-center', targets: [1, 3]},
                {className: 'text-right', targets: [2]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total1 = api
                        .column(1)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal1 = api
                        .column(1, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(1).footer()).html(
                        '' + pageTotal1 + '<br>(' + total1 + ')'
                        );
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $('#slcnt').val(total1);
                $('#slamount').val(total2);
                slimlinecntchange();
            }
        });
    } else {
        $('#slim_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.special_add_di', function (e) {
    var di_type = $("#di_type").val();
    var di_cost = $("#di_cost").val();
    var di_qty = $("#di_qty").val();
    var camp = $("#camp8").val();
    var mid = $("#mid9").val();
    var username = $("#username").val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'special_add_e503.jsp',
            type: "post",
            data: {"type": di_type, "qty": di_qty, "cost": di_cost, "camp": camp, "username": username, "mid": mid},
            success: function (data) {
                $('#special_di_table').DataTable().ajax.reload();
                $('#di_type').val('Indian Dignitary');
                $('#di_cost').val('');
                $('#di_qty').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#special_add_di_modal').modal('show');
        });
        $('#mid9').val(mid);
        var table = $('#special_di_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_special_e503.jsp?type=indiandi&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "type"},
                {"data": "qty"},
                {"data": "cost"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-center', targets: [1, 3]},
                {className: 'text-right', targets: [2]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total1 = api
                        .column(1)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal1 = api
                        .column(1, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(1).footer()).html(
                        '' + pageTotal1 + '<br>(' + total1 + ')'
                        );
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $('#dicnt').val(total1);
                $('#diamount').val(total2);
                dicntchange();
            }
        });
    } else {
        $('#special_add_di_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.special_add_dii', function (e) {
    var dii_type = $("#dii_type").val();
    var dii_cost = $("#dii_cost").val();
    var dii_qty = $("#dii_qty").val();
    var camp = $("#camp9").val();
    var mid = $("#mid10").val();
    var username = $("#username").val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'special_add_e503.jsp',
            type: "post",
            data: {"type": dii_type, "qty": dii_qty, "cost": dii_cost, "camp": camp, "username": username, "mid": mid},
            success: function (data) {
                $('#special_dii_table').DataTable().ajax.reload();
                $('#dii_type').val('International Dignitary');
                $('#dii_cost').val('');
                $('#dii_qty').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#special_add_dii_modal').modal('show');
        });
        $('#mid10').val(mid);
        var table = $('#special_dii_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_special_e503.jsp?type=internationaldi&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "type"},
                {"data": "qty"},
                {"data": "cost"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-center', targets: [1, 3]},
                {className: 'text-right', targets: [2]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total1 = api
                        .column(1)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal1 = api
                        .column(1, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(1).footer()).html(
                        '' + pageTotal1 + '<br>(' + total1 + ')'
                        );
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $('#diincnt').val(total1);
                $('#diinamount').val(total2);
                diicntchange();
            }
        });
    } else {
        $('#special_add_dii_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.insert_agr', function (e) {
    var mid = $('#agr_mid').val();
    var v_name = $('#gideonname').val();
    if (v_name == null) {
        alert("Please search & select Gideon Name");
    }

    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'agr_insert.jsp',
            type: "post",
            data: $('.add_agr').serialize(),
            success: function (data) {
                $('#agr_table').DataTable().ajax.reload();
                $('#agr_reference').val('');
                $('#agr_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#agr_modal').modal('show');
        });

        var table = $('#agr_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_agr_e503.jsp?action=agr&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "name"},
                {"data": "type"},
                {"data": "count"},
                {"data": "amount"},
                {"data": "status"},
                {"data": "reference"},
                {"data": "request_date"},
                {"data": "requested_by"},
                {"data": "remarks"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0]},
                {className: 'text-center', targets: [2, 8]},
                {className: 'text-right', targets: [3]},
                {className: 'text-left', targets: [0, 1, 4, 5, 6, 7]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $('#agcnt').val(total2);
                $('#agfee').val(total3);
                agcntchange();
            }
        });
    } else {
        $('#agr_modal').modal('show');
        return false;
    }
});

$(document).on('click', '.insert_aga', function (e) {
    var mid = $('#aga_mid').val();
    var v_name = $('#auxname').val();
    if (v_name === null) {
        alert("Please search & select Auxililary Name");
    }

    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'aga_insert.jsp',
            type: "post",
            data: $('.add_aga').serialize(),
            success: function (data) {
                $('#aga_table').DataTable().ajax.reload();
                $('#aga_reference').val('');
                $('#aga_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#aga_modal').modal('show');
        });

        var table = $('#aga_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_agr_e503.jsp?action=aga&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "name"},
                {"data": "type"},
                {"data": "count"},
                {"data": "amount"},
                {"data": "status"},
                {"data": "reference"},
                {"data": "request_date"},
                {"data": "requested_by"},
                {"data": "remarks"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0]},
                {className: 'text-center', targets: [2, 8]},
                {className: 'text-right', targets: [3]},
                {className: 'text-left', targets: [0, 1, 4, 5, 6, 7]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $('#aacnt').val(total2);
                $('#aafee').val(total3);
                aacntchange();
            }
        });
    } else {
        $('#aga_modal').modal('show');
        return false;
    }
});

$(document).on('click', '.insert_loa', function (e) {
    var mid = $('#loa_mid').val();
    var v_name = $('#loa_auxname').val();
    if (v_name === null) {
        alert("Please search & select Auxililary Name");
    }

    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'loa_insert.jsp?action=loa',
            type: "post",
            data: $('.add_loa').serialize(),
            success: function (data) {
                $('#loa_table').DataTable().ajax.reload();
                $('#loa_reference').val('');
                $('#loa_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#loa_modal').modal('show');
        });

        var table = $('#loa_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_agr_e503.jsp?action=loa&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "name"},
                {"data": "type"},
                {"data": "count"},
                {"data": "amount"},
                {"data": "status"},
                {"data": "reference"},
                {"data": "request_date"},
                {"data": "requested_by"},
                {"data": "remarks"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0]},
                {className: 'text-center', targets: [2, 8]},
                {className: 'text-right', targets: [3]},
                {className: 'text-left', targets: [0, 1, 4, 5, 6, 7]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $('#lacnt').val(total2);
                $('#lafee').val(total3);
                lacntchange();
            }
        });
    } else {
        $('#loa_modal').modal('show');
        return false;
    }
});

$(document).on('click', '.insert_log', function (e) {
    var mid = $('#log_mid').val();
    var v_name = $('#log_name').val();
    if (v_name === null) {
        alert("Please search & select Gideon Name");
    }

    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'log_insert.jsp?action=log',
            type: "post",
            data: $('.add_log').serialize(),
            success: function (data) {
                $('#log_table').DataTable().ajax.reload();
                $('#log_reference').val('');
                $('#log_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#log_modal').modal('show');
        });

        var table = $('#log_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_agr_e503.jsp?action=log&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "name"},
                {"data": "type"},
                {"data": "count"},
                {"data": "amount"},
                {"data": "status"},
                {"data": "reference"},
                {"data": "request_date"},
                {"data": "requested_by"},
                {"data": "remarks"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0]},
                {className: 'text-center', targets: [2, 8]},
                {className: 'text-right', targets: [3]},
                {className: 'text-left', targets: [0, 1, 4, 5, 6, 7]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $('#lgcnt').val(total2);
                $('#lgfee').val(total3);
                lgcntchange();
            }
        });
    } else {
        $('#log_modal').modal('show');
        return false;
    }
});

$(document).on('click', '.insert_nlg', function (e) {
    var mid = $('#nlg_mid').val();
    var v_name = $('#nlg_name').val();
    if (v_name === null) {
        alert("Please search & select Gideon Name");
    }

    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'nlg_insert.jsp?action=nlg',
            type: "post",
            data: $('.add_nlg').serialize(),
            success: function (data) {
                $('#nlg_table').DataTable().ajax.reload();
                $('#nlg_name').val('');
                $('#nlg_reference').val('');
                $('#nlg_mobile').val('');
                $('#nlg_email').val('');
                $('#nlg_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#nlg_modal').modal('show');
        });

        var table = $('#nlg_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_agr_e503.jsp?action=nlg&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "name"},
                {"data": "type"},
                {"data": "count"},
                {"data": "amount"},
                {"data": "status"},
                {"data": "reference"},
                {"data": "request_date"},
                {"data": "requested_by"},
                {"data": "remarks"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0]},
                {className: 'text-center', targets: [2, 8]},
                {className: 'text-right', targets: [3]},
                {className: 'text-left', targets: [0, 1, 4, 5, 6, 7]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $('#nlgcnt').val(total2);
                $('#nlgfee').val(total3);
                nlgcntchange();
            }
        });
    } else {
        $('#nlg_modal').modal('show');
        return false;
    }
});

$(document).on('click', '.insert_nla', function (e) {
    var mid = $('#nla_mid').val();
    var v_name = $('#nla_name').val();
    if (v_name === null) {
        alert("Please search & select Auxiliary Name");
    }

    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'nla_insert.jsp?action=nla',
            type: "post",
            data: $('.add_nla').serialize(),
            success: function (data) {
                $('#nla_table').DataTable().ajax.reload();
                $('#nla_name').val('');
                $('#nla_reference').val('');
                $('#nla_mobile').val('');
                $('#nla_email').val('');
                $('#nla_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#nla_modal').modal('show');
        });

        var table = $('#nla_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_agr_e503.jsp?action=nla&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "name"},
                {"data": "type"},
                {"data": "count"},
                {"data": "amount"},
                {"data": "status"},
                {"data": "reference"},
                {"data": "request_date"},
                {"data": "requested_by"},
                {"data": "remarks"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0]},
                {className: 'text-center', targets: [2, 8]},
                {className: 'text-right', targets: [3]},
                {className: 'text-left', targets: [0, 1, 4, 5, 6, 7]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $('#nlacnt').val(total2);
                $('#nlafee').val(total3);
                nlacntchange();
            }
        });
    } else {
        $('#nla_modal').modal('show');
        return false;
    }
});

$(document).on('click', '.insert_nag', function (e) {
    var mid = $('#nag_mid').val();
    var v_name = $('#nag_name').val();
    if (v_name == null) {
        alert("Please search & select Gideon Name");
    }

    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'nag_insert.jsp',
            type: "post",
            data: $('.add_nag').serialize(),
            success: function (data) {
                $('#nag_table').DataTable().ajax.reload();
                $('#nag_name').val('');
                $('#nag_reference').val('');
                $('#nag_mobile').val('');
                $('#nag_email').val('');
                $('#nag_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#nag_modal').modal('show');
        });

        var table = $('#nag_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_agr_e503.jsp?action=nag&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "name"},
                {"data": "type"},
                {"data": "count"},
                {"data": "amount"},
                {"data": "status"},
                {"data": "reference"},
                {"data": "request_date"},
                {"data": "requested_by"},
                {"data": "remarks"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0]},
                {className: 'text-center', targets: [2, 8]},
                {className: 'text-right', targets: [3]},
                {className: 'text-left', targets: [0, 1, 4, 5, 6, 7]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $('#nagcnt').val(total2);
                $('#nagfee').val(total3);
                nagcntchange();
            }
        });
    } else {
        $('#nag_modal').modal('show');
        return false;
    }
});


$(document).on('click', '.insert_naa', function (e) {
    var mid = $('#naa_mid').val();
    var v_name = $('#naa_name').val();
    if (v_name == null) {
        alert("Please search & select Auxiliary Name");
    }

    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Submit this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'naa_insert.jsp',
            type: "post",
            data: $('.add_naa').serialize(),
            success: function (data) {
                $('#naa_table').DataTable().ajax.reload();
                $('#naa_name').val('');
                $('#naa_reference').val('');
                $('#naa_mobile').val('');
                $('#naa_email').val('');
                $('#naa_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#naa_modal').modal('show');
        });

        var table = $('#naa_table').DataTable({
            destroy: true,
            responsive: true,
            stateSave: true,
            "ordering": true,
            'processing': true,
            'language': {
                'loadingRecords': '&nbsp;',
                'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 20px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Loading data..</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
            },
            rowId: 'extn',
            deferRender: true,
            dom: 'Bfrtip',
            "iDisplayLength": 3,
            lengthMenu: [
                [5, 10, 25, -1],
                ['5 rows', '10 rows', '25 rows', 'Show all']
            ],
            buttons: [
                'pageLength',
                {
                    text: 'Reload Table',
                    action: function () {
                        table.ajax.reload();
                    }
                }
            ],
            'select': {'style': 'multi'},
            'order': [[1, 'asc']],
            ajax: {
                method: "POST",
                url: 'table_of_agr_e503.jsp?action=naa&mid=' + mid,
                dataSrc: "datas"
            },
            columns: [
                {"data": "name"},
                {"data": "type"},
                {"data": "count"},
                {"data": "amount"},
                {"data": "status"},
                {"data": "reference"},
                {"data": "request_date"},
                {"data": "requested_by"},
                {"data": "remarks"},
                {"data": "action"}
            ], columnDefs: [
                {className: 'text-nowrap', targets: [0]},
                {className: 'text-center', targets: [2, 8]},
                {className: 'text-right', targets: [3]},
                {className: 'text-left', targets: [0, 1, 4, 5, 6, 7]}
            ],
            "footerCallback": function (row, data, start, end, display) {
                var api = this.api(), data;
                var intVal = function (i) {
                    return typeof i === 'string' ?
                            i.replace(/[\$,]/g, '') * 1 :
                            typeof i === 'number' ?
                            i : 0;
                };
                total2 = api
                        .column(2)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                total3 = api
                        .column(3)
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal2 = api
                        .column(2, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                pageTotal3 = api
                        .column(3, {page: 'current'})
                        .data()
                        .reduce(function (a, b) {
                            return intVal(a) + intVal(b);
                        }, 0);
                $(api.column(2).footer()).html(
                        '' + pageTotal2 + '<br>(' + total2 + ')'
                        );
                $(api.column(3).footer()).html(
                        '' + pageTotal3 + '<br>(' + total3 + ')'
                        );
                $('#naacnt').val(total2);
                $('#naafee').val(total3);
                naacntchange();
            }
        });
    } else {
        $('#naa_modal').modal('show');
        return false;
    }
});

$(document).on('click', '.deletecroRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#cro_mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "croDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#cro_table').DataTable().ajax.reload();
                $("#cp_date").datepicker().datepicker("setDate", new Date());
                $('#cp_amount').val('');
                $('#speaker_name').val('');
                $('#church_name').val('');
                $('#church_address').val('');
                $('#pastor_name').val('');
                $('#pastor_number').val('');
                $('#pastor_email').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#cro_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletedonorRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#external_id').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "donorDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#donor_table').DataTable().ajax.reload();
                $('#donor_name').val('');
                $('#donor_mobile1').val('');
                $('#donor_mobile2').val('');
                $('#donor_email1').val('');
                $('#donor_email2').val('');
                $('#donor_amount').val('');
                $('#donor_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#donor_modal').modal('show');
        });
    }
});

$(document).on('click', '.deleteagrRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#agr_mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "agrDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#agr_table').DataTable().ajax.reload();
                $('#agr_reference').val('');
                $('#agr_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#agr_modal').modal('show');
        });
    }
});

$(document).on('click', '.deleteagaRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#aga_mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "agaDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#aga_table').DataTable().ajax.reload();
                $('#aga_reference').val('');
                $('#aga_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#aga_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletenlgRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#nlg_mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "nlgDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#nlg_table').DataTable().ajax.reload();
                $('#nlg_reference').val('');
                $('#nlg_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#nlg_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletenlaRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#nla_mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "nlaDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#nla_table').DataTable().ajax.reload();
                $('#nla_reference').val('');
                $('#nla_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#nla_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletenagRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#nag_mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "nagDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#nag_table').DataTable().ajax.reload();
                $('#nag_reference').val('');
                $('#nag_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#nag_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletenaaRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#naa_mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "naaDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#naa_table').DataTable().ajax.reload();
                $('#naa_reference').val('');
                $('#naa_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#naa_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletelogRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#log_mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "logDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#log_table').DataTable().ajax.reload();
                $('#log_reference').val('');
                $('#log_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#log_modal').modal('show');
        });
    }
});

$(document).on('click', '.deleteloaRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#loa_mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "loaDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#loa_table').DataTable().ajax.reload();
                $('#loa_reference').val('');
                $('#loa_remarks').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#loa_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletepwtgRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#mid4').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "pwtgDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#pwt_gid_table').DataTable().ajax.reload();
                $('#gideon_language').val('0');
                $('#gideon_type').val('PWT-Gideon');
                $('#gideon_color').val('Brown');
                $('#gideon_qty').val('');
                $('#gideon_cost').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#pwt_gideon_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletepwtaRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#mid5').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "pwtaDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#pwt_aux_table').DataTable().ajax.reload();
                $('#aux_language').val('0');
                $('#aux_type').val('PWT-Auxiliary');
                $('#aux_color').val('Lt Blue');
                $('#aux_qty').val('');
                $('#aux_cost').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#pwt_aux_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletepwthbRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#mid6').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "pwthbDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#pwt_hb_table').DataTable().ajax.reload();
                $('#hb_language').val('English');
                $('#hb_type').val('PWT-Holy Bible');
                $('#hb_color').val('Burgundy');
                $('#hb_qty').val('');
                $('#hb_cost').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#pwt_hb_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletepwtlbRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#mid7').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "pwtlbDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#pwt_lb_table').DataTable().ajax.reload();
                $('#lb_language').val('English');
                $('#lb_type').val('PWT-Leather Bound');
                $('#lb_color').val('0');
                $('#lb_qty').val('');
                $('#lb_cost').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#pwt_lb_modal').modal('show');
        });
    }
});

$(document).on('click', '.deleteSplBslRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#mid8').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "slDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#special_table').DataTable().ajax.reload();
                $('#slim_type').val('Slim Line');
                $('#slim_cost').val('');
                $('#slim_qty').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#slim_modal').modal('show');
        });
    }
});

$(document).on('click', '.deleteSplBindianRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#mid9').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "indianDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#special_di_table').DataTable().ajax.reload();
                $('#di_type').val('Indian Dignitary');
                $('#di_cost').val('');
                $('#di_qty').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#special_add_di_modal').modal('show');
        });
    }
});

$(document).on('click', '.deleteSplBiRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#mid10').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "internationalDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#special_dii_table').DataTable().ajax.reload();
                $('#dii_type').val('International Dignitary');
                $('#dii_cost').val('');
                $('#dii_qty').val('');
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#special_add_dii_modal').modal('show');
        });
    }
});

$(document).on('click', '.deletePayRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "payDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#payments').DataTable().ajax.reload();
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
    }
});

$(document).on('click', '.deleteSupDocRow', function (e) {
    var v_rid = $(this).attr('id');
    var v_mid = $('#mid').val();
    e.preventDefault();
    var r = confirm("Are you sure ? Do you want to Delete this record ?");
    if (r === true) {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $.ajax({
            url: 'ProcessDelete.jsp',
            type: "post",
            data: {"action": "supdocDelete", "mid": v_mid, "rid": v_rid},
            success: function (data) {
                $('#supDoc').DataTable().ajax.reload();
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
    }
});
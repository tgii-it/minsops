$(document).on('ready', function (e) {
    $.ajax({
        url: 'mid_val',
        type: 'POST',
        dataType: 'json',
        success: function (data) {
            $('#mid').val(data.mid);
            $('#mid1').val(data.mid);
            $('#mid2').val(data.mid);
            $('#mid3').val(data.mid);
            $('#mid4').val(data.mid);
            $('#mid5').val(data.mid);
            $('#mid6').val(data.mid);
            $('#mid7').val(data.mid);
            $('#mid8').val(data.mid);
            $('#external_id').val(data.mid);
            $('#mid9').val(data.mid);
            $('#mid10').val(data.mid);
            $('#cro_mid').val(data.mid);
            $('#cro_mid1').val(data.mid);
            $('#masterid').val(data.mid);
            $('#agr_mid').val(data.mid);
            $('#aga_mid').val(data.mid);
            $('#loa_mid').val(data.mid);
            $('#log_mid').val(data.mid);
            $('#nla_mid').val(data.mid);
            $('#nlg_mid').val(data.mid);
            $('#nag_mid').val(data.mid);
            $('#naa_mid').val(data.mid);
            $('#vmid').html(data.mid);
            $("#fileuploader").uploadFile({
                url: "v_action_file_upload.jsp?sId=" + data.mid,
                fileName: "myfile",
                onSuccess: function (files, data, xhr, pd)
                {
                    alert("File Uploaded successfully! ");
                    $('#supDoc').DataTable().ajax.reload();
                }
            });

            var table;
            table = $('#supDoc').DataTable({
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
                "iDisplayLength": 3,
                lengthMenu: [
                    [5, 10, 25, -1],
                    ['5 rows', '10 rows', '25 rows', 'Show all']
                ],
                ajax: {
                    method: "POST",
                    url: "e503fetchSupportingDocuments?sId=" + data.mid,
                    dataSrc: "datas"
                },
                columns: [
                    {"data": "sid"},
                    {"data": "rid"},
                    {"data": "filename"},
                    {"data": "uploaded_on"},
                    {"data": "view"},
                    {"data": "action"}
                ], columnDefs: [
                    {className: 'text-nowrap', targets: [2, 3]},
                    {className: 'text-center', targets: [0, 1, 4, 5]}
                ]
            });
        }
    });
});

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
                        url: "https://accounts.gideons.org.in/pay_table?type=Annual Renewal&mid=" + mid,
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
    var mid = $('#cro_mid1').val();
    $('#cro_mid').val(mid);
    var cro_total4 = "";
    var cro_total5 = "";
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
                crochange();
                alert(data);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
            $('#cro_modal').modal('show');
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
                url: 'table_of_donor_e503.jsp?mid=' + $('#external_id').val(),
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
                $('#gideonname').val('');
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
                $('#auxname').val('');
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
                $('#loa_auxname').val('');
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
                $('#log_name').val('');
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
    var v_mid = $('#mid11').val();
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
                crochange();
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
                $('#gideonname').val('');
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
                $('#auxname').val('');
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
                $('#nlg_name').val('');
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
                $('#nla_name').val('');
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
                $('#nag_name').val('');
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
                $('#naa_name').val('');
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
                $('#log_name').val('');
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
                $('#loa_name').val('');
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

//ANBALAGAN

$(document).on('click', '#cpcnt, #croamount', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $('#cro_table').DataTable().ajax.reload();
        $('#cro_modal').modal('show');
    }
});

$(document).on('click', '#ffoamount', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#external_id').val(qmid);
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
                url: 'table_of_donor_e503.jsp?mid=' + qmid,
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
                $('#donor_name').val('');
                $("#donor_amount").val('');
                $("#donor_mobile1").val('');
                $("#donor_mobile2").val('');
                $("#donor_email1").val('');
                $("#donor_email2").val('');
                $("#donor_remarks").val('');
                $('#ffoamount').val(total5);
            }
        });
        $('#donor_modal').modal('show');
    }
});

$(document).on('click', '#pwtgcnt, #pwtgamount', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#mid4').val(qmid);
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
                url: 'table_of_pwt_e503.jsp?type=gideon&mid=' + qmid,
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
                $("#gideon_language").val('0');
                $("#gideon_qty").val('');
                $("#gideon_cost").val('');
            }
        });
        $('#pwt_gideon_modal').modal('show');
    }
});

$(document).on('click', '#pwtacnt, #pwtaamount', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#mid5').val(qmid);
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
                url: 'table_of_pwt_e503.jsp?type=aux&mid=' + qmid,
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
                //$('#pwtacnt').val(total3);
                // $('#pwtaamount').val(total4);
                //pwtacntchange();
            }
        });
        $('#pwt_aux_modal').modal('show');
    }
});

$(document).on('click', '#pwthbcnt, #pwthbamount', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#mid6').val(qmid);
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
                url: 'table_of_pwt_e503.jsp?type=hb&mid=' + qmid,
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
                // $('#pwthbcnt').val(total3);
                // $('#pwthbamount').val(total4);
                // pwthbcntchange();
            }
        });
        $('#pwt_hb_modal').modal('show');
    }
});

$(document).on('click', '#pwtlbcnt, #pwtlbamount', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#mid7').val(qmid);
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
                url: 'table_of_pwt_e503.jsp?type=lb&mid=' + qmid,
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
                // $('#pwtlbcnt').val(total3);
                // $('#pwtlbamount').val(total4);
                //  pwtlbcntchange();
            }
        });
        $('#pwt_lb_modal').modal('show');
    }
});

$(document).on('click', '#slcnt, #slamount', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#mid8').val(qmid);
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
                url: 'table_of_special_e503.jsp?type=slimline&mid=' + qmid,
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
                $('#slim_type').val('Slim Line');
                $('#slim_cost').val('');
                $('#slim_qty').val('');
            }
        });
        $('#slim_modal').modal('show');
    }
});

$(document).on('click', '#dicnt, #diamount', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#mid9').val(qmid);
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
                url: 'table_of_special_e503.jsp?type=indiandi&mid=' + qmid,
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
                $('#di_type').val('Indian Dignitary');
                $('#di_cost').val('');
                $('#di_qty').val('');
            }
        });
        $('#special_add_di_modal').modal('show');
    }
});

$(document).on('click', '#diincnt, #diinamount', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#mid10').val(qmid);
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
                url: 'table_of_special_e503.jsp?type=internationaldi&mid=' + qmid,
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
                $('#dii_type').val('International Dignitary');
                $('#dii_cost').val('');
                $('#dii_qty').val('');
            }
        });
        $('#special_add_dii_modal').modal('show');
    }
});

$(document).on('click', '#agcnt, #agfee', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#agr_mid').val(qmid);
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
                url: 'table_of_agr_e503.jsp?action=agr&mid=' + qmid,
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
                $('#gideonname').val('');
                $('#agr_reference').val('');
                $('#agr_remarks').val('');
            }
        });
        $('#agr_modal').modal('show');
    }
});

$(document).on('click', '#aacnt, #aafee', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#aga_mid').val(qmid);
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
                url: 'table_of_agr_e503.jsp?action=aga&mid=' + qmid,
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
                $('#auxname').val('');
                $('#aga_reference').val('');
                $('#aga_remarks').val('');
            }
        });
        $('#aga_modal').modal('show');
    }
});

$(document).on('click', '#lacnt, #lafee', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#loa_mid').val(qmid);
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
                url: 'table_of_agr_e503.jsp?action=loa&mid=' + qmid,
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
                $('#loa_auxname').val('');
                $('#loa_reference').val('');
                $('#loa_remarks').val('');
            }
        });
        $('#loa_modal').modal('show');
    }
});

$(document).on('click', '#lgcnt, #lgfee', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#log_mid').val(qmid);
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
                url: 'table_of_agr_e503.jsp?action=log&mid=' + qmid,
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
                $('#log_name').val('');
                $('#log_reference').val('');
                $('#log_remarks').val('');
            }
        });
        $('#log_modal').modal('show');
    }
});

$(document).on('click', '#nlgcnt, #nlgfee', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#nlg_mid').val(qmid);
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
                url: 'table_of_agr_e503.jsp?action=nlg&mid=' + qmid,
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
                $('#nlg_name').val('');
                $('#nlg_mobile').val('');
                $('#nlg_email').val('');
                $('#nlg_reference').val('');
                $('#nlg_remarks').val('');
            }
        });
        $('#nlg_modal').modal('show');
    }
});

$(document).on('click', '#nlacnt, #nlafee', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#nla_mid').val(qmid);
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
                url: 'table_of_agr_e503.jsp?action=nla&mid=' + qmid,
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
                $('#nla_name').val('');
                $('#nla_mobile').val('');
                $('#nla_email').val('');
                $('#nla_reference').val('');
                $('#nla_remarks').val('');
            }
        });
        $('#nla_modal').modal('show');
    }
});

$(document).on('click', '#nagcnt, #nagfee', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        $('#nag_mid').val(qmid);
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
                url: 'table_of_agr_e503.jsp?action=nag&mid=' + qmid,
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
                $('#nag_name').val('');
                $('#nag_mobile').val('');
                $('#nag_email').val('');
                $('#nag_reference').val('');
                $('#nag_remarks').val('');
            }
        });
        $('#nag_modal').modal('show');
    }
});

$(document).on('click', '#naacnt, #naafee', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        var qmid = $('#qmid').val();
        //alert("comes here "+qmid);
        $('#naa_mid').val(qmid);
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
                url: 'table_of_agr_e503.jsp?action=naa&mid=' + qmid,
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
                $('#naa_name').val('');
                $('#naa_mobile').val('');
                $('#naa_email').val('');
                $('#naa_reference').val('');
                $('#naa_remarks').val('');
            }
        });
        $('#naa_modal').modal('show');
    }
});

$(document).on('click', '.paymentModal', function (e) {
    var click_id = $(this).attr("id");
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#e503month').val('0');
        $("#e503year").val('0');
        $("#e503_camp").val('');
        $("#epaydate").val('');
        $("#contactperson").val('');
        $("#paymode").val('0');
        $("#etramount").val('');
        $("#trno").val('');
        $("#trdate").val('');
        $("#tramount").val('');
        $("#trbank").val('');
        $("#trbranch").val('');
        $("#trremarks").val('');
        $.ajax({
            url: 'e503PaymentEditJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#e503month').val(data.e503month);
                $("#e503year").val(data.e503year);
                $("#e503_camp").val(data.camp);
                $("#epaydate").val(data.e503date);
                $("#contactperson").val(data.contactperson);
                $("#paymode").val(data.paymode);
                $("#etramount").val(data.tramount);
                $("#trno").val(data.trno);
                $("#trdate").val(data.trdate);
                $("#tramount").val(data.tramount);
                $("#trbank").val(data.trbank);
                $("#trbranch").val(data.trbranch);
                $("#trremarks").val(data.trremarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#myModal').modal('show');
    }
});

$(document).on('click', '.editcroRow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#cp_date').val('');
        $("#cp_amount").val('');
        $("#speaker_name").val('');
        $("#church_name").val('');
        $("#church_address").val('');
        $("#pastor_name").val('');
        $("#pastor_number").val('');
        $("#pastor_email").val('');
        $.ajax({
            url: 'e503GetCroValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#cp_date').val(data.cp_date);
                $("#cp_amount").val(data.cp_amount);
                $("#speaker_name").val(data.speaker_name);
                $("#church_name").val(data.church_name);
                $("#church_address").val(data.church_address);
                $("#pastor_name").val(data.pastor_name);
                $("#pastor_number").val(data.pastor_number);
                $("#pastor_email").val(data.pastor_email);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#cro_modal').modal('show');
    }
});

$(document).on('click', '.editdonorRow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#donor_name').val('');
        $("#donor_amount").val('');
        $("#donor_mobile1").val('');
        $("#donor_mobile2").val('');
        $("#donor_email1").val('');
        $("#donor_email2").val('');
        $("#donor_remarks").val('');
        $.ajax({
            url: 'e503GetDonorValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#donor_name').val(data.name);
                $("#donor_amount").val(data.camount);
                $("#donor_mobile1").val(data.mobile1);
                $("#donor_mobile2").val(data.mobile2);
                $("#donor_email1").val(data.email1);
                $("#donor_email2").val(data.email2);
                $("#donor_remarks").val(data.remarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#donor_modal').modal('show');
    }
});

$(document).on('click', '.editPWTgRow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $("#gideon_language").val('0');
        $("#gideon_qty").val('');
        $("#gideon_cost").val('');
        $.ajax({
            url: 'e503GetPWTValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#gideon_type').val(data.gideon_type);
                $("#gideon_color").val(data.gideon_color);
                $("#gideon_language").val(data.gideon_language);
                $("#gideon_qty").val(data.gideon_qty);
                $("#gideon_cost").val(data.gideon_cost);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#pwt_gideon_modal').modal('show');
    }
});

$(document).on('click', '.editPWTaRow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $("#aux_language").val('0');
        $("#aux_qty").val('');
        $("#aux_cost").val('');
        $.ajax({
            url: 'e503GetPWTValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#aux_type').val(data.gideon_type);
                $("#aux_color").val(data.gideon_color);
                $("#aux_language").val(data.gideon_language);
                $("#aux_qty").val(data.gideon_qty);
                $("#aux_cost").val(data.gideon_cost);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#pwt_aux_modal').modal('show');
    }
});

$(document).on('click', '.editPWThbRow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $("#hb_language").val('0');
        $("#hb_qty").val('');
        $("#hb_cost").val('');
        $.ajax({
            url: 'e503GetPWTValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#hb_type').val(data.gideon_type);
                $("#hb_color").val(data.gideon_color);
                $("#hb_language").val(data.gideon_language);
                $("#hb_qty").val(data.gideon_qty);
                $("#hb_cost").val(data.gideon_cost);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#pwt_hb_modal').modal('show');
    }
});

$(document).on('click', '.editPWTlbRow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $("#lb_language").val('0');
        $("#lb_qty").val('');
        $("#lb_cost").val('');
        $.ajax({
            url: 'e503GetPWTValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#lb_type').val(data.gideon_type);
                $("#lb_color").val(data.gideon_color);
                $("#lb_language").val(data.gideon_language);
                $("#lb_qty").val(data.gideon_qty);
                $("#lb_cost").val(data.gideon_cost);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#pwt_lb_modal').modal('show');
    }
});

$(document).on('click', '.editSplBslRow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#slim_type').val('Slim Line');
        $('#slim_cost').val('');
        $('#slim_qty').val('');
        $.ajax({
            url: 'e503GetPWTValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#slim_type').val('Slim Line');
                $('#slim_cost').val(data.gideon_cost);
                $('#slim_qty').val(data.gideon_qty);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#slim_modal').modal('show');
    }
});

$(document).on('click', '.editSplBindianRow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#di_type').val('Indian Dignitary');
        $('#di_cost').val('');
        $('#di_qty').val('');
        $.ajax({
            url: 'e503GetPWTValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#di_type').val('Indian Dignitary');
                $('#di_cost').val(data.gideon_cost);
                $('#di_qty').val(data.gideon_qty);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#special_add_di_modal').modal('show');
    }
});

$(document).on('click', '.editSplBiRow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#dii_type').val('International Dignitary');
        $('#dii_cost').val('');
        $('#dii_qty').val('');
        $.ajax({
            url: 'e503GetPWTValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#dii_type').val('International Dignitary');
                $('#dii_cost').val(data.gideon_cost);
                $('#dii_qty').val(data.gideon_qty);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#special_add_dii_modal').modal('show');
    }
});

$(document).on('click', '.editAGRrow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#gideonname').val('');
        $('#agr_reference').val('');
        $('#agr_remarks').val('');
        $.ajax({
            url: 'e503GetAGRValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#gideonname').val(data.name);
                $('#agr_reference').val(data.contactperson);
                $('#agr_remarks').val(data.san_remarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#agr_modal').modal('show');
    }
});

$(document).on('click', '.editAARrow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#auxname').val('');
        $('#aar_reference').val('');
        $('#aar_remarks').val('');
        $.ajax({
            url: 'e503GetAGRValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#auxname').val(data.name);
                $('#aga_reference').val(data.contactperson);
                $('#aga_remarks').val(data.san_remarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#aar_modal').modal('show');
    }
});

$(document).on('click', '.editLOGrow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#log_name').val('');
        $('#log_reference').val('');
        $('#log_remarks').val('');
        $.ajax({
            url: 'e503GetAGRValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#log_name').val(data.name);
                $('#log_reference').val(data.contactperson);
                $('#log_remarks').val(data.san_remarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#log_modal').modal('show');
    }
});

$(document).on('click', '.editLOArow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#loa_auxname').val('');
        $('#loa_reference').val('');
        $('#loa_remarks').val('');
        $.ajax({
            url: 'e503GetAGRValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#loa_auxname').val(data.name);
                $('#loa_reference').val(data.contactperson);
                $('#loa_remarks').val(data.san_remarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#loa_modal').modal('show');
    }
});

$(document).on('click', '.editNAGrow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#nag_name').val('');
        $('#nag_mobile').val('');
        $('#nag_email').val('');
        $('#nag_reference').val('');
        $('#nag_remarks').val('');
        $.ajax({
            url: 'e503GetNAGValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#nag_name').val(data.name);
                $('#nag_mobile').val(data.phone);
                $('#nag_email').val(data.email);
                $('#nag_reference').val(data.contactperson);
                $('#nag_remarks').val(data.san_remarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#nag_modal').modal('show');
    }
});

$(document).on('click', '.editNAArow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#naa_name').val('');
        $('#naa_mobile').val('');
        $('#naa_email').val('');
        $('#naa_reference').val('');
        $('#naa_remarks').val('');

        $.ajax({
            url: 'e503GetNAGValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#naa_name').val(data.name);
                $('#naa_mobile').val(data.phone);
                $('#naa_email').val(data.email);
                $('#naa_reference').val(data.contactperson);
                $('#naa_remarks').val(data.san_remarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#naa_modal').modal('show');
    }
});

$(document).on('click', '.editNLGrow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#nlg_name').val('');
        $('#nlg_mobile').val('');
        $('#nlg_email').val('');
        $('#nlg_reference').val('');
        $('#nlg_remarks').val('');

        $.ajax({
            url: 'e503GetNAGValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#nlg_name').val(data.name);
                $('#nlg_mobile').val(data.phone);
                $('#nlg_email').val(data.email);
                $('#nlg_reference').val(data.contactperson);
                $('#nlg_remarks').val(data.san_remarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#nlg_modal').modal('show');
    }
});

$(document).on('click', '.editNLArow', function (e) {
    var click_id = $(this).attr("id");
    alert("ID " + click_id);
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        // $('#payRid').val('0');
        // $("#payMid").val('0');
        $('#nla_name').val('');
        $('#nla_mobile').val('');
        $('#nla_email').val('');
        $('#nla_reference').val('');
        $('#nla_remarks').val('');

        $.ajax({
            url: 'e503GetNAGValuesJson.jsp?id=' + click_id,
            type: 'POST',
            dataType: 'json',
            success: function (data) {
                // $('#payRid').val(data.rid);
                // $('#payMid').val(data.mid);
                $('#nla_name').val(data.name);
                $('#nla_mobile').val(data.phone);
                $('#nla_email').val(data.email);
                $('#nla_reference').val(data.contactperson);
                $('#nla_remarks').val(data.san_remarks);
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
        $('#nla_modal').modal('show');
    }
});

$(document).on('click', '.supdocUploadModal', function (e) {
    var camp_val = $('#camp').val();
    if (camp_val.length < 3) {
        alert("Please Enter the Camp name..");
        $('#camp').focus();
    } else {
        $('#file_upload').modal('show');
    }
});

$(document).on('keydown keyup', '#gideon_qty', function (e) {
    var pwtg = "15";
    var pwtgamount = 0;
    var pwtgcnt = $("#gideon_qty").val();
    $("#pwtgcnt").val(pwtgcnt);
    var Vpwtgcnt = isNaN(parseInt(pwtgcnt)) ? 0 : parseInt(pwtgcnt);
    pwtgamount = parseInt(Vpwtgcnt) * parseInt(pwtg);
    $("#gideon_cost").val(pwtgamount);
    $("#pwtgamount").val(pwtgamount);
});

$(document).on('keydown keyup', '#aux_qty', function (e) {
    var pwtaamount = 0;
    var pwtg = "15";
    var pwtacnt = $("#aux_qty").val();
    $("#pwtacnt").val(pwtacnt);
    var Vpwtacnt = isNaN(parseInt(pwtacnt)) ? 0 : parseInt(pwtacnt);
    pwtaamount = parseInt(Vpwtacnt) * parseInt(pwtg);
    $("#aux_cost").val(pwtaamount);
    $("#pwtaamount").val(pwtaamount);
});

$(document).on('keydown keyup', '#hb_qty', function (e) {
    var pwthbamount = 0;
    var pwtg = "100";
    var pwthbcnt = $("#hb_qty").val();
    $("#pwthbcnt").val(pwthbcnt);
    var Vpwthbcnt = isNaN(parseInt(pwthbcnt)) ? 0 : parseInt(pwthbcnt);
    pwthbamount = parseInt(Vpwthbcnt) * parseInt(pwtg);
    $("#hb_cost").val(pwthbamount);
    $("#pwthbamount").val(pwthbamount);
});

$(document).on('keydown keyup', '#lb_qty', function (e) {
    var pwtg = "50";
    var pwtlbcnt = $("#lb_qty").val();
    $("#pwtlbcnt").val(pwtlbcnt);
    var pwtlbamount = $("#pwtlbamount").val();
    pwtlbamount = parseInt(pwtlbcnt) * parseInt(pwtg);
    $("#lb_cost").val(pwtlbamount);
    $("#pwtlbamount").val(pwtlbamount);
});

$(document).on('keydown keyup', '#slim_qty', function (e) {
    var slim_cost = 0;
    var Slim = "250";
    var qty = document.getElementById("slim_qty").value;
    document.getElementById("slcnt").value = qty;
    var Vqty = isNaN(parseInt(qty)) ? 0 : parseInt(qty);
    slim_cost = parseInt(Vqty) * parseInt(Slim);
    var v_special_cost = isNaN(parseInt(slim_cost)) ? 0 : parseInt(slim_cost);
    document.getElementById("slim_cost").value = v_special_cost;
    document.getElementById("slamount").value = v_special_cost;
});

$(document).on('keydown keyup', '#di_qty', function (e) {
    var di_cost = 0;
    var di = "600";
    var qty = document.getElementById("di_qty").value;
    document.getElementById("dicnt").value = qty;
    var Vqty = isNaN(parseInt(qty)) ? 0 : parseInt(qty);
    di_cost = parseInt(Vqty) * parseInt(di);
    var v_special_cost = isNaN(parseInt(di_cost)) ? 0 : parseInt(di_cost);
    document.getElementById("di_cost").value = v_special_cost;
    document.getElementById("diamount").value = v_special_cost;
});

$(document).on('keydown keyup', '#dii_qty', function (e) {
    var dii_cost = 0;
    var diin = 1200;
    var qty = document.getElementById("dii_qty").value;
    document.getElementById("diincnt").value = qty;
    var Vqty = isNaN(parseInt(qty)) ? 0 : parseInt(qty);
    dii_cost = parseInt(Vqty) * parseInt(diin);
    var v_special_cost = isNaN(parseInt(dii_cost)) ? 0 : parseInt(dii_cost);
    document.getElementById("dii_cost").value = v_special_cost;
    document.getElementById("diinamount").value = v_special_cost;
});

$(document).on('change', '#camp', function (e) {
    var v_camp = $('#camp').val();
    $('#agr_camp').val(v_camp);
    $('#aga_camp').val(v_camp);
    $('#loa_camp').val(v_camp);
    $('#log_camp').val(v_camp);
    $('#nla_camp').val(v_camp);
    $('#nlg_camp').val(v_camp);
    $('#nag_camp').val(v_camp);
    $('#naa_camp').val(v_camp);
    $('#e503_camp').val(v_camp);
});

$(document).on('keyup', '#mName', function (e) {
    $("#myContainer").LoadingOverlay("show", {
        background: "rgba(165, 190, 100, 0.5)"
    });
    $.ajax({
        url: 'e503GetValuesJson.jsp?name=' + $("#mName").val(),
        type: 'post',
        dataType: 'json',
        success: function (data) {
            $("#qmid").val(data.rid);
            $("#sa_mid").val(data.rid);

            $('#mid').val(data.rid);
            $('#mid1').val(data.rid);
            $('#mid2').val(data.rid);
            $('#mid3').val(data.rid);
            $('#mid4').val(data.rid);
            $('#mid5').val(data.rid);
            $('#mid6').val(data.rid);
            $('#mid7').val(data.rid);
            $('#mid8').val(data.rid);
            $('#external_id').val(data.rid);
            $('#mid9').val(data.rid);
            $('#mid10').val(data.rid);
            $('#mid11').val(data.rid);
            $('#cro_mid').val(data.rid);
            $('#cro_mid1').val(data.rid);
            $('#masterid').val(data.rid);
            $('#agr_mid').val(data.rid);
            $('#aga_mid').val(data.rid);
            $('#loa_mid').val(data.rid);
            $('#log_mid').val(data.rid);
            $('#nla_mid').val(data.rid);
            $('#nlg_mid').val(data.rid);
            $('#nag_mid').val(data.rid);
            $('#naa_mid').val(data.rid);
            $('#vmid').html(data.rid);

            $("#camp").val(data.camp);
            $("#camp_adjust").html(data.camp + " Camp - Suspense Adjustment");
            $("#cpcnt").val(data.cpcnt);
            $("#croamount").val(data.croamount);
            $("#ncpcnt").val(data.ncpcnt);
            $("#ncroamount").val(data.ncroamount);
            $("#scpcnt").val(data.scpcnt);
            $("#scroamount").val(data.scroamount);
            $("#gcbpcnt").val(data.gcbpcnt);
            $("#gcbpamount").val(data.gcbpamount);
            $("#pabcnt").val(data.pabcnt);
            $("#pabamount").val(data.pabamount);
            $("#ncpabamount").val(data.ncpabamount);
            $("#scpabamount").val(data.scpabamount);
            $("#pabdate").val(data.pabdate);
            $("#ffrdate").val(data.ffrdate);
            $("#fframount").val(data.fframount);
            $("#ffgamount").val(data.ffgamount);
            $("#ffaamount").val(data.ffaamount);
            $("#ffoamount").val(data.ffoamount);
            $("#ffbamount").val(data.ffbamount);
            $("#sploamount").val(data.sploamount);
            $("#ncogamount").val(data.ncogamount);
            $("#ncoaamount").val(data.ncoaamount);
            $("#scogamount").val(data.scogamount);
            $("#scoaamount").val(data.scoaamount);
            $("#sf1cnt").val(data.sf1cnt);
            $("#sf1fee").val(data.sf1fee);

            $("#agcnt").val(data.ragcnt);
            $("#agfee").val(data.ragamount);
            $("#aacnt").val(data.raacnt);
            $("#aafee").val(data.raaamount);
            $("#lgcnt").val(data.rlgcnt);
            $("#lgfee").val(data.rlgamount);
            $("#lacnt").val(data.rlacnt);
            $("#lafee").val(data.rlaamount);
            $("#nagcnt").val(data.nagcnt);
            $("#nagfee").val(data.nagamount);
            $("#naacnt").val(data.naacnt);
            $("#naafee").val(data.naaamount);
            $("#nlgcnt").val(data.nlgcnt);
            $("#nlgfee").val(data.nlgamount);
            $("#nlacnt").val(data.nlacnt);
            $("#nlafee").val(data.nlaamount);
            $("#mcnt").val(data.mocnt);
            $("#mfee").val(data.moamount);

            $("#pwtgcnt").val(data.pwtgcnt);
            $("#pwtgamount").val(data.pwtgamount);
            $("#pwtacnt").val(data.pwtacnt);
            $("#pwtaamount").val(data.pwtaamount);
            $("#pwthbcnt").val(data.pwthbcnt);
            $("#pwthbamount").val(data.pwthbamount);
            $("#pwtlbcnt").val(data.pwtlbcnt);
            $("#pwtlbamount").val(data.pwtlbamount);
            $("#pwtcnt").val(data.pwtcnt);
            $("#pwtamount").val(data.pwtamount);

            $("#slcnt").val(data.slcnt);
            $("#slamount").val(data.slamount);
            $("#dicnt").val(data.dicnt);
            $("#diamount").val(data.diamount);
            $("#diincnt").val(data.diincnt);
            $("#diinamount").val(data.diinamount);
            $("#splbcnt").val(data.splbcnt);
            $("#splbamount").val(data.splbamount);

            $("#nccamount").val(data.nccamount);
            $("#sccamount").val(data.sccamount);
            $("#cafamount").val(data.cafamount);
            $("#afamount").val(data.afamount);

            $("#ggbcnt").val(data.ggbcnt);
            $("#ggbamount").val(data.ggbamount);
            $("#agbcnt").val(data.agbcnt);
            $("#agbamount").val(data.agbamount);
            $("#gecnt").val(data.gecnt);
            $("#geamount").val(data.geamount);
            $("#aecnt").val(data.aecnt);
            $("#aeamount").val(data.aeamount);
            $("#tbcnt").val(data.tbcnt);
            $("#tbamount").val(data.tbamount);
            $("#sbcnt").val(data.sbcnt);
            $("#sbamount").val(data.sbcnt);
            $("#pwcnt").val(data.pwcnt);
            $("#pwamount").val(data.pwamount);
            $("#stickerscnt").val(data.stickerscnt);
            $("#stickersamount").val(data.stickersamount);
            $("#sf2cnt").val(data.sf2cnt);
            $("#sf2fee").val(data.sf2fee);

            $("#total_amount").val(data.total_amount);
            $("#reconciled").val(data.total_amount);
            $("#sf1remarks").val(data.sf1remarks);
            $("#remarks").val(data.mremarks);
            $("#pwtremarks").val(data.pwtremarks);
            $("#miremarks").val(data.miremarks);

            var qmid = $('#qmid').val();
            //alert("comes here " + qmid);
            $('#mid').val(qmid);
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
                    url: "pay_table?mid=" + qmid,
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
                    // $('#payCheck').val(total7);
                }
            });

            //Supporting Document Table
            var supDoc_table = $('#supDoc').DataTable({
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
                "iDisplayLength": 3,
                lengthMenu: [
                    [5, 10, 25, -1],
                    ['5 rows', '10 rows', '25 rows', 'Show all']
                ],
                ajax: {
                    method: "POST",
                    url: "e503fetchSupportingDocuments?sId=" + qmid,
                    dataSrc: "datas"
                },
                columns: [
                    {"data": "sid"},
                    {"data": "rid"},
                    {"data": "filename"},
                    {"data": "uploaded_on"},
                    {"data": "view"},
                    {"data": "action"}
                ], columnDefs: [
                    {className: 'text-nowrap', targets: [2, 3]},
                    {className: 'text-center', targets: [0, 1, 4, 5]}
                ]
            });

            var sa_camp = $("#camp").val();
            var sa_adjustment = $("#reconciled").val();
            $.ajax({
                url: 'e503SuspenseEditSAJson.jsp?camp=' + sa_camp,
                type: 'POST',
                dataType: 'json',
                success: function (data) {
                    $("#sa_mid").val(data.rid);
                    $("#sus_state_asso").val(data.state_asso);
                    $("#suspense").val(data.suspense);
                    $("#osuspense").val(data.suspense);
                    var v_sa_suspense = isNaN(parseInt(data.suspense)) ? 0 : parseInt(data.suspense);
                    var v_sa_adjustment = isNaN(parseInt(sa_adjustment)) ? 0 : parseInt(sa_adjustment);

                    var sa_balance = (v_sa_suspense - v_sa_adjustment);
                    var v_sa_balance = isNaN(parseInt(sa_balance)) ? 0 : parseInt(sa_balance);
                    $("#balance").val(v_sa_balance);
                }
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
                    url: 'table_of_cro_e503.jsp?mid=' + data.rid,
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
                    $('#cp_date').val('');
                    $("#cp_amount").val('');
                    $("#speaker_name").val('');
                    $("#church_name").val('');
                    $("#church_address").val('');
                    $("#pastor_name").val('');
                    $("#pastor_number").val('');
                    $("#pastor_email").val('');
                    $('#cpcnt').val(total4);
                    $('#croamount').val(total5);
                }
            });
        }
    }).done(function () {
        $("#myContainer").LoadingOverlay("hide", true);
    });
});


$('#trdate').datepicker({
    format: "dd/mm/yyyy",
    language: "es",
    autoclose: true,
    todayHighlight: true
});
$("#trdate").datepicker().datepicker("setDate", new Date());

$('#epaydate').datepicker({
    format: "dd/mm/yyyy",
    language: "es",
    autoclose: true,
    todayHighlight: true
});
$("#epaydate").datepicker().datepicker("setDate", new Date());

$('#pabdate').datepicker({
    format: "dd/mm/yyyy",
    language: "es",
    autoclose: true,
    todayHighlight: true
});

$('#ffrdate').datepicker({
    format: "dd/mm/yyyy",
    language: "es",
    autoclose: true,
    todayHighlight: true
});

$('#cp_date').datepicker({
    format: "dd/mm/yyyy",
    language: "es",
    autoclose: true,
    todayHighlight: true
});

$(document).on('click', '.newRecordSubmit', function (e) {
    var v_camp = $("#e503_camp").val();
    v_camp = v_camp.trim();

    var payCheck = $("#payCheck").val();
    payCheck = payCheck.trim();
    var v_total_amount = $("#total_amount").val();
    v_total_amount = v_total_amount.trim();
    var Vtotcheck = isNaN(parseInt(v_total_amount)) ? 0 : parseInt(v_total_amount);
    var Vpaycheck = isNaN(parseInt(payCheck)) ? 0 : parseInt(payCheck);

    if (v_camp === null || v_camp === "") {
        alert("Please enter Camp name");
        $("#camp").focus();
        return false;
    } else if (Vtotcheck === 0 && Vpaycheck === 0) {
        alert("No values are entered; can not proceed");
        return false;
    } else if (Vtotcheck === 0 && Vpaycheck > 0) {
        alert("Break-up values are not entered; can not proceed");
        return false;
    } else if (Vpaycheck === 0 && Vtotcheck > 0) {
        alert("Payment details are Not entered; can not proceed");
        return false;
    } else if (Vtotcheck > 0 && Vtotcheck !== Vpaycheck) {
        alert("Payment details are not matching with the Total amount.\n\nPayment Transaction Total : " + Vpaycheck + "\nAll Items total : " + Vtotcheck + "\n\nPlease correct to proceed further.");
        return false;
    } else if (Vpaycheck > 0 && Vtotcheck !== Vpaycheck) {
        alert("Payment details are not matching with the Total amount.\n\nPayment Transaction Total : " + Vpaycheck + "\nAll Items total : " + Vtotcheck + "\n\nPlease correct to proceed further.");
        return false;
    }

    var v_program = $("#program").val();
    v_program = v_program.trim();
    var v_agcnt = $("#agcnt").val();
    v_agcnt = v_agcnt.trim();
    var v_nagcnt = $("#nagcnt").val();
    v_nagcnt = v_nagcnt.trim();
    var v_aacnt = $("#aacnt").val();
    v_aacnt = v_aacnt.trim();
    var v_naacnt = $("#naacnt").val();
    v_naacnt = v_naacnt.trim();
    var v_agfee = $("#agfee").val();
    v_agfee = v_agfee.trim();
    var v_nagfee = $("#nagfee").val();
    v_nagfee = v_nagfee.trim();
    var v_aafee = $("#aafee").val();
    v_aafee = v_aafee.trim();
    var v_naafee = $("#naafee").val();
    v_naafee = v_naafee.trim();
    var v_lgcnt = $("#lgcnt").val();
    v_lgcnt = v_lgcnt.trim();
    var v_nlgcnt = $("#nlgcnt").val();
    v_nlgcnt = v_nlgcnt.trim();
    var v_lacnt = $("#lacnt").val();
    v_lacnt = v_lacnt.trim();
    var v_nlacnt = $("#nlacnt").val();
    v_nlacnt = v_nlacnt.trim();
    var v_lgfee = $("#lgfee").val();
    v_lgfee = v_lgfee.trim();
    var v_nlgfee = $("#nlgfee").val();
    v_nlgfee = v_nlgfee.trim();
    var v_lafee = $("#lafee").val();
    v_lafee = v_lafee.trim();
    var v_nlafee = $("#nlafee").val();
    v_nlafee = v_nlafee.trim();
    var v_mcnt = $("#mcnt").val();
    v_mcnt = v_mcnt.trim();
    var v_mfee = $("#mfee").val();
    v_mfee = v_mfee.trim();
    var v_mremarks = $("#remarks").val();
    v_mremarks = v_mremarks.trim();

    var v_pwtgcnt = $("#pwtgcnt").val();
    v_pwtgcnt = v_pwtgcnt.trim();
    var v_pwtgamount = $("#pwtgamount").val();
    v_pwtgamount = v_pwtgamount.trim();
    var v_pwtacnt = $("#pwtacnt").val();
    v_pwtacnt = v_pwtacnt.trim();
    var v_pwtaamount = $("#pwtaamount").val();
    v_pwtaamount = v_pwtaamount.trim();
    var v_pwthbcnt = $("#pwthbcnt").val();
    v_pwthbcnt = v_pwthbcnt.trim();
    var v_pwthbamount = $("#pwthbamount").val();
    v_pwthbamount = v_pwthbamount.trim();
    var v_pwtlbcnt = $("#pwtlbcnt").val();
    v_pwtlbcnt = v_pwtlbcnt.trim();
    var v_pwtlbamount = $("#pwtlbamount").val();
    v_pwtlbamount = v_pwtlbamount.trim();
    var v_pwtcnt = $("#pwtcnt").val();
    v_pwtcnt = v_pwtcnt.trim();
    var v_pwtamount = $("#pwtamount").val();
    v_pwtamount = v_pwtamount.trim();
    var v_pwtremarks = $("#pwtremarks").val();
    v_pwtremarks = v_pwtremarks.trim();

    var v_slcnt = $("#slcnt").val();
    v_slcnt = v_slcnt.trim();
    var v_slamount = $("#slamount").val();
    v_slamount = v_slamount.trim();
    var v_dicnt = $("#dicnt").val();
    v_dicnt = v_dicnt.trim();
    var v_diamount = $("#diamount").val();
    v_diamount = v_diamount.trim();
    var v_diincnt = $("#diincnt").val();
    v_diincnt = v_diincnt.trim();
    var v_diinamount = $("#diinamount").val();
    v_diinamount = v_diinamount.trim();
    var v_splbcnt = $("#splbcnt").val();
    v_splbcnt = v_splbcnt.trim();
    var v_splbamount = $("#splbamount").val();
    v_splbamount = v_splbamount.trim();

    var v_cpcnt = $("#cpcnt").val();
    v_cpcnt = v_cpcnt.trim();
    var v_ncpcnt = $("#ncpcnt").val();
    v_ncpcnt = v_ncpcnt.trim();
    var v_scpcnt = $("#scpcnt").val();
    v_scpcnt = v_scpcnt.trim();
    var v_croamount = $("#croamount").val();
    v_croamount = v_croamount.trim();
    var v_ncroamount = $("#ncroamount").val();
    v_ncroamount = v_ncroamount.trim();
    var v_scroamount = $("#scroamount").val();
    v_scroamount = v_scroamount.trim();
    var v_pabcnt = $("#pabcnt").val();
    v_pabcnt = v_pabcnt.trim();
    var v_pabamount = $("#pabamount").val();
    v_pabamount = v_pabamount.trim();
    var v_ncpabamount = $("#ncpabamount").val();
    v_ncpabamount = v_ncpabamount.trim();
    var v_scpabamount = $("#scpabamount").val();
    v_scpabamount = v_scpabamount.trim();
    var v_ffrcnt = $("#ffrcnt").val();
    v_ffrcnt = v_ffrcnt.trim();
    var v_fframount = $("#fframount").val();
    v_fframount = v_fframount.trim();
    var v_gcbpcnt = $("#gcbpcnt").val();
    v_gcbpcnt = v_gcbpcnt.trim();
    var v_gcbpamount = $("#gcbpamount").val();
    v_gcbpamount = v_gcbpamount.trim();
    var v_ffgcnt = $("#ffgcnt").val();
    v_ffgcnt = v_ffgcnt.trim();
    var v_ffgamount = $("#ffgamount").val();
    v_ffgamount = v_ffgamount.trim();
    var v_ffacnt = $("#ffacnt").val();
    v_ffacnt = v_ffacnt.trim();
    var v_ffaamount = $("#ffaamount").val();
    v_ffaamount = v_ffaamount.trim();
    var v_ffocnt = $("#ffocnt").val();
    v_ffocnt = v_ffocnt.trim();
    var v_ffoamount = $("#ffoamount").val();
    v_ffoamount = v_ffoamount.trim();
    var v_ffbamount = $("#ffbamount").val();
    v_ffbamount = v_ffbamount.trim();
    var v_ffbcnt = $("#ffbcnt").val();
    v_ffbcnt = v_ffbcnt.trim();
    var v_ffbamount = $("#ffbamount").val();
    v_ffbamount = v_ffbamount.trim();
    var v_splocnt = $("#splocnt").val();
    v_splocnt = v_splocnt.trim();
    var v_sploamount = $("#sploamount").val();
    v_sploamount = v_sploamount.trim();
    var v_ncogcnt = $("#ncogcnt").val();
    v_ncogcnt = v_ncogcnt.trim();
    var v_ncogamount = $("#ncogamount").val();
    v_ncogamount = v_ncogamount.trim();
    var v_ncoacnt = $("#ncoacnt").val();
    v_ncoacnt = v_ncoacnt.trim();
    var v_ncoaamount = $("#ncoaamount").val();
    v_ncoaamount = v_ncoaamount.trim();
    var v_scogcnt = $("#scogcnt").val();
    v_scogcnt = v_scogcnt.trim();
    var v_scogamount = $("#scogamount").val();
    v_scogamount = v_scogamount.trim();
    var v_scoacnt = $("#scoacnt").val();
    v_scoacnt = v_scoacnt.trim();
    var v_scoaamount = $("#scoaamount").val();
    v_scoaamount = v_scoaamount.trim();
    var v_sf1cnt = $("#sf1cnt").val();
    v_sf1cnt = v_sf1cnt.trim();
    var v_sf1fee = $("#sf1fee").val();
    v_sf1fee = v_sf1fee.trim();
    var v_sf1remarks = $("#sf1remarks").val();
    v_sf1remarks = v_sf1remarks.trim();
    var v_ggbcnt = $("#ggbcnt").val();
    v_ggbcnt = v_ggbcnt.trim();
    var v_ggbamount = $("#ggbamount").val();
    v_ggbamount = v_ggbamount.trim();
    var v_agbcnt = $("#agbcnt").val();
    v_agbcnt = v_agbcnt.trim();
    var v_agbamount = $("#agbamount").val();
    v_agbamount = v_agbamount.trim();
    var v_gecnt = $("#gecnt").val();
    v_gecnt = v_gecnt.trim();
    var v_geamount = $("#geamount").val();
    v_geamount = v_geamount.trim();
    var v_aecnt = $("#aecnt").val();
    v_aecnt = v_aecnt.trim();
    var v_aeamount = $("#aeamount").val();
    v_aeamount = v_aeamount.trim();
    var v_tbcnt = $("#tbcnt").val();
    v_tbcnt = v_tbcnt.trim();
    var v_tbamount = $("#tbamount").val();
    v_tbamount = v_tbamount.trim();
    var v_sbcnt = $("#sbcnt").val();
    v_sbcnt = v_sbcnt.trim();
    var v_sbamount = $("#sbamount").val();
    v_sbamount = v_sbamount.trim();
    var v_pwcnt = $("#pwcnt").val();
    v_pwcnt = v_pwcnt.trim();
    var v_pwamount = $("#pwamount").val();
    v_pwamount = v_pwamount.trim();
    var v_stickerscnt = $("#stickerscnt").val();
    v_stickerscnt = v_stickerscnt.trim();
    var v_stickersamount = $("#stickersamount").val();
    v_stickersamount = v_stickersamount.trim();
    var v_sf2cnt = $("#sf2cnt").val();
    v_sf2cnt = v_sf2cnt.trim();
    var v_sf2fee = $("#sf2fee").val();
    v_sf2fee = v_sf2fee.trim();
    var v_miremarks = $("#miremarks").val();
    v_miremarks = v_miremarks.trim();

    var v_contactperson = $("#contactperson").val();
    v_contactperson = v_contactperson.trim();
    var v_e503month = $("#e503month").val();
    v_e503month = v_e503month.trim();
    var v_e503year = $("#e503year").val();
    v_e503year = v_e503year.trim();

    var v_paymode = $("#paymode").val();
    v_paymode = v_paymode.trim();
    var v_trno = $("#trno").val();
    v_trno = v_trno.trim();
    var v_trdate = $("#trdate").val();
    v_trdate = v_trdate.trim();
    var v_tramount = $("#tramount").val();
    v_tramount = v_tramount.trim();
    var v_trbank = $("#trbank").val();
    v_trbank = v_trbank.trim();
    var v_trbranch = $("#trbranch").val();
    v_trbranch = v_trbranch.trim();
    var v_trremarks = $("#trremarks").val();
    v_trremarks = v_trremarks.trim();
    var modified_by = $("#useraccessname").val();
    modified_by = modified_by.trim();
    var designation = $("#designation").val();
    designation = designation.trim();
    var pabdate = $("#pabdate").val();
    pabdate = pabdate.trim();
    var ffrdate = $("#ffrdate").val();
    ffrdate = ffrdate.trim();
    var nccamount = $("#nccamount").val();
    nccamount = nccamount.trim();
    var sccamount = $("#sccamount").val();
    sccamount = sccamount.trim();
    var cafamount = $("#cafamount").val();
    cafamount = cafamount.trim();
    var afamount = $("#afamount").val();
    afamount = afamount.trim();
    var mid = $("#mid").val();
    mid = mid.trim();

    var r = confirm("Do you want to Create this record ?");

    if (r === true) {
        $(this).hide();
        $(this).hide();
        $("#myContainer").LoadingOverlay("show", {
            background: "rgba(165, 190, 100, 0.5)"
        });
        $("#snackbar3").show();
        $("#snackbar3").html('<p style="width:100%; padding-top:20px; padding-bottom:20px; font-size:14px; height:60px; font-weight: bold; text-align: center; vertical-align: middle; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
        $.ajax({
            url: 'e503formsubmission?action=Modify&masterid=' + mid + '&e503_camp=' + v_camp + '&program=' + v_program + '&agcnt=' + v_agcnt + '&aacnt=' + v_aacnt +
                    '&lgcnt=' + v_lgcnt + '&lacnt=' + v_lacnt + '&agamount=' + v_agfee + '&aaamount=' + v_aafee + '&lgamount=' + v_lgfee + '&laamount=' + v_lafee +
                    '&nagcnt=' + v_nagcnt + '&naacnt=' + v_naacnt + '&nlgcnt=' + v_nlgcnt + '&nlacnt=' + v_nlacnt + '&nagamount=' + v_nagfee +
                    '&naaamount=' + v_naafee + '&nlgamount=' + v_nlgfee + '&nlaamount=' + v_nlafee + '&mocnt=' + v_mcnt + '&moamount=' + v_mfee + '&pwtgcnt=' + v_pwtgcnt + '&pwtgamount=' + v_pwtgamount + '&pwtacnt=' + v_pwtacnt + '&pwtaamount=' + v_pwtaamount + '&pwthbcnt=' + v_pwthbcnt + '&pwthbamount=' + v_pwthbamount + '&pwtlbcnt=' + v_pwtlbcnt + '&pwtlbamount=' + v_pwtlbamount + '&pwtcnt=' + v_pwtcnt +
                    '&pwtamount=' + v_pwtamount + '&pwtremarks=' + v_pwtremarks + '&slcnt=' + v_slcnt + '&slamount=' + v_slamount + '&dicnt=' + v_dicnt + '&diamount=' + v_diamount + '&diincnt=' + v_diincnt + '&diinamount=' + v_diinamount + '&splbcnt=' + v_splbcnt + '&splbamount=' + v_splbamount +
                    '&cpcnt=' + v_cpcnt + '&ncpcnt=' + v_ncpcnt + '&scpcnt=' + v_scpcnt + '&croamount=' + v_croamount + '&ncroamount=' + v_ncroamount + '&scroamount=' + v_scroamount + '&pabcnt=' + v_pabcnt + '&pabamount=' + v_pabamount + '&ncpabamount=' + v_ncpabamount + '&scpabamount=' + v_scpabamount + '&pabdate=' + pabdate + '&ffrcnt=' + v_ffrcnt +
                    '&fframount=' + v_fframount + '&ffrdate=' + ffrdate + '&gcbpcnt=' + v_gcbpcnt + '&gcbpamount=' + v_gcbpamount + '&ffgcnt=' + v_ffgcnt + '&ffgamount=' + v_ffgamount +
                    '&ffacnt=' + v_ffacnt + '&ffaamount=' + v_ffaamount + '&ffocnt=' + v_ffocnt + '&ffoamount=' + v_ffoamount + '&ffbamount=' + v_ffbamount + '&ffbamount=' + v_ffbamount + '&sf1cnt=' + v_sf1cnt + '&sf1fee=' + v_sf1fee +
                    '&ncogcnt=' + v_ncogcnt + '&ncogamount=' + v_ncogamount + '&ncoacnt=' + v_ncoacnt + '&ncoaamount=' + v_ncoaamount + '&scogcnt=' + v_scogcnt + '&scogamount=' + v_scogamount + '&scoacnt=' + v_scoacnt +
                    '&scoaamount=' + v_scoaamount + '&splocnt=' + v_splocnt + '&sploamount=' + v_sploamount + '&nccamount=' + nccamount + '&sccamount=' + sccamount + '&cafamount=' + cafamount + '&afamount=' + afamount + '&ggbcnt=' + v_ggbcnt + '&ggbamount=' + v_ggbamount + '&agbcnt=' + v_agbcnt + '&agbamount=' + v_agbamount +
                    '&gecnt=' + v_gecnt + '&geamount=' + v_geamount + '&aecnt=' + v_aecnt + '&aeamount=' + v_aeamount + '&tbcnt=' + v_tbcnt + '&tbamount=' + v_tbamount + '&sbcnt=' + v_sbcnt + '&sbamount=' + v_sbamount +
                    '&pwcnt=' + v_pwcnt + '&pwamount=' + v_pwamount + '&stickerscnt=' + v_stickerscnt + '&stickersamount=' + v_stickersamount + '&sf2cnt=' + v_sf2cnt + '&sf2fee=' + v_sf2fee +
                    '&tramount=' + v_tramount + '&paymode=' + v_paymode + '&trno=' + v_trno + '&trdate=' + v_trdate + '&trbank=' + v_trbank + '&trbranch=' + v_trbranch + '&trremarks=&total_amount=' + v_total_amount + '&modified_by=' + modified_by + '&contactperson=' + v_contactperson + '&e503month=' + v_e503month + '&e503year=' + v_e503year + '&designation=' + designation + '&mremarks=' + v_mremarks + '&sf1remarks=' + v_sf1remarks + '&miremarks=' + v_miremarks,
            method: "POST",
            data: {"action": "Insert"},
            success: function (data) {
                $("#snackbar3").hide();
                $('#newRecordSubmit').show();
                $('#agcnt').val('');
                $('#agfee').val('');
                $('#aacnt').val('');
                $('#aafee').val('');
                $('#lgcnt').val('');
                $('#lgfee').val('');
                $('#lacnt').val('');
                $('#lafee').val('');
                $('#nagcnt').val('');
                $('#nagfee').val('');
                $('#naacnt').val('');
                $('#naafee').val('');
                $('#nlgcnt').val('');
                $('#nlgfee').val('');
                $('#nlacnt').val('');
                $('#nlafee').val('');
                $('#mcnt').val('');
                $('#mfee').val('');
                $('#remarks').val('');
                $('#pwtgcnt').val('');
                $('#pwtgamount').val('');
                $('#pwtacnt').val('');
                $('#pwtaamount').val('');
                $('#pwthbcnt').val('');
                $('#pwthbamount').val('');
                $('#pwtlbcnt').val('');
                $('#pwtlbamount').val('');
                $('#pwtcnt').val('');
                $('#pwtamount').val('');
                $('#pwtremarks').val('');
                $('#slcnt').val('');
                $('#slamount').val('');
                $('#dicnt').val('');
                $('#diamount').val('');
                $('#diincnt').val('');
                $('#diinamount').val('');
                $('#splbcnt').val('');
                $('#splbamount').val('');
                $('#cpcnt').val('');
                $('#croamount').val('');
                $('#pabcnt').val('');
                $('#pabamount').val('');
                $('#ffrcnt').val('');
                $('#fframount').val('');
                $('#gcbpcnt').val('');
                $('#gcbpamount').val('');
                $('#ffgcnt').val('');
                $('#ffgamount').val('');
                $('#ffacnt').val('');
                $('#ffaamount').val('');
                $('#ffocnt').val('');
                $('#ffoamount').val('');
                $('#ffbamount').val('');
                $('#splocnt').val('');
                $('#sploamount').val('');
                $('#ncogcnt').val('');
                $('#ncogamount').val('');
                $('#ncoacnt').val('');
                $('#ncoaamount').val('');
                $('#scogcnt').val('');
                $('#scogamount').val('');
                $('#scoacnt').val('');
                $('#scoaamount').val('');
                $('#sf1cnt').val('');
                $('#sf1fee').val('');
                $('#sf1remarks').val('');
                $('#ggbcnt').val('');
                $('#ggbamount').val('');
                $('#agbcnt').val('');
                $('#agbamount').val('');
                $('#gecnt').val('');
                $('#geamount').val('');
                $('#aecnt').val('');
                $('#aeamount').val('');
                $('#tbcnt').val('');
                $('#tbamount').val('');
                $('#sbcnt').val('');
                $('#sbamount').val('');
                $('#pwcnt').val('');
                $('#pwamount').val('');
                $('#stickerscnt').val('');
                $('#stickersamount').val('');
                $('#sf2cnt').val('');
                $('#sf2fee').val('');
                $('#miremarks').val('');
                $('#camp').val('');
                $('#contactperson').val('');
                $('#e503month').val('');
                $('#e503year').val('');
                $('#paymode').val('0');
                $('#trno').val('');
                $('#trdate').val('');
                $('#tramount').val('');
                $('#etramount').val('');
                $('#trbank').val('');
                $('#trbranch').val('');
                $('#trremarks').val('');
                $('#total_amount').val('');
                if (data > 0) {
                    alert("Data Saved Successfully. Reference No " + data);
                    window.location.href = "e503form.jsp";
                } else {
                    alert("Something went wrong; contact Administrator");
                }
            }
        }).done(function () {
            $("#myContainer").LoadingOverlay("hide", true);
        });
    }
});

$(document).on('click', '.deleteRow', function (e) {
    var v_id = $(this).attr('id');
    var row = $(this).parent().parent();
    var r = confirm("Do you want to Delete this record ?\n( Membership ID : " + v_id + " )");
    if (r === true) {
        $("#snackbar").show();
        $("#snackbar").html('<p style="width:100%; font-size:12px; height:25px; font-weight: bold; text-align: center; vertical-align: middle; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:16px"></i>&nbsp; Please wait a moment..</p>');
        $(".loading-progress").show();
        var progress = $(".loading-progress").progressTimer({
            timeLimit: 10
                    // onFinish: function () {
                    //     alert('Request has been processed!');
                    // }
        });

        $.ajax({
            url: "DataTable_membership_tbl_modify",
            method: "POST",
            data: {"action": "Delete", "mid": v_id},
            success: function (data) {
                $("#snackbar").html('<p style="width:100%; font-size:12px; height:25px; font-weight: bold; text-align: center; vertical-align: middle; background-color: green; color: yellow;"><i class="a fa-check" style="font-size:24px"></i>&nbsp; ' + data + '</p>');
                alert(data);
                row.remove();
                $("#snackbar").hide();
                $(".loading-progress").delay(1200).addClass("in").fadeOut(3500);
                $('#example').DataTable().ajax.reload();
            }
        }).done(function () {
            progress.progressTimer('complete');
        });
    }
});
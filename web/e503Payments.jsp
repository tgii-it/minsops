<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="loadbaseinfo.jsp" %>	
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | E503 Reconciled Records</title>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap.min.css" rel="stylesheet">
        <link href="https://editor.datatables.net/extensions/Editor/css/editor.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <style>
            html, body {
                height: 100%;
                width: 100%;
            }
            .fill-height {
                min-height: 100%;
                min-width: 100%;
                height:auto !important;
                width: 100%; 
                width: auto !important;
                height: 100%;
            }
            .tab-content{

                background: #fdfdfd;
                line-height: 25px;
                border: 1px solid #ddd;
                border-top:5px solid #ffe114;
                border-bottom:5px solid #ffe114;
                padding:30px 25px;
            }
            .ui-autocomplete {
                max-height: auto;
                overflow-y: auto;
                overflow-x: hidden;
            }
            * html .ui-autocomplete {
                height: auto;
            }

        </style>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <style>            
            html, body {
                height: 100%;
                width: 100%;
            }
            .fill-height {
                min-height: 100%;
                min-width: 100%;
                height:auto !important; /* cross-browser */
                width: 100%; 
                width: auto !important;
                height: 100%; /* cross-browser */
            }
            .tab-content{
                padding: 3px;
                background: #fdfdfd;
                line-height: 15px;
                border: 1px solid #ddd;
                border-top:5px solid #ffe114;
                border-bottom:5px solid #ffe114;
            }
            .chip {
                display: inline-block;
                padding: 0 25px;
                height: 30px;
                font-size: 11px;
                line-height: 30px;
                border-radius: 25px;
                background-color: #f1f1f1;
            }
            .chip img {
                float: left;
                margin: 0 10px 0 -25px;
                height: 30px;
                width: 30px;
                border-radius: 50%;
            }
            .ui-autocomplete {
                max-height: auto;
                overflow-y: auto;
                /* prevent horizontal scrollbar */
                overflow-x: hidden;
            }
            /* IE 6 doesn't support max-height
             * we use height instead, but this forces the menu to always be this tall
             */
            * html .ui-autocomplete {
                height: auto;
            }
            .nav-tabs > li.active > a {
                background-color: #ffe114 !important;
                color: #01354a;
                border: medium none;
                border-radius: 0;
            }
        </style>
        <style>
            .high {
                background-color: greenyellow;
                color: black;
            }
            .low {
                background-color: #ffb3b3;
                color: black;
            }
            .loading{
                width:90%;
                margin:0 auto;
                height:8px;
                background-color:lightblue;
                position:relative;
                transition: all 300ms ease-in-out;
                z-index: 1;
            }
            .sidenav {
                height: 100%;
                width: 0;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #ffe114 !important;
                overflow-x: hidden;
                transition: 0.1s;
                padding-top: 90px;
                z-index: 1000;
            }

            .sidenav a {
                padding: 5px 5px 5px 20px;
                text-decoration: none;
                font-size: 13px;
                font-weight: bold;
                color: #01354a;
                display: block;
                transition: 0.3s;
                z-index: 1;
            }

            .sidenav a:hover {
                background-color: #01354a !important; 
                color: #ffe114;
            }

            .sidenav .closebtn {
                position: absolute;
                top: 0;
                right: 7px;
                font-size: 25px;
                font-weight: bold;
                padding-top: 45px;
            }
            .footer {
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: #01354a !important;
                color: #ffe114;
                text-align: center;
                font-size: 10px;
            }


        </style>
        <style>
            body {
                font: 400 15px Lato, sans-serif;
                line-height: 1.8;
                color: #818181;
            }

            .jumbotron {
                background-color: #428bca;
                color: #fff;
                padding: 15px 25px;
                font-family: Montserrat, sans-serif;
            }
            .container-fluid {
                height:100%;
                width:100%;
            }
            .bg-grey {
                background-color: #f6f6f6;
            }
            .bg-blue {
                background-color: #f2f7fd;
            }
            .logo-small {
                color: #428bca;
                font-size: 50px;
            }
            .logo {
                color: #428bca;
                font-size: 200px;
            }
            .thumbnail {
                padding: 0 0 15px 0;
                border: none;
                border-radius: 0;
            }
            .thumbnail img {
                width: 100%;
                height: 100%;
                margin-bottom: 10px;
            }
            .carousel-control.right, .carousel-control.left {
                background-image: none;
                color: #428bca;
            }
            .carousel-indicators li {
                border-color: #428bca;
            }
            .carousel-indicators li.active {
                background-color: #428bca;
            }
            .item h4 {
                font-size: 19px;
                line-height: 1.375em;
                font-weight: 400;
                font-style: italic;
                margin: 70px 0;
            }
            .item span {
                font-style: normal;
            }
            .panel {
                border: 1px solid #ffe114; 
                border-radius:3px !important;
                transition: box-shadow 0.3s;
            }
            .panel:hover {
                box-shadow: 5px 0px 30px rgba(0,0,0, .2);
            }
            .panel-footer .btn:hover {
                border: 1px solid #ffe114;
                background-color: #fff !important;
                color: #428bca;
            }
            .panel-heading {
                color: #fff !important;
                background-color: #ffe114 !important;
                padding: 15px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }
            .panel-sub-heading {
                color: #fff !important;
                background-color: #428bca !important;
                padding: 5px;
                border-bottom: 1px solid transparent;
                border-top-left-radius: 0px;
                border-top-right-radius: 0px;
                border-bottom-left-radius: 0px;
                border-bottom-right-radius: 0px;
            }
            .panel-footer {
                background-color: white !important;
            }
            .panel-footer h3 {
                font-size: 32px;
            }
            .panel-footer h4 {
                color: #aaa;
                font-size: 14px;
            }
            .panel-footer h5 {
                font-size: 22px;
            }
            .panel-footer h6 {
                font-size: 13px;
            }
            .panel-footer .btn {
                margin: 15px 0;
                background-color: #428bca;
                color: #fff;
            }

            .slideanim {visibility:hidden;}
            .slide {
                animation-name: slide;
                -webkit-animation-name: slide;
                animation-duration: 1s;
                -webkit-animation-duration: 1s;
                visibility: visible;
            }
            @keyframes slide {
                0% {
                    opacity: 0;
                    transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    transform: translateY(0%);
                }
            }
            @-webkit-keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }
            }

        </style>
        <style>
            .dropbtn {
                background-color: #2185eb;
                color: white;
                padding: 0px 0px;
                font-size: 16px;
                border: none;
                cursor: pointer;
                float:right;
                margin-right: 5px;
            }

            .dropdown {
                position: relative;
                display: inline-block;

            }

            .dropdown-content {            
                display: none;   
                margin-top: 31px;
                position: absolute;
                background-color: #f9f9f9;
                min-width: 16px;
                font-size: 12px;
                right: 6px;
                z-index: 1;
                box-sizing: content-box;
                width: 120px;
                height: 110px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }

            .dropdown-content a:hover { background-color: #ccc}

            .dropdown:hover .dropdown-content {
                display: block;
            }

            .dropdown:hover .dropbtn {
                background-color: #2185eb;;
            }

            .dropdown:hover .dmenu {
                display: block;
            }
            .dropdown-submenu {
                position: relative;
            }

            .dropdown-submenu>.dropdown-menu {
                top: 0;
                left: 100%;
                margin-top: -6px;
                margin-left: -1px;
                -webkit-border-radius: 0 6px 6px 6px;
                -moz-border-radius: 0 6px 6px;
                border-radius: 0 6px 6px 6px;
            }

            .dropdown-submenu:hover>.dropdown-menu {
                display: block;
            }

            .dropdown-submenu>a:after {
                display: block;
                content: " ";
                float: right;
                width: 0;
                height: 0;
                border-color: transparent;
                border-style: solid;
                border-width: 5px 0 5px 5px;
                border-left-color: #ccc;
                margin-top: 5px;
                margin-right: -10px;
            }

            .dropdown-submenu:hover>a:after {
                border-left-color: #fff;
            }

            .dropdown-submenu.pull-left {
                float: none;
            }

            .dropdown-submenu.pull-left>.dropdown-menu {
                left: -100%;
                margin-left: 10px;
                -webkit-border-radius: 6px 0 6px 6px;
                -moz-border-radius: 6px 0 6px 6px;
                border-radius: 6px 0 6px 6px;
            }
            .navbar{
                top:0;
                width:100%; 
                z-index: 9999;
                position: fixed;
                background-color: #01354a;
            }

            .navbar-brand {
                margin-top: 0;
                margin-bottom: 0;
                background-color: #01354a;
                color: #ffe114 !important;
                z-index: 9999;
                border: 0;
                font-size: 28px !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;  
                cursor:pointer; 
                vertical-align: middle;
            }
        </style>	
        <script>
            $(document).on('click', '.submit-btn', function (e) {

                if (frm2.fdate.value === "")
                {
                    alert("Please Select The Starting Date");
                    frm2.fdate.focus();
                    return (false);
                }
                if (frm2.todate.value === "")
                {
                    alert("Please Select The Ending Date");
                    frm2.todate.focus();
                    return (false);
                }
                $("#snackbar1").html('<p style="width:100%; height: 50px; font-size:14px; font-weight: bold; text-align: center; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                $("final-submit").val("Processing, please wait...");

            });
        </script>
        <script>
            function show_confirm()
            {
                var r = confirm("Are you sure 'Do you want to process the selected record' ?");
                if (r === true)
                {
                    $("#final-submit").hide();
                    $("#snackbar").show();
                    $("#snackbar").html('<p style="width:100%; height: 50px; font-size:14px; font-weight: bold; text-align: center; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                    return true;
                } else
                {
                    $("#final-submit").show();
                    $("#snackbar").hide();
                    return false;
                }
            }

            function validateCheckbox(f)
            {
                var tallyno = $("#tallyno").val();
                tallyno = tallyno.trim();
                var tallydate = $("#tallydate").val();
                tallydate = tallydate.trim();
                var debit_ledger = $("#debit_ledger").val();
                debit_ledger = debit_ledger.trim();
                var voucher_type = $("#voucher_type").val();
                voucher_type = voucher_type.trim();
                var bank_voucher = $("#bank_voucher").val();
                bank_voucher = bank_voucher.trim();
                var cheque_issued = $("#cheque_issued").val();
                cheque_issued = cheque_issued.trim();
                var depositdate = $("#depositdate").val();
                depositdate = depositdate.trim();
                var checked = false, e, i = 0;
                while (e = f.elements[i++]) {
                    if (e.type === 'checkbox' && e.checked)
                        checked = true;
                }

                if (!checked) {
                    $("#snackbar").hide();
                    $("#final-submit").show();
                    alert("Please Select a Record To Process!");
                } else if (tallyno === '' || tallyno === null) {
                    alert("Enter The tally number");
                    $("#tallyno").focus();
                    return false;
                } else if (tallydate === '' || tallydate === null) {
                    alert("Select The Date ");
                    $("#tallydate").focus();
                    return false;
                } else if (voucher_type === '' || voucher_type === null) {
                    alert("Select The Date ");
                    alert("Please Select the voucher type");
                    return false;
                } else if (debit_ledger === '' || debit_ledger === null) {
                    alert("Select The Debit Ledger ");
                    $("#debit_ledger").focus();
                    return false;
                } else if (bank_voucher === '' || bank_voucher === null) {
                    alert("Select The Bank Voucher ");
                    $("#bank_voucher").focus();
                    return false;
                } else if (cheque_issued === '' || cheque_issued === null) {
                    alert("Select The Cheque Issued Bank ");
                    $("#cheque_issued").focus();
                    return false;
                } else if (depositdate === '' || depositdate === null) {
                    alert("Select The Deposit Date ");
                    $("#depositdate").focus();
                    return false;
                } else {
                    checked = show_confirm();
                }
                return checked;

            }
        </script>   
        <script>
            $(document).on('click', '.submit-btn', function (e) {

                if (frm2.fdate.value === "")
                {
                    alert("Please Select The Starting Date");
                    frm2.fdate.focus();
                    return (false);
                }
                if (frm2.todate.value === "")
                {
                    alert("Please Select The Ending Date");
                    frm2.todate.focus();
                    return (false);
                }
                $("#snackbar1").html('<p style="width:100%; height: 50px; font-size:14px; font-weight: bold; text-align: center; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                $("final-submit").val("Processing, please wait...");

            });
        </script>
    </head>
    <body class="container-fluid" style="background-color: #fff; width: 100%;" >  
        <%@ include file="menu.jsp" %>	
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid" >
                <div class="row">
                    <div class="col-md-12">
                        <form name="frm2" id="frm2" method="post" action="e503PaymentProcessed.jsp" >                      
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; Reconciliation (Pending/Processed) 
                                    </h3>
                                </div>
                                <div class="panel-body" style="padding-top: 20px;"> 
                                    <div class="form-row"> 
                                        <div class="form-group col-md-2">
                                            <label for="paymentdate">From Date</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text" class="form-control" id="fdate" name="fdate" value="<%= fdate%>" placeholder="DD/MM/YYYY"/>
                                            </div>
                                        </div> 
                                        <div class="form-group col-md-2">
                                            <label for="paymentdate">To Date</label>
                                            <div class='input-group date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text" class="form-control" id="todate" name="todate" value="<%= todate%>" placeholder="DD/MM/YYYY"/>   
                                            </div>
                                        </div> 
                                        <div class="form-group col-md-3">
                                            <label for="sub" hidden>Submit</label>
                                            <div class='input-group' style="margin-top:30px;">
                                                <input type="submit" class="btn btn-primary submit-btn" id="submit-btn" value="Get Records">
                                            </div>                                            
                                        </div>                                            
                                    </div>
                                </div>                                    
                                <div id="snackbar"></div>
                                <div class="panel-heading"></div>
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <table id="gideon" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: right;" nowrap>RID</th>
                                                <th style="text-align: left;" nowrap>e503 Month</th>
                                                <th style="text-align: left;" nowrap>Camp</th>   
                                                <th style="text-align: left;" nowrap>Remitter Name</th>   
                                                <th style="text-align: right;" nowrap>View Payments</th>                                                   
                                                <th style="text-align: right;" nowrap>View SF</th>                                                   
                                                <th style="text-align: right;" nowrap>View Admin</th> 
                                                <th style="text-align: right;" nowrap>View Membership</th>    
                                                <th style="text-align: right;" nowrap>View PWT</th>                                              
                                                <th style="text-align: right;" nowrap>View Special Bible</th>
                                                <th style="text-align: right;" nowrap>View Merchandise</th>

                                            </tr>
                                        </thead>

                                        <%
                                            String sql = "SELECT rid,modified_on submitted_on,nvl(remitter,'-') remitter,to_char(tallydate,'DD-MON-YY') tallydate,"
                                                    + "e503month||'-'||e503year e503_month,nvl(initcap(camp),'-') camp,"
                                                    + "initcap(Cars_get_StateAsso(camp)) sa,nvl(sf1fee,'0') scripture_fund,"
                                                    + "nvl(stickerscnt,'0') stickerscnt,nvl(stickersamount,'0') stickersamount, "
                                                    + "nvl(afamount,'0') administrative_fund,nvl(moamount,'0') Membership,"
                                                    + "nvl(pwtamount,'0') pwtamount, nvl(tallyno,'0') tallyno,nvl(splbamount,'0') spl_bible,"
                                                    + "nvl(sf2fee,'0') sf2fee,nvl(total_amount,'0') total_amount,nvl(tramount,'0') tramount,"
                                                    + "nvl(paymode,'-') paymode,nvl(trno,'-') trno,trdate,nvl(trbank,'-') bank,"
                                                    + "nvl(trbranch,'-') branch,nvl(remitter,'-') remitter,nvl(trremarks,'-') payment_remarks,"
                                                    + "nvl(sf1remarks,'-') scripture_fund_remarks,nvl(mremarks,'-') membership_remarks,"
                                                    + "nvl(pwtremarks,'-') pwt_remarks,nvl(miremarks,'-') merchandise_remarks,"
                                                    + "nvl(tallyno,'-') tally_no,tallydate,nvl(tallyremarks,'-') tally_remarks,"
                                                    + "nvl(sf2cnt,'0') sf2cnt, nvl(slcnt,'0') slcnt,  nvl(slamount,'0') slamount, "
                                                    + "nvl(dicnt,'0') dicnt, nvl(diamount,'0') diamount, nvl(diincnt,'0') diincnt, "
                                                    + "nvl(diinamount,'0') diinamount, nvl(splbcnt,'0') splbcnt, nvl(aeamount,'0') aeamount,"
                                                    + "nvl(splbamount,'0') splbamount,nvl(tbcnt,'0')  tbcnt, nvl(stickerscnt,'0')  stickerscnt, "
                                                    + "nvl(tbamount,'0')  tbamount,  nvl(stickersamount,'0') stickersamount, nvl(sbcnt,'0') sbcnt,"
                                                    + "nvl(sbamount,'0')  sbamount,nvl(pwamount,'0') pwamount,nvl(ggbamount,'0') ggbamount,"
                                                    + "nvl(agbcnt,'0') agbcnt,nvl(pwcnt,'0') pwcnt,nvl(agbamount,'0') agbamount,"
                                                    + "nvl(ggbcnt,'0')  ggbcnt,nvl(pwtgcnt,'0') pwtgcnt,nvl(pwtgamount,'0') pwtgamount,"
                                                    + "nvl(gecnt,'0') gecnt,nvl(geamount,'0') geamount,nvl(aecnt,'0') aecnt,nvl(pwtacnt,'0') pwtacnt,"
                                                    + "nvl(pwtaamount,'0') pwtaamount,nvl(pwthbcnt,'0') pwthbcnt,nvl(pwthbamount,'0') pwthbamount,"
                                                    + "nvl(pwtlbcnt,'0') pwtlbcnt,nvl(pwtlbamount,'0') pwtlbamount,nvl(cpcnt,'0') cpcnt,"
                                                    + "nvl(ncpcnt,'0') ncpcnt,nvl(scpcnt,'0') scpcnt,nvl(gcbpcnt,'0') gcbpcnt,"
                                                    + "nvl(nccamount,'0') nccamount,nvl(sccamount,'0') sccamount,nvl(cafamount,'0') cafamount,"
                                                    + "nvl(mocnt,'0') mocnt,nvl(moamount,'0') moamount,nvl(afamount,'0') afamount,"
                                                    + "nvl(rlaamount,'0') rlaamount,nvl(nlgcnt,'0') nlgcnt,nvl(nlacnt,'0') nlacnt,"
                                                    + "nvl(nlaamount,'0') nlaamount,nvl(nlgamount,'0') nlgamount,nvl(naaamount,'0') naaamount,"
                                                    + "nvl(nagamount,'0') nagamount,nvl(naacnt,'0') naacnt,nvl(nagcnt,'0') nagcnt,"
                                                    + "nvl(sf1fee,'0') sf1fee,nvl(rlacnt,'0') rlacnt,nvl(rlgamount,'0') rlgamount,"
                                                    + "nvl(rlgcnt,'0') rlgcnt,nvl(raaamount,'0') raaamount,nvl(raacnt,'0') raacnt,"
                                                    + "nvl(ragcnt,'0') ragcnt,nvl(ragamount,'0') ragamount,nvl(sf1remarks,'-') sf1remarks,"
                                                    + "nvl(sbamount,'0') sbamount,nvl(stickersamount,'0') stickersamount,nvl(pwamount,'0') pwamount,"
                                                    + "nvl(tbamount,'0') tbamount,nvl(aeamount,'0') aeamount,nvl(agbamount,'0') agbamount,"
                                                    + "nvl(geamount,'0') geamount,nvl(ggbamount,'0') ggbamount,nvl(diinamount,'0') diinamount,"
                                                    + "nvl(slamount,'0') slamount,nvl(diamount,'0') diamount,nvl(pwthbamount,'0') pwthbamount,"
                                                    + "nvl(pwtlbamount,'0') pwtlbamount,nvl(pwtgamount,'0') pwtgamount,nvl(pwtaamount,'0') pwtaamount,"
                                                    + "nvl(nlgamount,'0') nlgamount,nvl(nlaamount,'0') nlaamount,nvl(nagamount,'0') nagamount,"
                                                    + "nvl(naaamount,'0') naaamount,nvl(rlaamount,'0') rlaamount,nvl(rlgamount,'0') rlgamount,"
                                                    + "nvl(ragamount,'0') ragamount,nvl(raaamount,'0') raaamount,nvl(cafamount,'0') cafamount,"
                                                    + "nvl(nccamount,'0') nccamount,nvl(sccamount,'0') sccamount,nvl(scogamount,'0') scogamount,"
                                                    + "nvl(scoaamount,'0') scoaamount,nvl(ncogamount,'0') ncogamount,nvl(ncoaamount,'0') ncoaamount,"
                                                    + "nvl(sploamount,'0') sploamount,nvl(ffbamount,'0') ffbamount,nvl(ffoamount,'0') ffoamount,nvl(scpabamount,'0') scpabamount,nvl(fframount,'0') fframount,nvl(ffgamount,'0') ffgamount,nvl(ffaamount,'0') ffaamount,nvl(croamount,'0') croamount,nvl(ncroamount,'0') ncroamount,nvl(scroamount,'0') scroamount,nvl(gcbpamount,'0') gcbpamount,nvl(ncpabamount,'0') ncpabamount,nvl(pabamount,'0') pabamount "
                                                    + "FROM E503 where (to_date(substr(modified_on,1,9),'DD-MM-YY') between to_date('" + fdate + "','DD-MM-YY') and to_date('" + todate + "','DD-MM-YY') ) and rid in (select mid from e503_payment) order by modified_on,rid";

                                            DataSource ds = null;
                                            Connection con = null;
                                            ResultSet rs = null;
                                            Context context = new InitialContext();
                                            Context envCtx = (Context) context.lookup("java:comp/env");
                                            ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                            try {
                                                con = ds.getConnection();
                                                Statement statement = con.createStatement();
                                                ResultSet resultSet = statement.executeQuery(sql);
                                                while (resultSet.next()) {

                                        %>
                                        <tr>
                                            <td style="text-align: center;" nowrap><%=resultSet.getString("rid")%></td>
                                            <td style="text-align: left;" nowrap><%=resultSet.getString("e503_month")%></td>
                                            <td style="text-align: left;" nowrap><%=resultSet.getString("camp")%></td>    
                                            <td style="text-align: left;" nowrap><%=resultSet.getString("remitter")%></td> 
                                            <td style="text-align: right;" nowrap><button type='button' class='btn btn-success btn-xs first' name='editRow' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal' title='View this record' ><i class='fa fa-pencil'></i></button></td>
                                            <td style="text-align: right;" nowrap><input type='button' value="<%=resultSet.getString("sf1fee")%>" class='second' name='editRow1' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal1' title='View this record' ></td>
                                            <td style="text-align: right;" nowrap><input type='button' value="<%=resultSet.getString("afamount")%>" class=' third' name='editRow2' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal2' title='View this record' ></td>
                                            <td style="text-align: right;" nowrap><input type='button' value="<%=resultSet.getString("moamount")%>" class=' fourth' name='editRow3' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal3' title='View this record' ></td>
                                            <td style="text-align: right;" nowrap><input type='button'  value="<%=resultSet.getString("pwtamount")%>" class='fivth' name='editRow4' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal4' title='View this record' ></td>
                                            <td style="text-align: right;" nowrap><input type='button' value="<%=resultSet.getString("splbamount")%>"  class=' sixth' name='editRow5' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal5' title='View this record' ></td>
                                            <td style="text-align: right;" nowrap><input type='button' value="<%=resultSet.getString("sf2fee")%>" class='seventh' name='editRow6' rid="<%=resultSet.getString("rid")%>" data-toggle='modal' data-target='#myModal6' title='View this record' ></td>

                                        </tr>
                                        <%
                                                }
                                                resultSet.close();
                                                statement.close();
                                                con.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </table>
                                </div>
                            </div>                           
                        </form>
                    </div> 
                </div>
            </div>
        </section>

        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 1400 !important;">
            <div class="modal-dialog" role="document" style="width: 100%; height: 100%; margin-top: 50px;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form name="frm_apply" method="post" action="ProcessPaymentRequest" onsubmit="return validateCheckbox(this)">
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Payments In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="payment" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>          
                                                <th style="text-align: center;" nowrap>RID</th>
                                                <th style="text-align: left;" nowrap>Month</th>
                                                <th style="text-align: left;" nowrap>Camp</th>
                                                <th style="text-align: left;" nowrap>Contact Person</th>
                                                <th style="text-align: left;" nowrap>Pay Mode</th>   
                                                <th style="text-align: left;" nowrap>Transaction Number</th>   
                                                <th style="text-align: left;" nowrap>Transaction Date</th>
                                                <th style="text-align: right;" nowrap>Transaction Amount</th>                                                
                                                <th style="text-align: left;" nowrap>Transaction Bank</th>                                                
                                                <th style="text-align: left;" nowrap>Transaction Branch</th>
                                                <th style="text-align: left;" nowrap>Transaction Remarks</th>   
                                            </tr>
                                        </thead>                                     
                                        <tfoot>
                                            <tr>
                                                <th colspan="7" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                <th></th>
                                                <th  colspan="3" style="text-align:right"></th>                                                                                                 
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>                               
                            </div>
                            <div class='panel panel-default panel-accent-gold' hidden>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 5px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; TALLY ENTRY DETAILS
                                    </h3>
                                </div>
                                <div class="panel-body" style="padding-top: 20px;"> 
                                    <div class="form-row">
                                        <div class="form-group col-md-3">
                                            <label for="tallyno">Tally Receipt No</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-th"></span>
                                                </span>
                                                <input type='text' class="form-control" name="tallyno" id="tallyno" />
                                                <input type='hidden' class="form-control" name="rid" id="rid"   value="<%= rid%>" required/>
                                            </div>
                                        </div>

                                        <div class="form-group col-md-3">
                                            <label for="tallydate">Date of Tally Entry</label>
                                            <div class='input-group date' id='event_date_cal'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type='text' class="form-control" name="tallydate" id="tallydate" />
                                            </div>
                                        </div>  
                                        <div class="form-group col-md-3">
                                            <label for="tallydate">Voucher Type</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-th"></span>
                                                </span>
                                                <select class="form-control" id="voucher_type"  name="voucher_type">
                                                    <option>Bank-ICICI Direct-Receipt</option>
                                                    <option>SBI Direct Receipt</option>
                                                    <option>Cash Receipt</option>
                                                    <option>IOB Direct Deposit</option>
                                                    <option>Bank-Cheque-Receipt</option>
                                                    <option>Bank-Draft-Receipt</option>
                                                </select>
                                            </div>
                                        </div>    
                                        <div class="form-group col-md-3">
                                            <label for="tallydate">Debit Ledger</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-th"></span>
                                                </span>
                                                <select class="form-control" id="debit_ledger" name="debit_ledger">
                                                    <option>ICICI Bank Ltd.</option>
                                                    <option>SBI, Bhaskar Rao Nagar Branch</option>
                                                    <option>Cash</option>
                                                    <option>IOB</option>
                                                    <option>Kotak Mahindra Bank Ltd.</option>
                                                </select>
                                            </div>
                                        </div>   
                                        <div class="form-group col-md-3">
                                            <label for="tallydate">Bank Voucher</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-th"></span>
                                                </span>
                                                <select class="form-control" id="bank_voucher" name="bank_voucher">
                                                    <option>ICICI Direct Deposit</option>
                                                    <option>SBI Direct Deposit</option>
                                                    <option>Cash</option>
                                                    <option>IOB Direct Deposit</option>
                                                    <option>Bank Receipt</option>
                                                    <option>Demand Draft</option>
                                                </select>
                                            </div>
                                        </div> 
                                        <div class="form-group col-md-3">
                                            <label for="tallydate">Cheque Issued Bank</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-th"></span>
                                                </span>
                                                <select class="form-control" id="cheque_issued" name="cheque_issued">
                                                    <option value="0">-- Select Bank --</option>
                                                    <option value="Abu Dhabi Commercial Bank Ltd">Abu Dhabi Commercial Bank</option>
                                                    <option value="American Express Bank Ltd">American Express Bank</option>
                                                    <option value="Arab Bangladesh Bank Limited">Arab Bangladesh Bank</option>
                                                    <option value="Allahabad Bank">Allahabad Bank</option>
                                                    <option value="Andhra Bank">Andhra Bank</option>
                                                    <option value="Axis Bank">Axis Bank</option>
                                                    <option value="Antwerp Diamond Bank N.V.">Antwerp Diamond Bank</option>
                                                    <option value="Bank International Indonesia">Bank International Indonesia</option>
                                                    <option value="Bank of America N.A.">Bank of America N.A.</option>
                                                    <option value="Bank of Bahrain & Kuwait BSC">Bank of Bahrain & Kuwait</option>
                                                    <option value="Barclays Bank Plc">Barclays Bank Plc</option>
                                                    <option value="BNP PARIBAS">BNP PARIBAS</option>
                                                    <option value="Bank of Ceylon">Bank of Ceylon</option>
                                                    <option value="Bank of Baroda">Bank of Baroda</option>
                                                    <option value="Bank of India">Bank of India</option>
                                                    <option value="Bank of Maharashtra">Bank of Maharashtra</option>
                                                    <option value="Canara Bank">Canara Bank</option>
                                                    <option value="Central Bank of India">Central Bank of India</option>
                                                    <option value="Calyon Bank">Calyon Bank</option>
                                                    <option value="Citibank N.A.">Citibank N.A.</option>
                                                    <option value="Cho Hung Bank">Cho Hung Bank</option>
                                                    <option value="Chinatrust Commercial Bank Ltd">Chinatrust Commercial Bank</option>
                                                    <option value="City Union Bank Ltd">City Union Bank</option>
                                                    <option value="Coastal Local Area Bank Ltd">Coastal Local Area Bank</option>
                                                    <option value="Corporation Bank">Corporation Bank</option>
                                                    <option value="Catholic Syrian Bank Ltd">Catholic Syrian Bank</option>
                                                    <option value="Deutsche Bank AG">Deutsche Bank AG</option>
                                                    <option value="Development Credit Bank Ltd">Development Credit Bank</option>
                                                    <option value="Dena Bank">Dena Bank</option>
                                                    <option value="IndusInd Bank Limited">IndusInd Bank</option>
                                                    <option value="ICICI Bank">ICICI Bank</option>
                                                    <option value="Indian Bank">Indian Bank</option>
                                                    <option value="Indian Overseas Bank">Indian Overseas Bank</option>
                                                    <option value="Industrial Development Bank of India">IDBI</option>
                                                    <option value="ING Vysya Bank">ING Vysya Bank</option>
                                                    <option value="J P Morgan Chase Bank, National Association">J P Morgan Chase Bank</option>
                                                    <option value="Krung Thai Bank Public Company Limited">Krung Thai Bank</option>
                                                    <option value="Kotak Mahindra Bank Limited">Kotak Mahindra Bank</option>
                                                    <option value="Karnataka Bank">Karnataka Bank</option>
                                                    <option value="Karur Vysya Bank Limited">Karur Vysya Bank</option>
                                                    <option value="Lord Krishna Bank Ltd">Lord Krishna Bank</option>
                                                    <option value="Mashreqbank psc">Mashreqbank psc</option>
                                                    <option value="Mizuho Corporate Bank Ltd">Mizuho Corporate Bank</option>
                                                    <option value="Oman International Bank S A O G">Oman International Bank S A O G</option>
                                                    <option value="Oriental Bank of Commerce">Oriental Bank of Commerce</option>
                                                    <option value="Punjab & Sind Bank">Punjab & Sind Bank</option>
                                                    <option value="Punjab National Bank">Punjab National Bank</option>
                                                    <option value="Societe Generale">Societe Generale</option>
                                                    <option value="Sonali Bank">Sonali Bank</option>
                                                    <option value="Standard Chartered Bank">Standard Chartered Bank</option>
                                                    <option value="State Bank of Mauritius Ltd">State Bank of Mauritius</option>
                                                    <option value="SBI Commercial and International Bank Ltd">SBI Commercial and International</option>
                                                    <option value="State Bank of Bikaner and Jaipur">State Bank of Bikaner and Jaipur</option>
                                                    <option value="State Bank of Hyderabad">State Bank of Hyderabad</option>
                                                    <option value="State Bank of India">State Bank of India</option>
                                                    <option value="State Bank of Mysore">State Bank of Mysore</option>
                                                    <option value="State Bank of Patiala">State Bank of Patiala</option>
                                                    <option value="State Bank of Travancore">State Bank of Travancore</option>
                                                    <option value="Syndicate Bank">Syndicate Bank</option>
                                                    <option value="The Bank of Nova Scotia">The Bank of Nova Scotia</option>
                                                    <option value="The Bank of Tokyo-Mitsubishi, Ltd">The Bank of Tokyo-Mitsubishi</option>
                                                    <option value="The Development Bank of Singapore Ltd (DBS Bank Ltd)">DBS</option>
                                                    <option value="The Hongkong & Shanghai Banking Corporation Ltd">HSBC</option>
                                                    <option value="Tamilnad Mercantile Bank Ltd">Tamilnad Mercantile Bank</option>
                                                    <option value="The Dhanalakshmi Bank Limited">The Dhanalakshmi Bank</option>
                                                    <option value="The Federal Bank Ltd">Federal Bank Ltd</option>
                                                    <option value="The HDFC Bank Ltd">HDFC Bank Ltd</option>
                                                    <option value="The Jammu & Kashmir Bank Ltd">Jammu & Kashmir Bank</option>
                                                    <option value="The Nainital Bank Ltd">Nainital Bank</option>
                                                    <option value="The Sangli Bank Ltd">Sangli Bank</option>
                                                    <option value="The South Indian Bank Ltd">South Indian Bank</option>
                                                    <option value="The Ratnakar Bank Ltd">Ratnakar Bank</option>
                                                    <option value="The Royal Bank of Scotland N.V.">Royal Bank of Scotland</option>
                                                    <option value="The Lakshmi Vilas Bank Ltd">Lakshmi Vilas Bank</option>
                                                    <option value="UCO Bank">UCO Bank</option>
                                                    <option value="Union Bank of India">Union Bank of India</option>
                                                    <option value="United Bank Of India">United Bank Of India</option>
                                                    <option value="Vijaya Bank">Vijaya Bank</option>
                                                    <option value="Yes Bank">Yes Bank</option>
                                                    <option value="National Bank for Agriculture and Rural Development">NBARD</option>
                                                    <option value="Export-Import Bank of India">Export-Import Bank of India</option>
                                                    <option value="National Housing Bank">National Housing Bank</option>
                                                    <option value="Small Industries Development Bank of India">SIDBI</option>
                                                    <option value="Industrial Investment Bank of India Ltd.">IIBI</option>
                                                    <option value="North Eastern Development Finance Corporation">NEDFC</option>
                                                </select>
                                            </div>
                                        </div> 
                                        <div class="form-group col-md-3">
                                            <label for="tallydate">Date of Deposit</label>
                                            <div class='input-group date' id='event_date_cal1'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type='text' class="form-control" name="depositdate" id="depositdate" />
                                            </div>
                                        </div>                                  
                                        <div class="form-group col-md-6">
                                            <label for="remarks">Remarks, if any</label>
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-paperclip"></span>
                                                </span>
                                                <input type='text' class="form-control" name="tallyremarks" id="tallyremarks" autocomplete="off"/>
                                            </div>                                            
                                        </div>                                     
                                        <div class="form-group col-md-3">
                                            <label for="submit">&nbsp;</label>
                                            <div class='input-group'>
                                                <button type="submit" id="final-submit" class="btn btn-primary pull-right">Submit</button>
                                            </div>                                            
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 1400 !important;">
            <div class="modal-dialog" role="document" style="width: 100%; height: 100%; margin-top: 50px;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Scripture Fund In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="sf" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: center;" nowrap>Church Retiring Offertory Count</th>
                                                <th style="text-align: center;" nowrap>Church Retiring Offertory (CRO)</th>                                                 
                                                <th style="text-align: center;" nowrap>National Convention Count</th>
                                                <th style="text-align: center;" nowrap>National Convention CRO</th>                                                
                                                <th style="text-align: center;" nowrap>State Convention Count</th>
                                                <th style="text-align: center;" nowrap>State Convention CRO</th>                                                
                                                <th style="text-align: center;" nowrap>Gideon Card Program Count</th>   
                                                <th style="text-align: center;" nowrap>Gideon Card Program</th>   
                                                <th style="text-align: center;" nowrap>Pastors Banquet (PAB)</th>   
                                                <th style="text-align: center;" nowrap>National Convention PAB</th>
                                                <th style="text-align: center;" nowrap>State Convention PAB</th>                                                
                                                <th style="text-align: center;" nowrap>Faith Fund Rally</th>                                                
                                                <th style="text-align: center;" nowrap>Faith Fund Gideons</th>
                                                <th style="text-align: center;" nowrap>Faith Fund Auxiliary</th>  
                                                <th style="text-align: center;" nowrap>Faith Fund - Non Gideons</th>
                                                <th style="text-align: center;" nowrap>Auxiliary Luncheon National</th>
                                                <th style="text-align: center;" nowrap>Auxiliary Luncheon State</th>
                                                <th style="text-align: center;" nowrap>National Convention Special Offering</th>   
                                                <th style="text-align: center;" nowrap>State Convention Special Offering</th>   
                                                <th style="text-align: center;" nowrap>State Convention CD100</th>
                                                <th style="text-align: center;" nowrap>State Convention Aux Heart Fund</th>    
                                            </tr>
                                        </thead>
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 1400 !important;">
            <div class="modal-dialog" role="document" style="width: 100%; height: 100%; margin-top: 50px;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Administrative Fund in Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="admin" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: center;" nowrap>National Convention Contribution</th>
                                                <th style="text-align: center;" nowrap>State Convention Contribution</th>
                                                <th style="text-align: center;" nowrap>Contribution to Administrative Funds</th>                                                
                                            </tr>
                                        </thead> 
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 1400 !important;">
            <div class="modal-dialog" role="document" style="width: 100%; height: 100%; margin-top: 50px;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Member In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="member" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: center;" nowrap>Camp</th>
                                                <th style="text-align: left;" nowrap>Name</th>
                                                <th style="text-align: left;" nowrap>Member Plan</th>
                                                <th style="text-align: left;" nowrap>Member Status</th>   
                                                <th style="text-align: left;" nowrap>Phone</th>   
                                                <th style="text-align: left;" nowrap>Record Status</th>
                                                <th style="text-align: left;" nowrap>Submitted On</th>                                                
                                                <th style="text-align: left;" nowrap>Contact Person</th>   
                                                <th style="text-align: left;" nowrap>Tally Receipt Number</th>
                                                <th style="text-align: left;" nowrap>Email</th>                                                
                                            </tr>
                                        </thead>                                       
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal4" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"  style="z-index: 1400 !important;">
            <div class="modal-dialog" role="document" style="width: 100%; height: 100%; margin-top: 50px;">
                <div class="modal-content" style="height: auto; min-height: 100%;">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>PWT In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="pwt" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: left;" nowrap>Type</th>
                                                <th style="text-align: left;" nowrap>Language</th>
                                                <th style="text-align: left;" nowrap>Color</th>
                                                <th style="text-align: right;" nowrap>Quantity</th> 
                                                <th style="text-align: right;" nowrap>Amount</th> 
                                            </tr>
                                        </thead> 
                                        <tfoot>
                                            <tr>
                                                <th colspan="3" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                <th></th>     
                                                <th></th>     
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 1400 !important;">
            <div class="modal-dialog" role="document" style="width: 100%; height: 100%; margin-top: 50px;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Special Bible In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="sb" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: left;" nowrap>Type</th>
                                                <th style="text-align: right;" nowrap>Quantity</th>
                                                <th style="text-align: right;" nowrap>Amount</th>
                                            </tr>
                                        </thead> 
                                        <tfoot>
                                            <tr>
                                                <th colspan="1" style="text-align:right">Page Total: <br>Overall Total:</th>
                                                <th></th>
                                                <th></th>                                                                                                                                              
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal6" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="z-index: 1400 !important;">
            <div class="modal-dialog" role="document" style="width: 100%; height: 100%; margin-top: 50px;">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: #337ab7; color: #fff; font-weight: bold; word-spacing: 2px;">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>   
                    <div class="modal-body" id="resk">
                        <form>
                            <div class='panel panel-default'>
                                <div class="panel-heading">
                                    <center>    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7;">
                                            <i class="glyphicon glyphicon-th"></i>&nbsp; <b>Merchandise In Detail</b>
                                        </h3></center>
                                </div>
                                <div class="table-responsive" style="vertical-align: middle; width: 100%; font-size: 12px; color: navy; font-weight: bold; padding: 5px;">
                                    <table id="merchan" class="table table-bordered table-responsive table-hover" style="width:100%">                                      
                                        <thead style="background-color: #01354a; color: #ffe114; width: 100%;">
                                            <tr>  
                                                <th style="text-align: center;" nowrap>Gideon Guide Book Count</th> 
                                                <th style="text-align: center;" nowrap>Gideon Guide Book</th> 
                                                <th style="text-align: center;" nowrap>Auxiliary Guide Book Count</th>    
                                                <th style="text-align: center;" nowrap>Auxiliary Guide Book</th>   
                                                <th style="text-align: center;" nowrap>Gideon Emblem Count</th>    
                                                <th style="text-align: center;" nowrap>Gideon Emblem</th> 
                                                <th style="text-align: center;" nowrap>Auxiliary Emblem Count</th>  
                                                <th style="text-align: center;" nowrap>Auxiliary Emblem</th> 
                                                <th style="text-align: center;" nowrap>Testimony Booklets Count</th> 
                                                <th style="text-align: center;" nowrap>Testimony Booklets</th>  
                                                <th style="text-align: center;" nowrap>Song Books Count</th>  
                                                <th style="text-align: center;" nowrap>Song Books</th> 
                                                <th style="text-align: center;" nowrap>Paper Weight Count</th>   
                                                <th style="text-align: center;" nowrap>Paper Weight</th>   
                                                <th style="text-align: center;" nowrap>Car / Scooter Stickers Count</th> 
                                                <th style="text-align: center;" nowrap>Car / Scooter Stickers </th> 
                                            </tr>
                                        </thead> 
                                    </table>
                                </div>                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <footer class="footer">
            <span class="text-muted">&nbsp;</span>
        </footer>
        <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
        <script type="text/javascript" language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/buttons.bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://editor.datatables.net/extensions/Editor/js/editor.bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.flash.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.html5.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.2/js/buttons.print.min.js"></script>
        <!-- <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script> -->
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>  
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script>
                            $('#fdate').datepicker({
                                format: "dd/mm/yyyy",
                                language: "es",
                                autoclose: true,
                                todayHighlight: true
                            });

                            $('#todate').datepicker({
                                format: "dd/mm/yyyy",
                                language: "es",
                                autoclose: true,
                                todayHighlight: true
                            });


                            $('#event_date_cal').datepicker({
                                format: "mm/dd/yyyy",
                                language: "es",
                                autoclose: true,
                                todayHighlight: true
                            });
                            $("#event_date_cal").datepicker().datepicker("setDate", new Date());

                            $('#event_date_cal1').datepicker({
                                format: "mm/dd/yyyy",
                                language: "es",
                                autoclose: true,
                                todayHighlight: true
                            });
                            $("#event_date_cal1").datepicker().datepicker("setDate", new Date());
        </script>
        <script>
            $(document).on('click', '.seventh', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'MerchanView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#merchan').DataTable({
                            destroy: true,
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            lengthMenu: [
                                [10, 20, 50, -1],
                                ['10 rows', '20 rows', '50 rows', 'Show all']
                            ],
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    footer: true
                                }
                            ],
                            ajax: {
                                method: "POST",
                                url: "MerchanView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "ggbcnt"},
                                {"data": "ggbamount"},
                                {"data": "agbcnt"},
                                {"data": "agbamount"},
                                {"data": "gecnt"},
                                {"data": "geamount"},
                                {"data": "aecnt"},
                                {"data": "aeamount"},
                                {"data": "tbcnt"},
                                {"data": "tbamount"},
                                {"data": "sbcnt"},
                                {"data": "sbamount"},
                                {"data": "pwcnt"},
                                {"data": "pwamount"},
                                {"data": "stickerscnt"},
                                {"data": "stickersamount"}
                            ], columnDefs: [
                                {className: 'text-center', targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]}

                            ]
                        });

                    }
                });
            });
        </script>

        <script>
            $(document).on('click', '.first', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'FinancePaymentView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#payment').DataTable({
                            destroy: true,
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            lengthMenu: [
                                [10, 20, 50, -1],
                                ['10 rows', '20 rows', '50 rows', 'Show all']
                            ],
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    footer: true
                                }
                            ],
                            ajax: {
                                method: "POST",
                                url: "FinancePaymentView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "rid"},
                                {"data": "e503month"},
                                {"data": "camp"},
                                {"data": "contactperson"},
                                {"data": "paymode"},
                                {"data": "trno"},
                                {"data": "trdate"},
                                {"data": "tramount"},
                                {"data": "trbank"},
                                {"data": "trbranch"},
                                {"data": "trremarks"}
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
                            }
                        });

                    }
                });
            });
        </script>

        <script>
            $(document).on('click', '.third', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'AdminView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#admin').DataTable({
                            destroy: true,
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            lengthMenu: [
                                [10, 20, 50, -1],
                                ['10 rows', '20 rows', '50 rows', 'Show all']
                            ],
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    footer: true
                                }
                            ],
                            ajax: {
                                method: "POST",
                                url: "AdminView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "nccamount"},
                                {"data": "sccamount"},
                                {"data": "cafamount"}
                            ], columnDefs: [
                                {className: 'text-center', targets: [0, 1, 2]}

                            ]
                        });

                    }
                });
            });
        </script>

        <script>
            $(document).on('click', '.fivth', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'PWTView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#pwt').DataTable({
                            destroy: true,
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            lengthMenu: [
                                [10, 20, 50, -1],
                                ['10 rows', '20 rows', '50 rows', 'Show all']
                            ],
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    footer: true
                                }
                            ],
                            ajax: {
                                method: "POST",
                                url: "PWTView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "type"},
                                {"data": "language"},
                                {"data": "color"},
                                {"data": "qty"},
                                {"data": "cost"},
                            ], columnDefs: [
                                {className: 'text-right', targets: [3, 4]}

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
                                // Total over this page


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

                                // Update footer

                                $(api.column(3).footer()).html(
                                        '' + pageTotal3 + '<br>(' + total3 + ')'
                                        );
                                $(api.column(4).footer()).html(
                                        '' + pageTotal4 + '<br>(' + total4 + ')'
                                        );


                            }
                        });

                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.sixth', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'SBView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#sb').DataTable({
                            destroy: true,
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            lengthMenu: [
                                [10, 20, 50, -1],
                                ['10 rows', '20 rows', '50 rows', 'Show all']
                            ],
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    footer: true
                                }
                            ],
                            ajax: {
                                method: "POST",
                                url: "SBView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "type"},
                                {"data": "qty"},
                                {"data": "cost"}
                            ], columnDefs: [
                                {className: 'text-right', targets: [1, 2]}

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
                                // Total over this page



                                pageTotal1 = api
                                        .column(1, {page: 'current'})
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

                                // Update footer


                                $(api.column(1).footer()).html(
                                        '' + pageTotal1 + '<br>(' + total1 + ')'
                                        );
                                $(api.column(2).footer()).html(
                                        '' + pageTotal2 + '<br>(' + total2 + ')'
                                        );

                            }
                        });

                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.fourth', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'MemberView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#member').DataTable({
                            destroy: true,
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            lengthMenu: [
                                [10, 20, 50, -1],
                                ['10 rows', '20 rows', '50 rows', 'Show all']
                            ],
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    footer: true
                                }
                            ],
                            ajax: {
                                method: "POST",
                                url: "MemberView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "camp"},
                                {"data": "name"},
                                {"data": "memplan"},
                                {"data": "memstatus"},
                                {"data": "phone"},
                                {"data": "record_status"},
                                {"data": "submitted_on"},
                                {"data": "contactperson"},
                                {"data": "tally_receipt_no"},
                                {"data": "email"}
                            ]
                        });

                    }
                });
            });
        </script>
        <script>
            $(document).on('click', '.second', function () {
                var rid = $(this).attr('rid');
                $.ajax({
                    minLength: 5,
                    delay: 500,
                    url: 'SFView?rid=' + rid,
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var table;
                        table = $('#sf').DataTable({
                            destroy: true,
                            responsive: true,
                            stateSave: true,
                            "ordering": true,
                            lengthMenu: [
                                [10, 20, 50, -1],
                                ['10 rows', '20 rows', '50 rows', 'Show all']
                            ],
                            rowId: 'extn',
                            deferRender: true,
                            dom: 'Bfrtip',
                            buttons: [
                                'pageLength',
                                {
                                    extend: 'excel',
                                    footer: true
                                }
                            ],
                            ajax: {
                                method: "POST",
                                url: "SFView?rid=" + rid,
                                dataSrc: "datas"
                            },
                            columns: [
                                {"data": "cpcnt"},
                                {"data": "croamount"},
                                {"data": "ncpcnt"},
                                {"data": "ncroamount"},
                                {"data": "scpcnt"},
                                {"data": "scroamount"},
                                {"data": "gcbpcnt"},
                                {"data": "gcbpamount"},
                                {"data": "pabamount"},
                                {"data": "ncpabamount"},
                                {"data": "scpabamount"},
                                {"data": "fframount"},
                                {"data": "ffgamount"},
                                {"data": "ffaamount"},
                                {"data": "ffoamount"},
                                {"data": "ffbamount"},
                                {"data": "sploamount"},
                                {"data": "ncogamount"},
                                {"data": "ncoaamount"},
                                {"data": "scogamount"},
                                {"data": "scoaamount"}
                            ], columnDefs: [
                                {className: 'text-center', targets: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]}

                            ]
                        });

                    }
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#gideon').DataTable({
                    responsive: true,
                    stateSave: true,
                    "ordering": true,
                    lengthMenu: [
                        [10, 20, 50, -1],
                        ['10 rows', '20 rows', '50 rows', 'Show all']
                    ],
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        'pageLength',
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ]
                });
            });
        </script>
        <script>
            function openNav() {
                document.getElementById("mySidenav").style.width = "225px";
            }

            function closeNav() {
                document.getElementById("mySidenav").style.width = "0";
            }
        </script> 
    </body>
</html>
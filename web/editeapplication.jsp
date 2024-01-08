<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String useraccessname = "";
    String userName = "";
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
        userName = session.getAttribute("useraccessname").toString();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | Edit Digital Membership Form</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
        <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/popper.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="https://hayageek.github.io/jQuery-Upload-File/4.0.11/jquery.uploadfile.min.js"></script>
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: 'eApplnEdit.jsp?action=Edit&rid=<%= request.getParameter("refno")%>',
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#gideonname").val(data.gideonname);
                        $("#auxname").val(data.auxname);
                        $("#memtype").val(data.MTYPE);
                        $("#amemplan").val(data.APLAN);
                        $("#lmemplan").val(data.LPLAN);
                        $("#gfee").val(data.GFEE);
                        $("#afee").val(data.AFEE);
                        $("#mfee").val(data.MFEE);
                        $("#fathername").val(data.FATHERNAME);
                        $("#gdob").val(data.GDOB);
                        $("#gmobile").val(data.GMOBILE);
                        $("#gwmobile").val(data.GWMOBILE);
                        $("#gemail").val(data.GEMAIL);
                        $("#adob").val(data.ADOB);
                        $("#amobile").val(data.AMOBILE);
                        $("#awmobile").val(data.AWMOBILE);
                        $("#aemail").val(data.AEMAIL);
                        $("#gid").val(data.GID);

                        $("#auxprofession").val(data.AUXPROFESSION);
                        $("#addr1").val(data.ADDR1);
                        $("#addr2").val(data.ADDR2);
                        $("#city").val(data.CITY);
                        $("#state").val(data.STATE);
                        $("#pincode").val(data.PINCODE);
                        $("#churchname").val(data.CHURCHNAME);
                        $("#churchaddr").val(data.CHURCHADDR);
                        $("#churchcity").val(data.CHURCHCITY);

                        $("#churchdenomination").val(data.CHURCHDENOINATION);
                        $("#pastorname").val(data.PASTORNAME);
                        $("#pastormobile").val(data.PASTORMOBILE);
                        $("#pastoremail").val(data.PASTOREMAIL);
                        $("#formfilledby").val(data.FORMFILLEDBY);
                        $("#sourceofappln").val(data.SOURCEOFAPPLN);
                        $("#formfilledbyfoname").val(data.FORMFILLEDBYFONAME);
                        $("#formfilledbygideonname").val(data.FORMFILLEDBYGIDEONNAME);
                        $("#formfilledbymid").val(data.FORMFILLEDBYMID);

                        $("#formfilledbycamp").val(data.FORMFILLEDBYCAMP);
                        $("#ref1name").val(data.REF1NAME);
                        $("#ref1phone").val(data.REF1PHONE);
                        $("#ref1camp").val(data.REF1CAMP);
                        $("#ref2name").val(data.REF2NAME);
                        $("#ref2phone").val(data.REF2PHONE);
                        $("#ref2camp").val(data.REF2CAMP);
                        $("#paymethod").val(data.PAYMETHOD);
                        $("#trno").val(data.TRNO);
                        $("#trdate").val(data.TRDATE);

                        $("#trbank").val(data.TRBANK);
                        $("#remarks").val(data.REMARKS);
                        $("#mode_of_application").val(data.MODE_OF_APPLICATION);
                        if (data.S2Q1 === "YES") {
                            $("#s2q1").bootstrapToggle('on');
                        } else {
                            $("#s2q1").bootstrapToggle('off');
                        }
                        if (data.S2Q2 === "YES") {
                            $("#s2q2").bootstrapToggle('on');
                        } else {
                            $("#s2q2").bootstrapToggle('off');
                        }
                        if (data.S2Q3 === "YES") {
                            $("#s2q3").bootstrapToggle('on');
                        } else {
                            $("#s2q3").bootstrapToggle('off');
                        }
                        if (data.S2Q4 === "YES") {
                            $("#s2q4").bootstrapToggle('on');
                        } else {
                            $("#s2q4").bootstrapToggle('off');
                        }
                        if (data.S2Q5 === "YES") {
                            $("#s2q5").bootstrapToggle('on');
                        } else {
                            $("#s2q5").bootstrapToggle('off');
                        }
                        if (data.S2Q6 === "YES") {
                            $("#s2q6").bootstrapToggle('on');
                        } else {
                            $("#s2q6").bootstrapToggle('off');
                        }
                        if (data.S2Q7 === "YES") {
                            $("#s2q7").bootstrapToggle('on');
                        } else {
                            $("#s2q7").bootstrapToggle('off');
                        }
                        if (data.S2Q8 === "YES") {
                            $("#s2q8").bootstrapToggle('on');
                        } else {
                            $("#s2q8").bootstrapToggle('off');
                        }

                        $("#previousmembership").val(data.PREVIOUSMEMBERSHIP);
                        $("#secv98").val(data.SECV);
                        $("#gideonprofession").val(data.GIDEONPROFESSION);
                        $("#workplace").val(data.EDUCATION);
                        $("#worknature").val(data.WORKNATURE);
                        $("#workplace").val(data.WORKPLACE);
                        $("#jobtitle").val(data.JOBTITLE);
                        $("#businessmanq1").val(data.BUSINESSMANQ1);
                        $("#businessname").val(data.BUSINESSNAME);

                        $("#businessnature").val(data.BUSINESSNATURE);
                        $("#businesstitle").val(data.BUSINESSTITLE);
                        $("#maritalstatus").val(data.MARITALSTATUS);
                        $("#spousename").val(data.SPOUSENAME);
                    }
                });
            });
        </script>
        <style>
            .toggle.android .toggle-group label {
                font-size: 11px;
                font-weight: bold;
                height: 5px;
                width: 5px;
            }

            .high {
                background-color: greenyellow;
                color: black;
            }

            .low {
                background-color: #ffb3b3;
                color: black;
            }

            .loading {
                width: 90%;
                margin: 0 auto;
                height: 8px;
                background-color: lightblue;
                position: relative;
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

            @media screen and (max-height: 450px) {
                .sidenav {
                    padding-top: 15px;
                }
                .sidenav a {
                    font-size: 14px;
                }
            }
            .myFont{
                font-size:9px;
            }
            input.largerCheckbox { 
                width: 40px; 
                height: 40px; 
            } 
            .ajax-file-upload-statusbar {
                border: 1px solid #0ba1b5;
                margin-top: 10px;
                width: 420px;
                margin-right: 10px;
                margin: 5px;
                -moz-border-radius: 4px;
                -webkit-border-radius: 4px;
                border-radius: 4px;
                padding: 5px 5px 5px 15px
            }

            .ajax-file-upload-filename {
                width: 300px;
                height: auto;
                margin: 0 5px 5px 0px;

            }

            .ajax-file-upload-filesize {
                width: 50px;
                height: auto;
                margin: 0 5px 5px 0px;
                display: inline-block;
                vertical-align:middle;
            }
            .ajax-file-upload-progress {
                margin: 5px 10px 5px 0px;
                position: relative;
                width: 250px;
                border: 1px solid #ddd;
                padding: 1px;
                border-radius: 3px;
                display: inline-block;
                color:#FFFFFF;

            }
            .ajax-file-upload-bar {
                background-color: #0ba1b5;
                width: 0;
                height: 20px;
                border-radius: 3px;
                color:#FFFFFF;

            }
            .ajax-file-upload-percent {
                position: absolute;
                display: inline-block;
                top: 3px;
                left: 48%
            }
            .ajax-file-upload-red {
                -moz-box-shadow: inset 0 39px 0 -24px #e67a73;
                -webkit-box-shadow: inset 0 39px 0 -24px #e67a73;
                box-shadow: inset 0 39px 0 -24px #e67a73;
                background-color: #e4685d;
                -moz-border-radius: 4px;
                -webkit-border-radius: 4px;
                border-radius: 4px;
                display: inline-block;
                color: #fff;
                font-family: arial;
                font-size: 13px;
                font-weight: normal;
                padding: 4px 15px;
                text-decoration: none;
                text-shadow: 0 1px 0 #b23e35;
                cursor: pointer;
                vertical-align: top;
                margin: 5px 10px 5px 0px;
            }
            .ajax-file-upload-green {
                background-color: #77b55a;
                -moz-border-radius: 4px;
                -webkit-border-radius: 4px;
                border-radius: 4px;
                margin: 0;
                padding: 0;
                display: inline-block;
                color: #fff;
                font-family: arial;
                font-size: 13px;
                font-weight: normal;
                padding: 4px 15px;
                text-decoration: none;
                cursor: pointer;
                text-shadow: 0 1px 0 #5b8a3c;
                vertical-align: top;
                margin: 5px 10px 5px 0px;
            }
            .ajax-file-upload {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 16px;
                font-weight: bold;
                padding: 15px 20px;
                cursor:pointer;
                line-height:20px;
                height:25px;
                margin:0 10px 10px 0;
                display: inline-block;
                background: #fff;
                border: 1px solid #e8e8e8;
                color: #888;
                text-decoration: none;
                border-radius: 3px;
                -webkit-border-radius: 3px;
                -moz-border-radius: 3px;
                -moz-box-shadow: 0 2px 0 0 #e8e8e8;
                -webkit-box-shadow: 0 2px 0 0 #e8e8e8;
                box-shadow: 0 2px 0 0 #e8e8e8;
                padding: 6px 10px 4px 10px;
                color: #fff;
                background: #2f8ab9;
                border: none;
                -moz-box-shadow: 0 2px 0 0 #13648d;
                -webkit-box-shadow: 0 2px 0 0 #13648d;
                box-shadow: 0 2px 0 0 #13648d;
                vertical-align: middle;
            }

            .ajax-file-upload:hover {
                background: #3396c9;
                -moz-box-shadow: 0 2px 0 0 #15719f;
                -webkit-box-shadow: 0 2px 0 0 #15719f;
                box-shadow: 0 2px 0 0 #15719f;
            }

            .ajax-upload-dragdrop
            {

                border:2px dotted #A5A5C7;
                width:420px;
                color: #DADCE3;
                text-align:left;
                vertical-align:middle;
                padding:10px 10px 0px 10px;
            }

            .state-hover
            {
                border:2px solid #A5A5C7;
            }
            .ajax-file-upload-container
            {
                margin:20px 0px 20px 0px;
            }
        </style>
        <style>
            body {
                font: 400 15px Lato, sans-serif;
                line-height: 1.8;
                color: #818181;
            }

            h2 {
                font-size: 22px;
                text-transform: uppercase;
                color: #fff;
                font-weight: 400;
                margin-bottom: 10px;
            }

            h3 {
                font-size: 18px;
                text-transform: initial;
                color: #fff;
                font-weight: 300;
                margin-bottom: 15px;
            }

            h4 {
                font-size: 19px;
                line-height: 1.375em;
                color: #428bca;
                font-weight: 300;
                margin-bottom: 20px;
            }

            h5 {
                font-size: 18px;
                text-transform: initial;
                color: #428bca;
                font-weight: 300;
                margin-bottom: 15px;
            }

            h6 {
                font-size: 20px;
                text-transform: initial;
                color: #428bca;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .jumbotron {
                background-color: #428bca;
                color: #fff;
                padding: 15px 25px;
                font-family: Montserrat, sans-serif;
            }

            .container-fluid {
                padding-left: 10px;
                padding-right: 10px;
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

            .carousel-control.right,
            .carousel-control.left {
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
                border-radius: 3px !important;
                transition: box-shadow 0.3s;
            }

            .panel:hover {
                box-shadow: 5px 0px 30px rgba(0, 0, 0, .2);
            }

            .panel-footer .btn:hover {
                border: 1px solid #ffe114;
                background-color: #fff !important;
                color: #428bca;
            }

            .panel-heading {
                background: #00F260;
                background: -webkit-linear-gradient(to right, #0575E6, #00F260);
                background: linear-gradient(to right, #0575E6, #00F260);
                text-align: center;
                font-weight: bold;
                color: #fff !important;
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

            .navbar {
                margin-bottom: 0;
                background-color: #01354a;
                z-index: 9999;
                border: 0;
                font-size: 12px !important;
                line-height: 1.42857143 !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;
            }

            .navbar-brand {
                margin-top: 0;
                margin-bottom: 0;
                background-color: #01354a;
                z-index: 9999;
                border: 0;
                font-size: 28px !important;
                letter-spacing: 4px;
                border-radius: 0;
                font-family: Montserrat, sans-serif;
                cursor: pointer;
                vertical-align: middle;
            }

            .navbar li a,
            .navbar .navbar-brand {
                color: #ffe114 !important;
            }

            .navbar-nav li a:hover {
                color: #01354a !important;
                background-color: #ffe114 !important;
            }

            .navbar-nav li.active a {
                color: #01354a !important;
                background-color: #ffe114 !important;
            }

            .navbar-default .navbar-toggle {
                border-color: transparent;
                color: #fff !important;
            }

            .slideanim {
                visibility: hidden;
            }

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

            @media screen and (max-width: 768px) {
                .col-sm-4 {
                    text-align: center;
                    margin: 25px 0;
                }
                .btn-lg {
                    width: 100%;
                    margin-bottom: 35px;
                }
            }

            @media screen and (max-width: 480px) {
                .logo {
                    font-size: 150px;
                }
            }
            /* ------------------------------------------------------------------------ Banners */

            .Banner {
                padding-bottom: 2%;
                background-color: #1765b4;
                position: relative;
            }

            .BannerImage {
                background-repeat: no-repeat;
                position: absolute;
                display: block;
                width: 100%;
                overflow: hidden;
            }

            .ImageBanner .BannerImage {
                background-position: 25% 0;
                background-size: 175%;
                padding-bottom: 70%;
            }

            .VideoBanner .BannerImage {
                background-position: center top;
                background-size: 128%;
                padding-bottom: 100%;
            }

            .GCPBanner {
                background-image: url(../images/banner-video-gcp.jpg);
            }

            .BannerText {
                padding: 88% 0 5% 0;
                text-align: center;
            }

            .VideoBanner .BannerText {
                padding-top: 92%;
            }

            .Banner h1 {
                color: #fff;
            }

            .Banner h3 {
                color: #d2ab67;
            }

            .Banner h3.Title {
                color: #fff;
                padding-top: 0;
            }

            .Banner .Title:hover {
                color: #ffe114;
            }

            .Banner .More {
                font-size: 1.125em;
                color: #d2ab67;
                padding: 0;
            }

            .Banner .More:hover {
                color: #ffe114;
            }

            .Banner .More:before {
                display: none;
            }

            .Banner .PlayButton {
                position: relative;
                margin: 0.375em auto 1em auto;
                width: 5em;
                height: 0;
                padding-bottom: 5em;
                display: block;
                text-align: center;
                text-decoration: none;
            }

            .Banner .PlayButton:after {
                position: absolute;
                top: .075em;
                left: 50%;
                margin-left: -.5em;
                content: "\E809";
                color: #d2ab67;
                font: normal 5em/.9 "fontello";
                display: block;
                -webkit-transition: all 0.5s;
                -moz-transition: all 0.5s;
                -o-transition: all 0.5s;
                transition: all 0.5s;
            }

            .Banner .PlayButton:hover:after {
                opacity: 1;
                -webkit-transform: scale(1.25);
                -moz-transform: scale(1.25);
                -o-transform: scale(1.5);
                transform: scale(1.25);
            }

            @media (max-width:40em) and (min-width:0) {
                .Banner .Button {
                    margin: 0.25em auto 1em auto;
                    background: #d2ab67;
                    color: #193f66;
                }
                .Banner .Button:hover,
                .Banner .Button:focus {
                    background: #ffe114;
                    outline: none;
                }
            }

            @media only screen and (min-width: 40em) {
                .Banner {
                    height: 25em;
                    padding-bottom: 0;
                }
                .BannerImage,
                .ImageBanner .BannerImage,
                .VideoBanner .BannerImage {
                    background-size: cover;
                    height: 25em;
                    padding-bottom: 0;
                    -webkit-animation: saturate 3s ease;
                    -moz-animation: saturate 3s ease;
                    -o-animation: saturate 3s ease;
                    animation: saturate 3s ease;
                }
                .ImageBanner .BannerImage:before {
                    content: '';
                    position: absolute;
                    top: 0;
                    left: 0;
                    width: 100%;
                    height: 100%;
                    /* IE9 SVG, needs conditional override of 'filter' to 'none' */
                    background: -moz-linear-gradient(left, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 25%, rgba(17, 17, 17, 0.8) 100%);
                    /* FF3.6+ */
                    background: -webkit-gradient(linear, left top, right top, color-stop(0%, rgba(17, 17, 17, 0)), color-stop(25%, rgba(17, 17, 17, 0)), color-stop(100%, rgba(17, 17, 17, 0.8)));
                    /* Chrome,Safari4+ */
                    background: -webkit-linear-gradient(left, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 25%, rgba(17, 17, 17, 0.8) 100%);
                    /* Chrome10+,Safari5.1+ */
                    background: -o-linear-gradient(left, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 25%, rgba(17, 17, 17, 0.8) 100%);
                    /* Opera 11.10+ */
                    background: -ms-linear-gradient(left, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 25%, rgba(17, 17, 17, 0.8) 100%);
                    /* IE10+ */
                    background: linear-gradient(to right, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 25%, rgba(17, 17, 17, 0.8) 100%);
                    /* W3C */
                    filter: progid DXImageTransform.Microsoft.gradient( startColorstr='#00111111', endColorstr='#cc111111', GradientType=1);
                    /* IE6-8 */
                }
                .Banner .Wrapper {
                    /* http://css-tricks.com/centering-in-the-unknown/ */
                    padding-top: 0;
                    height: 100%;
                    position: relative;
                }
                .Banner .Wrapper:before {
                    content: '';
                    display: inline-block;
                    height: 100%;
                    vertical-align: middle;
                    margin-right: -0.25em;
                    /* Adjusts for spacing */
                }
                .BannerText {
                    /* pseudo element to help vertically center text */
                    display: inline-block;
                    vertical-align: middle;
                    width: 99.25%;
                    padding: 0;
                }
                .ImageBanner .BannerText {
                    width: 65.5%;
                    margin-top: -17%;
                    margin-left: 34%;
                    text-align: right;
                    font-size: 1.25em;
                }
                .VideoBanner .BannerText {
                    padding-top: 0;
                }
                .French .ImageBanner .BannerText {
                    font-size: 0.875em;
                }
                .Banner h3 {
                    color: #ffe114;
                }
                .Banner h3.Title {
                    padding-bottom: .75em;
                }
                .Banner .More {
                    font-size: 1.25em;
                    position: relative;
                    padding-right: 1.5em;
                    -webkit-transition: padding-right 0.3s;
                    -moz-transition: padding-right 0.3s;
                    -o-transition: padding-right 0.3s;
                    transition: padding-right 0.3s;
                }
                .Banner .More:after {
                    position: absolute;
                    top: 0.3em;
                    width: 1.25em;
                    height: 1.25em;
                    right: 0;
                    padding: .45em 0 0 .025em;
                    content: "\E80B";
                    color: #ffe114;
                    font: normal 1em/0 "fontello";
                    text-align: center;
                    -webkit-transition: color 0.5s;
                    -moz-transition: color 0.5s;
                    -o-transition: color 0.5s;
                    transition: color 0.5s;
                }
                .Banner .More:hover {
                    padding-right: 1.75em;
                }
                .Banner .More:hover:after {
                    color: #ffe114;
                }
                .Banner .Button {
                    float: right;
                    margin: .75em 0 0 0;
                }
                .Banner .PlayButton {
                    margin: 1em auto 0 auto;
                    width: 7.5em;
                    padding-bottom: 7.5em;
                }
                .Banner .PlayButton:after {
                    color: #2185eb;
                    font-size: 120px/*7.5em*/
                        ;
                    opacity: .8;
                }
            }

            @media only screen and (min-width: 60em) {
                .ImageBanner.Banner {
                    height: 35.25em;
                }
                .ImageBanner .BannerImage {
                    height: 35.25em;
                }
                .VideoBanner.Banner {
                    height: 45em;
                }
                .VideoBanner .BannerImage {
                    height: 45em;
                }
                .ImageBanner .BannerImage:before {
                    /* IE9 SVG, needs conditional override of 'filter' to 'none' */
                    background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIxMDAlIiB5Mj0iMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzExMTExMSIgc3RvcC1vcGFjaXR5PSIwIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjUwJSIgc3RvcC1jb2xvcj0iIzExMTExMSIgc3RvcC1vcGFjaXR5PSIwIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMxMTExMTEiIHN0b3Atb3BhY2l0eT0iMC44Ii8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
                    background: -moz-linear-gradient(left, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 50%, rgba(17, 17, 17, 0.8) 100%);
                    /* FF3.6+ */
                    background: -webkit-gradient(linear, left top, right top, color-stop(0%, rgba(17, 17, 17, 0)), color-stop(50%, rgba(17, 17, 17, 0)), color-stop(100%, rgba(17, 17, 17, 0.8)));
                    /* Chrome,Safari4+ */
                    background: -webkit-linear-gradient(left, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 50%, rgba(17, 17, 17, 0.8) 100%);
                    /* Chrome10+,Safari5.1+ */
                    background: -o-linear-gradient(left, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 50%, rgba(17, 17, 17, 0.8) 100%);
                    /* Opera 11.10+ */
                    background: -ms-linear-gradient(left, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 50%, rgba(17, 17, 17, 0.8) 100%);
                    /* IE10+ */
                    background: linear-gradient(to right, rgba(17, 17, 17, 0) 0%, rgba(17, 17, 17, 0) 50%, rgba(17, 17, 17, 0.8) 100%);
                    /* W3C */
                    filter: progid DXImageTransform.Microsoft.gradient( startColorstr='#00111111', endColorstr='#cc111111', GradientType=1);
                    /* IE6-8 */
                }
                .French .ImageBanner .BannerText {
                    font-size: 2em;
                }
                .Banner .More {
                    font-size: 1em;
                    /*24px*/
                }
                .Banner .More:after {
                    top: 0.2em;
                }
                .French .Banner .More {
                    font-size: 1.25em;
                    /*24px*/
                }
                .French .Banner .More:after {
                    top: 0.3em;
                }
                .Banner .PlayButton {
                    margin-top: 3em;
                    width: 8.5em;
                    padding-bottom: 8.5em;
                }
                .Banner .PlayButton:after {
                    font-size: 128px/*8em*/
                        ;
                }
            }

            .Spotlight {
                color: #1765b4;
            }

            .Listing,
            .LargeListing {
                text-align: center;
            }

            .Listing .Wrapper .CF {
                margin-bottom: 1em;
            }

            .CF:before,
            .CF:after {
                content: "";
                display: table;
            }

            .CF:after {
                clear: both;
            }

            .CF {
                *zoom: 1;
            }

            .Clear {
                clear: both;
            }

            .Button {
                color: #fff;
                text-transform: uppercase;
                text-decoration: none;
                text-align: center;
                font: normal 1.25em/1.4 'oswaldlight', Arial, Helvetica, sans-serif;
                display: inline-block;
                zoom: 1;
                *display: inline;
                border: none;
                background: #1765b4;
                height: auto;
                width: auto;
                margin: .5em 0;
                padding: 0.5em 1.5em;
                border-radius: 0.25em;
                cursor: pointer;
                -webkit-transition: all 0.5s;
                -moz-transition: all 0.5s;
                -o-transition: all 0.5s;
                transition: all 0.5s;
            }

            .Button:hover,
            .Button:focus {
                color: #fff;
                background: #2185eb;
                outline: none;
            }

            .ButtonGroup .Button,
            .ButtonGroup .More {
                margin: .5em 1.5em;
            }

            .Button.CompletedCampaign {
                background: #222;
                cursor: auto;
            }

            .Button.Gold {
                background: #d2ab67;
                color: #1765b4;
            }

            .Button.Gold:hover,
            .Button.Gold:focus {
                color: #1765b4;
                background: #e0b874;
                outline: none;
            }

            #events {
                margin-bottom: 1em;
                padding: 1em;
                background-color: #f6f6f6;
                border: 1px solid #999;
                border-radius: 3px;
                height: 100px;
                overflow: auto;
            }

            .select2-selection {
                height: 34px !important;
                overflow: hidden;
                font-size: 12px;
                padding: 3px;
            }

            .select2-selection__rendered {
                font-size: 12px;
                white-space: normal;
                word-break: break-all;
            }
        </style>
        <script>
            function submitForm() {
                document.forms["frm_apply"].submit();
            }
        </script>
        <script type='text/javascript' src='js/loadImg.js'></script>
        <script type='text/javascript'>
            $(function () {
                $('img').imgPreload();
            })
        </script>
        <script>
            //paste this code under head tag or in a seperate js file.
            // Wait for window load
            $(window).load(function () {
                // Animate loader off screen
                $(".se-pre-con").fadeOut("slow");
                ;
            });
        </script>
        <style type="text/css">
            /* Paste this css to your style sheet file or under head tag */
            /* This only works with JavaScript, 
                if it's not present, don't show loader */

            .no-js #loader {
                display: none;
            }

            .js #loader {
                display: block;
                position: absolute;
                left: 100px;
                top: 0;
            }

            .se-pre-con {
                position: fixed;
                left: 0px;
                top: 0px;
                width: 100%;
                height: 100%;
                z-index: 9999;
                background: url(./images/Preloader_3.gif) center no-repeat #fff;
            }
        </style>
    </head>

    <body id="myContainer" style="background-color: #fff; width: 100%;">
        <div id="loader" class="se-pre-con"></div>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <a href="#"><img alt="The Gideons International" src="https://pg.gideons.org.in/images/GideonsLogo2.png" align="left" height="50" width="180" style="padding: 5px;" /></a>
            </div>
        </nav>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid" id="eFormDiv">
                <form role="form" name="frm_apply" id="frm_apply" class="application-form" action="eFormack.jsp" onsubmit="return submitForm();">
                    <div class='panel panel-default panel-accent-gold'>
                        <div class="panel-heading">
                            <h3 class="panel-title" style="letter-spacing: 3px;">DIGITAL MEMBERSHIP FORM &nbsp;#<%= request.getParameter("refno")%></h3>
                        </div>
                        <div class="panel-body" style="padding-top: 20px; width: 100%; font-size: 12px;">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group col-md-2">
                                        <label for="previousmembership" style="font-size: 13px; font-weight: bold; color: brown">Mode of Application</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-list"></span>
                                            </span>
                                            <select name="mode_of_application" id="mode_of_application" class="form-control" style="font-size: 12px;" required>
                                                <option value="0">-- Select --</option>
                                                <option value="Digital" selected>Digital Form</option>
                                                <option value="Physical">Physical Application Form</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label for="previousmembership" style="font-size: 13px; font-weight: bold; color: brown">Have you held previous Gideon / Auxiliary membership? *</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-list"></span>
                                            </span>
                                            <select name="previousmembership" id="previousmembership" class="form-control" onchange="previousmembershipchange()" style="font-size: 12px;" required>
                                                <option value="0">-- Select --</option>
                                                <option value="Yes">Yes, I held Membership with The Gideons International in India</option>
                                                <option value="No">No, First time Applicant</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6" id="secv98div">
                                        <label for="secv98" style="font-size: 13px; font-weight: bold; color: brown">Does your business/profession involve manufacture or sale of tobacco or alcohol ? *</label>
                                        <div class='input-group'>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-list"></span>
                                            </span>
                                            <select name="secv98" id="secv98" class="form-control" onchange="secv987()" style="font-size: 12px;" required>
                                                <option value="0">-- Select --</option>
                                                <option value="Yes">YES, my business/profession involve manufacture or sale of Tobacco or Alcohol</option>
                                                <option value="No">NOT involved in manufacture or sale of Tobacco or Alcohol</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div id="completeform">
                                <fieldset class="form-group">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; color: brown">Membership Plan</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-4">
                                                <label for="memtype">Membership Type *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="memtype" id="memtype" class="form-control" onchange="memtypechange()" style="font-size: 12px;" required>
                                                        <option value="Annual" selected> Annual Membership </option>
                                                        <option value="Life Opted"> Life Membership </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4" id="amemplan1">
                                                <label for="amemplan">Annual Plan *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="amemplan" id="amemplan" class="form-control" onchange="annualplanchange()" style="font-size: 12px;" required>
                                                        <option value="0">- Select -</option>
                                                        <option value="Annual Both"> Gideon &amp; Auxiliary Both</option>
                                                        <option value="Annual Gideon"> Gideon </option>
                                                        <option value="Annual Auxiliary"> Auxiliary </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4" id="lmemplan1">
                                                <label for="lmemplan">Life Plan *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="lmemplan" id="lmemplan" class="form-control" onchange="lifeplanchange()" style="font-size: 12px;" required>
                                                        <option value="0">- Select -</option>
                                                        <option value="Life Both"> Gideon &amp; Auxiliary Both </option>
                                                        <option value="Life Gideon"> Gideon </option>
                                                        <option value="Life Auxiliary"> Auxiliary </option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <table class="table table-bordered table-responsive table-hover" style="width: 100%; font-size: 12px;" id="theTable">
                                    <thead style="background-color: #01354a; color: #ffe114;">
                                        <tr>
                                            <th style="text-align: left;" nowrap>&nbsp; Prospective Member Name *</th>
                                            <th style="text-align: center;" nowrap>&nbsp; Fee &nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr id="gname">
                                            <td>
                                                <input name="gideonname" class="form-control" id="gideonname" placeholder="..type Gideon Name here" style="font-size: 13px;" autocomplete="off">
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="gfee" id="gfee" style="text-align: center; background-color: #fff; padding: 0px;" readonly>
                                                <input type="hidden" name="gfeeamount" id="gfeeamount">
                                            </td>
                                        </tr>
                                        <tr id="aname">
                                            <td><input name="auxname" class="form-control" id="auxname" placeholder="..type Auxiliary Name here" style="font-size: 13px;" autocomplete="off"></td>
                                            <td>
                                                <input type="text" class="form-control" name="afee" id="afee" style="text-align: center; background-color: #fff; padding: 0px;" readonly>
                                                <input type="hidden" name="afeeamount" id="afeeamount">
                                            </td>
                                        </tr>
                                        <tr id="tcol" style="background-color: #f5f5f5; color: navy; font-weight: bold; font-size: 13px;">
                                            <td style="width: 80%; text-align: right;">Total Amount&nbsp;</td>
                                            <td style="width: 20%;">
                                                <input type="text" class="form-control" name="mfee" id="mfee" readonly style="text-align: center; background-color: #fff; padding: 0px;">
                                                <input type="hidden" name="amount" id="amount">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>

                                <fieldset class="form-group" id="ginfo" style="background-color: rgb(224, 248, 247);">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; height: 30px;">Gideon Information</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-3">
                                                <label for="trno">Father Name *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="fathername" id="fathername" style="font-size: 12px;" placeholder="..Father name" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="trno">Date of Birth *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="gdob" id="gdob" style="font-size: 12px;" maxlength="10" placeholder="..DD/MM/YYYY" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="trno">Mobile *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-phone"></span>
                                                    </span>
                                                    <input inputmode="numeric" class="form-control" name="gmobile" id="gmobile" style="font-size: 12px;" maxlength="10" placeholder="..10 digits" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="trno">WhatsApp</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-phone"></span>
                                                    </span>
                                                    <input inputmode="numeric" class="form-control" name="gwmobile" id="gwmobile" style="font-size: 12px;" maxlength="10" placeholder="..10 digits" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="trno">Email *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-envelope"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="gemail" id="gemail" style="font-size: 12px;" placeholder="..Email Address" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="lmemplan">Occupation *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="gideonprofession" id="gideonprofession" class="form-control" onchange="OccupationSelect()" style="font-size: 12px;" required>
                                                        <option value="0">- Select -</option>
                                                        <option value="Employed">Professional / Employed</option>
                                                        <option value="Businessman">Businessman</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="form-group col-md-12" style="text-align:justify;">I am applying for membership in The Gideons International in India on the basis of my occupation (or that from which I retired) and from which my primary income is derived.</div>

                                            <div class="form-group col-md-3" id="educationdiv">
                                                <label for="lmemplan">Educational Qualification *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="education" id="education" class="form-control" style="font-size: 12px;" required>
                                                        <option value="0">- Select -</option>
                                                        <option value="SSLC">SSLC</option>
                                                        <option value="HSC">HSC</option>
                                                        <option value="UG">Under Graduate</option>   
                                                        <option value="Graduate">Graduate</option>                                             
                                                        <option value="PG">Post Graduate</option>
                                                        <option value="PHD">PhD</option>                                                
                                                        <option value="MBBS">MBBS</option>
                                                        <option value="NA">NA</option>
                                                        <option value="Others">Others</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="worknaturediv">
                                                <label for="lmemplan">Nature of Work *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="worknature" id="worknature" class="form-control" style="font-size: 12px;" required>
                                                        <option value="0">- Select -</option>
                                                        <option>Engineer</option>
                                                        <option>Doctor</option>
                                                        <option>Business Manager</option>
                                                        <option>Teacher/Lecturer/Principal</option>
                                                        <option>Lawyer/Judge</option>
                                                        <option>Paramedical Officer/Medical Technician</option>
                                                        <option>Government Officer/Staff</option>
                                                        <option>Armed Forces Officer</option>
                                                        <option>Airline Caption</option>
                                                        <option>Technical Specialist/Scientist</option>
                                                        <option>Police/Fire Officer</option>
                                                        <option value="NA">NA</option>
                                                        <option value="Others">Others</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="workplacediv">
                                                <label for="trno">Place of Work *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="workplace" id="workplace" style="font-size: 12px;" placeholder="..Place of Work" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="jobtitlediv">
                                                <label for="trno">Job Title/Designation *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="jobtitle" id="jobtitle" style="font-size: 12px;" placeholder="..Job Title/Designation" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4" id="businessmanq1div">
                                                <label for="lmemplan">Do you have more than 2 employees reporting to you ? *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="businessmanq1" id="businessmanq1" class="form-control" style="font-size: 12px;" required>
                                                        <option value="0">- Select -</option>
                                                        <option value="Yes">Yes</option>
                                                        <option value="No">No</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4" id="businessnamediv">
                                                <label for="trno">Name of Business *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="businessname" id="businessname" style="font-size: 12px;" placeholder="..Name of Business" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4" id="businessnaturediv">
                                                <label for="trno">Nature of Business *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="businessnature" id="businessnature" style="font-size: 12px;" placeholder="..Name of Business" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6" id="businesstitlediv">
                                                <label for="trno">Business Title *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="businesstitle" id="businesstitle" style="font-size: 12px;" placeholder="..Name of Business" autocomplete="off" />
                                                </div>
                                            </div>

                                            <div class="form-group col-md-3" id="marital_status">
                                                <label for="camp">Marital Status *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-user"></span>
                                                    </span>
                                                    <select name="maritalstatus" id="maritalstatus" class="form-control" onchange="maritalStatus()" style="font-size: 12px;" required>
                                                        <option value="0">-- Select --</option>
                                                        <option value="Married">Married</option>
                                                        <option value="Unmarried">Unmarried</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="spousenamediv">
                                                <label for="trno">If yes, Spouse name *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="spousename" id="spousename" style="font-size: 12px;" placeholder="..Name of Spouse" autocomplete="off" />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="gidUpload" hidden>
                                    <legend class="col-md-3 col-form-label pt-0" style="font-size: 13px; font-weight: bold; color: brown; background-color: yellow;">Gideon Photograph &amp; Signature</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <form method="post">
                                                <div class="form-group col-md-3">
                                                    <div class='input-group'>
                                                        <input name="sId" id="sId" type="hidden">
                                                        <input name="gideonphotofileuploadstatus" id="gideonphotofileuploadstatus" type="hidden">
                                                        <div id="gideonphotouploader">Upload Photograph</div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="col-md-12">
                                            <form method="post">
                                                <div class="form-group col-md-3">
                                                    <div class='input-group'>
                                                        <input name="gideonsignfileuploadstatus" id="gideonsignfileuploadstatus" type="hidden">
                                                        <div id="gideonsignuploader">Upload Signature</div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="ainfo" style="background-color: rgb(248, 224, 224);">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; height:30px;">Auxiliary Information</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-12" style="text-align:justify;">Objective : The objective of the Auxiliary shall be to assist The Gideons in carrying out their single objective of winning others for the Lord Jesus Christ, and to promote the spiritual life of its members.
                                                <br>Our Ministry : The ministry of the Auxiliary is prayer, personal witnessing for the Lord Jesus Christ and distributing God's Holy Word to those in the medical profession and supportive medical services.</div>    

                                            <div class="form-group col-md-2" id="gidid">
                                                <label for="trno">Gideon Membership ID *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="gid" id="gid" style="font-size: 12px;" maxlength="6" placeholder="..Gideon ID" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="trno">Date of Birth *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="adob" id="adob" style="font-size: 12px;" maxlength="10" placeholder="..DD/MM/YYYY" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="trno">Mobile *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-phone"></span>
                                                    </span>
                                                    <input inputmode="numeric" class="form-control" name="amobile" id="amobile" style="font-size: 12px;" maxlength="10" placeholder="..10 digits" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="trno">WhatsApp</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-phone"></span>
                                                    </span>
                                                    <input inputmode="numeric" class="form-control" name="awmobile" id="awmobile" style="font-size: 12px;" maxlength="10" placeholder="..10 digits" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="trno">Email</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-envelope"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="aemail" id="aemail" style="font-size: 12px;" placeholder="..Email Address" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="lmemplan">Profession</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="auxprofession" id="auxprofession" class="form-control" style="font-size: 12px;" required>
                                                        <option value="0">- Select -</option>
                                                        <option>House Wife</option>
                                                        <option>Engineer</option>
                                                        <option>Doctor</option>
                                                        <option>Business Manager</option>
                                                        <option>Teacher/Lecturer/Principal</option>
                                                        <option>Lawyer/Judge</option>
                                                        <option>Paramedical Officer/Medical Technician</option>
                                                        <option>Government Officer/Staff</option>
                                                        <option>Armed Forces Officer</option>
                                                        <option>Airline Caption</option>
                                                        <option>Technical Specialist/Scientist</option>
                                                        <option>Police/Fire Officer</option>
                                                        <option value="NA">NA</option>
                                                        <option>Others</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="auxUpload" hidden>
                                    <legend class="col-md-3 col-form-label pt-0" style="font-size: 13px; font-weight: bold; color: brown; background-color: yellow;">Auxiliary Photograph &amp; Signature</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <form method="post">
                                                <div class="form-group col-md-3">
                                                    <div class='input-group'>
                                                        <input name="auxphotofileuploadstatus" id="auxphotofileuploadstatus" type="hidden">
                                                        <div id="auxphotouploader">Upload Photograph</div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="col-md-12">
                                            <form method="post">
                                                <div class="form-group col-md-3">
                                                    <div class='input-group'>
                                                        <input name="auxsignfileuploadstatus" id="auxsignfileuploadstatus" type="hidden">
                                                        <div id="auxsignuploader">Upload Signature</div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="addinfo" style="background-color: rgb(246, 248, 224);">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; height: 30px;">Address for Communication</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-4">
                                                <label for="trno">Address Line 1*</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="addr1" id="addr1" style="font-size: 12px;" placeholder="..Address line 1" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="trno">Address Line 2</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="addr2" id="addr2" style="font-size: 12px;" placeholder="..Address line 2" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="trno">City *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="city" id="city" style="font-size: 12px;" placeholder="..City name" autocomplete="off" required/>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4">
                                                <label for="trno">State *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <select class="form-control" name="state" id="state" style="font-size: 12px;" required>
                                                        <option value="0">-- Select State --</option>
                                                        <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>
                                                        <option value="Andhra Pradesh">Andhra Pradesh </option>
                                                        <option value="Arunachal Pradesh">Arunachal Pradesh </option>
                                                        <option value="Assam">Assam</option>
                                                        <option value="Bihar">Bihar</option>
                                                        <option value="Chandigarh">Chandigarh</option>
                                                        <option value="Chhattisgarh">Chhattisgarh</option>
                                                        <option value="Dadra and Nagar Haveli">Dadra and Nagar Haveli</option>
                                                        <option value="Daman and Diu">Daman and Diu</option>
                                                        <option value="Delhi">Delhi</option>
                                                        <option value="Goa">Goa</option>
                                                        <option value="Gujarat">Gujarat</option>
                                                        <option value="Haryana">Haryana</option>
                                                        <option value="Himachal Pradesh">Himachal Pradesh</option>
                                                        <option value="Jammu and Kashmir">Jammu and Kashmir</option>
                                                        <option value="Jharkhand">Jharkhand</option>
                                                        <option value="Karnataka">Karnataka</option>
                                                        <option value="Kerala">Kerala</option>
                                                        <option value="Lakshadweep">Lakshadweep</option>
                                                        <option value="Madhya Pradesh">Madhya Pradesh</option>
                                                        <option value="Maharashtra">Maharashtra</option>
                                                        <option value="Manipur">Manipur</option>
                                                        <option value="Meghalaya">Meghalaya</option>
                                                        <option value="Mizoram">Mizoram</option>
                                                        <option value="Nagaland">Nagaland</option>
                                                        <option value="Orissa">Orissa</option>
                                                        <option value="Puducherry">Puducherry</option>
                                                        <option value="Punjab">Punjab</option>
                                                        <option value="Rajasthan">Rajasthan</option>
                                                        <option value="Sikkim">Sikkim</option>
                                                        <option value="Tamil Nadu">Tamil Nadu</option>
                                                        <option value="Telangana">Telangana</option>
                                                        <option value="Tripura">Tripura</option>
                                                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                                                        <option value="Uttarakhand">Uttarakhand</option>
                                                        <option value="West Bengal">West Bengal</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2">
                                                <label for="trno">Pincode *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input inputmode="numeric" class="form-control" name="pincode" id="pincode" maxlength="6" style="font-size: 12px;" placeholder="..Pincode" autocomplete="off" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="table table-responsive" style="vertical-align: middle; font-size: 11px;">
                                        <table class="table table-responsive" border="0" id="spritual">
                                            <thead style="background-color: #01354a; color: #ffe114; vertical-align: middle;">
                                                <tr>
                                                    <th style="text-align: left;">
                                                        <font style=" font-size: 13px; font-weight: bold; color: #fff;"> Section II : Spiritual Information (select Yes/No) *</font>
                                                    </th>
                                                    <th style="text-align: center;">
                                                        <font style=" font-size: 13px; font-weight: bold; color: #fff;">Response</font>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tr style="background-color: #fcfdfd;">
                                                <td style="text-align: left;"><b>A.</b> Do you believe the Bible is the inspired, infallible and inerrant Word of God? (II Timothy 3:16) *
                                                </td>
                                                <td style="text-align: center;"><input type="checkbox" name="s2q1" id="s2q1" data-toggle="toggle" data-style="android" data-on="Yes" data-off="-" data-onstyle="success" data-offstyle="danger"></td>

                                            </tr>
                                            <tr style="background-color: #fff;">
                                                <td style="text-align: left;"> Do you believe in the Lord Jesus Christ  as the eternal Son of God? (John 3:16) *
                                                </td>
                                                <td style="text-align: center;"><input type="checkbox" name="s2q2" id="s2q2" data-toggle="toggle" data-style="android" data-on="Yes" data-off="-" data-onstyle="success" data-offstyle="danger"></td>

                                            </tr>

                                            <tr style="background-color: #fff;">
                                                <td style="text-align: left;"> Have you received Him as a  personal Saviour? (Romans 10:9) *
                                                </td>
                                                <td style="text-align: center;"><input type="checkbox" name="s2q3" id="s2q3" data-toggle="toggle" data-style="android" data-on="Yes" data-off="-" data-onstyle="success" data-offstyle="danger"></td>

                                            </tr>

                                            <tr style="background-color: #fff;">
                                                <td style="text-align: left;"> Do you endeavor to follow Him  in your daily life? (Romans 12:1-2) *
                                                </td>
                                                <td style="text-align: center;"><input type="checkbox" name="s2q4" id="s2q4" data-toggle="toggle" data-style="android" data-on="Yes" data-off="-" data-onstyle="success" data-offstyle="danger"></td>

                                            </tr>
                                            <tr style="background-color: #fff;">
                                                <td style="text-align: left;"> Do you believe in the endless lake  of fire for the unsaved? (Rev 20:10-15) *
                                                </td>
                                                <td style="text-align: center;"><input type="checkbox" name="s2q5" id="s2q5" data-toggle="toggle" data-style="android" data-on="Yes" data-off="-" data-onstyle="success" data-offstyle="danger"></td>

                                            </tr>
                                            <tr style="background-color: #fff;">
                                                <td style="text-align: left;"> Do you believe in the Biblical way of marriage  between one man and one woman? (Genesis 2:24) *</td>
                                                <td style="text-align: center;"><input type="checkbox" name="s2q6" id="s2q6" data-toggle="toggle" data-style="android" data-on="Yes" data-off="-" data-onstyle="success" data-offstyle="danger"></td>

                                            </tr>
                                            <tr style="background-color: #fff;">
                                                <td style="text-align: left;"><b>B.</b> Are you a layman, NOT a clergyman? (Note: clergyman means one who is generally accepted<br>and recognized as a practicing clergyman, a pastor or a minister of a church, an evangelist, or a missionary) *
                                                </td>
                                                <td style="text-align: center;"><input type="checkbox" name="s2q7" id="s2q7" data-toggle="toggle" data-style="android" data-on="Yes" data-off="-" data-onstyle="success" data-offstyle="danger"></td>

                                            </tr>
                                            <tr style="background-color: #fff;">
                                                <td style="text-align: left;"><b>C.</b> Are you a member in good standing of a church, as your church defines membership? *
                                                </td>
                                                <td style="text-align: center;"><input type="checkbox" name="s2q8" id="s2q8" data-toggle="toggle" data-style="android" data-on="Yes" data-off="-" data-onstyle="success" data-offstyle="danger"></td>

                                            </tr>
                                        </table>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="chinfo" style="background-color: rgb(246, 248, 224);">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; height: 30px;">Church Information</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-3">
                                                <label for="trno">Church Name *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-home"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="churchname" id="churchname" style="font-size: 12px;" placeholder="..enter Church Name here" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="trno">Church Address</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="churchaddr" id="churchaddr" style="font-size: 12px;" placeholder="..enter Chruch Address" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="trno">City *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="churchcity" id="churchcity" style="font-size: 12px;" placeholder="..City name" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="lmemplan">Denomination *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="churchdenomination" id="churchdenomination" class="form-control" style="font-size: 12px;" required>
                                                        <option value="0">-- Select --</option>
                                                        <option value="Main line Churches">Main line Churches</option>
                                                        <option value="Pentecost">Pentecost</option>
                                                        <option value="Brethren">Brethren</option>
                                                        <option value="Independent Evangelicals">Independent Evangelicals
                                                        </option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="remark" style="background-color: rgb(224, 248, 247);">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; height: 30px;">Pastor Details</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-3">
                                                <label for="camp">Pastor Name *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-user"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="pastorname" id="pastorname" style="font-size: 12px;" placeholder="..enter Pastor Name" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="trno">Pastor Mobile No *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-phone"></span>
                                                    </span>
                                                    <input inputmode="numeric" class="form-control" name="pastormobile" id="pastormobile" style="font-size: 12px;" maxlength="10" placeholder="..Pastor Mobile No (10 digits)" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="trno">Pastor Email ID</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-envelope"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="pastoremail" id="pastoremail" style="font-size: 12px;" placeholder="..Pastor Email ID" autocomplete="off" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="filledby" style="background-color: rgb(246, 248, 224);">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; height: 30px;">Other Information</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-3">
                                                <label for="lmemplan">This form is filled by ? *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="formfilledby" id="formfilledby" class="form-control" style="font-size: 12px;" onchange="FormFilledBy()" required>
                                                        <option value="0">- Select -</option>
                                                        <option value="Field Staff"> Field Staff </option>
                                                        <option value="Member"> Camp Officer / Member </option>
                                                        <option value="Non Member"> Prospective Member </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3">
                                                <label for="lmemplan">Source of Application ? *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="sourceofappln" id="sourceofappln" class="form-control" style="font-size: 12px;" required>
                                                        <option value="0">- Select -</option>
                                                        <option value="Personal Sign-up"> Personal Sign-up </option>
                                                        <option value="Annual Membership Dinner"> Annual Membership Dinner </option>
                                                        <option value="New Member Plan"> New Member Plan </option>
                                                        <option value="PSU Church Presentation"> PSU Church Presentation </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="ffbname">
                                                <label for="trno">Field Officer Name *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="formfilledbyfoname" id="formfilledbyfoname" style="font-size: 12px;" placeholder="..Name of the Gideon /Field officer" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="ffbmembername">
                                                <label for="trno">Gideon Member Name *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="formfilledbygideonname" id="formfilledbygideonname" style="font-size: 12px;" placeholder="..Name of the Gideon /Field officer" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2" id="ffbmid">
                                                <label for="trno">Membership ID</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="formfilledbymid" id="formfilledbymid" style="font-size: 12px;" maxlength="7" placeholder="..enter Membership ID" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="ffbcamp">
                                                <label for="trno">Prospective Member's Camp *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <select name="formfilledbycamp" id="formfilledbycamp" class="form-control" style="font-size: 12px;">
                                                        <option value="0">-- Select Camp --</option>
                                                        <option value="AALO">AALO</option>
                                                        <option value="ACHAMPET">ACHAMPET</option>
                                                        <option value="ADDA KATHAR JALANDHAR">ADDA KATHAR JALANDHAR</option>
                                                        <option value="ADILABAD">ADILABAD</option>
                                                        <option value="ADITYAPUR">ADITYAPUR</option>
                                                        <option value="ADONI">ADONI</option>
                                                        <option value="ADOOR">ADOOR</option>
                                                        <option value="AGARTALA">AGARTALA</option>
                                                        <option value="AGRA">AGRA</option>
                                                        <option value="AHMEDABAD CENTRAL">AHMEDABAD CENTRAL</option>
                                                        <option value="AHMEDABAD MANINAGAR">AHMEDABAD MANINAGAR</option>
                                                        <option value="AHMEDABAD WEST">AHMEDABAD WEST</option>
                                                        <option value="AHMEDNAGAR">AHMEDNAGAR</option>
                                                        <option value="AHWA">AHWA</option>
                                                        <option value="AIROLI">AIROLI</option>
                                                        <option value="AIZAWL EAST">AIZAWL EAST</option>
                                                        <option value="AIZAWL NORTH">AIZAWL NORTH</option>
                                                        <option value="AIZAWL SOUTH">AIZAWL SOUTH</option>
                                                        <option value="AIZAWL WEST">AIZAWL WEST</option>
                                                        <option value="AJMER">AJMER</option>
                                                        <option value="AKOLA">AKOLA</option>
                                                        <option value="ALAIR">ALAIR</option>
                                                        <option value="ALAKODE">ALAKODE</option>
                                                        <option value="ALIBAUG">ALIBAUG</option>
                                                        <option value="ALIGARH">ALIGARH</option>
                                                        <option value="ALIPURDUAR">ALIPURDUAR</option>
                                                        <option value="ALIRAJPUR">ALIRAJPUR</option>
                                                        <option value="ALLAHABAD">ALLAHABAD</option>
                                                        <option value="ALLEPPEY">ALLEPPEY</option>
                                                        <option value="ALMORA">ALMORA</option>
                                                        <option value="ALUVA">ALUVA</option>
                                                        <option value="ALWAL">ALWAL</option>
                                                        <option value="ALWAR">ALWAR</option>
                                                        <option value="AMALAPURAM">AMALAPURAM</option>
                                                        <option value="AMBABAR">AMBABAR</option>
                                                        <option value="AMBALA">AMBALA</option>
                                                        <option value="AMBASAMUDRAM">AMBASAMUDRAM</option>
                                                        <option value="AMBERNATH">AMBERNATH</option>
                                                        <option value="AMBIKAPUR">AMBIKAPUR</option>
                                                        <option value="AMBUR">AMBUR</option>
                                                        <option value="AMLAI">AMLAI</option>
                                                        <option value="AMPATI">AMPATI</option>
                                                        <option value="AMRAVATI">AMRAVATI</option>
                                                        <option value="AMRITSAR">AMRITSAR</option>
                                                        <option value="ANAKAPALLE">ANAKAPALLE</option>
                                                        <option value="ANAND">ANAND</option>
                                                        <option value="ANANTAPUR">ANANTAPUR</option>
                                                        <option value="ANCHAL">ANCHAL</option>
                                                        <option value="ANDHERI">ANDHERI</option>
                                                        <option value="ANGAMALI">ANGAMALI</option>
                                                        <option value="ANGUL">ANGUL</option>
                                                        <option value="ANKLESHWAR">ANKLESHWAR</option>
                                                        <option value="ANNI">ANNI</option>
                                                        <option value="ARAKKONAM">ARAKKONAM</option>
                                                        <option value="ARAKU">ARAKU</option>
                                                        <option value="ARARIA">ARARIA</option>
                                                        <option value="ARCOT">ARCOT</option>
                                                        <option value="ARIYALUR">ARIYALUR</option>
                                                        <option value="ARMOOR">ARMOOR</option>
                                                        <option value="ARRAH">ARRAH</option>
                                                        <option value="ARUMUGANERI">ARUMUGANERI</option>
                                                        <option value="ARUPPUKOTTAI">ARUPPUKOTTAI</option>
                                                        <option value="ARYANAD">ARYANAD</option>
                                                        <option value="ASANSOL">ASANSOL</option>
                                                        <option value="ATHIKAYAM">ATHIKAYAM</option>
                                                        <option value="ATHMAKUR">ATHMAKUR</option>
                                                        <option value="ATMAKUR KNL">ATMAKUR KNL</option>
                                                        <option value="ATTINGAL">ATTINGAL</option>
                                                        <option value="ATTUR">ATTUR</option>
                                                        <option value="AURANGABAD">AURANGABAD</option>
                                                        <option value="AVADI">AVADI</option>
                                                        <option value="AYINKAMAM">AYINKAMAM</option>
                                                        <option value="AYUR">AYUR</option>
                                                        <option value="AZAMGARH">AZAMGARH</option>
                                                        <option value="BADAUN">BADAUN</option>
                                                        <option value="BADLAPUR">BADLAPUR</option>
                                                        <option value="BADVEL">BADVEL</option>
                                                        <option value="BAHRAICH">BAHRAICH</option>
                                                        <option value="BAIKUNTHPUR">BAIKUNTHPUR</option>
                                                        <option value="BAILADILA">BAILADILA</option>
                                                        <option value="BAKALIA">BAKALIA</option>
                                                        <option value="BALAGHAT">BALAGHAT</option>
                                                        <option value="BALARAMAPURAM">BALARAMAPURAM</option>
                                                        <option value="BALASORE">BALASORE</option>
                                                        <option value="BALIGUDA">BALIGUDA</option>
                                                        <option value="BALLARSHA">BALLARSHA</option>
                                                        <option value="BALLIA">BALLIA</option>
                                                        <option value="BANDA">BANDA</option>
                                                        <option value="BANGALORE BOMMANAHALLI">BANGALORE BOMMANAHALLI</option>
                                                        <option value="BANGALORE CENTRAL">BANGALORE CENTRAL</option>
                                                        <option value="BANGALORE CHANDAPURA">BANGALORE CHANDAPURA</option>
                                                        <option value="BANGALORE ELECTRONIC CITY">BANGALORE ELECTRONIC CITY</option>
                                                        <option value="BANGALORE HOSA ROAD">BANGALORE HOSA ROAD</option>
                                                        <option value="BANGALORE KORAMANGALA">BANGALORE KORAMANGALA</option>
                                                        <option value="BANGALORE NORTH">BANGALORE NORTH</option>
                                                        <option value="BANGALORE NORTH EAST">BANGALORE NORTH EAST</option>
                                                        <option value="BANGALORE PEENYA">BANGALORE PEENYA</option>
                                                        <option value="BANGALORE RAJAJI NAGAR">BANGALORE RAJAJI NAGAR</option>
                                                        <option value="BANGALORE RT NAGAR">BANGALORE RT NAGAR</option>
                                                        <option value="BANGALORE SOUTH">BANGALORE SOUTH</option>
                                                        <option value="BANGALORE SOUTH EAST">BANGALORE SOUTH EAST</option>
                                                        <option value="BANGALORE WHITEFIELD">BANGALORE WHITEFIELD</option>
                                                        <option value="BANGALORE YELAHANKA">BANGALORE YELAHANKA</option>
                                                        <option value="BANGALORE-RR NAGAR AND KENGERI">BANGALORE-RR NAGAR AND KENGERI</option>
                                                        <option value="BANKURA">BANKURA</option>
                                                        <option value="BANSWARA">BANSWARA</option>
                                                        <option value="BAPATLA">BAPATLA</option>
                                                        <option value="BAR-E-BRAHMANA">BAR-E-BRAHMANA</option>
                                                        <option value="BARABANKI">BARABANKI</option>
                                                        <option value="BARAMATI">BARAMATI</option>
                                                        <option value="BARAN">BARAN</option>
                                                        <option value="BAREILLEY">BAREILLEY</option>
                                                        <option value="BARGARH">BARGARH</option>
                                                        <option value="BARH">BARH</option>
                                                        <option value="BARHARWA">BARHARWA</option>
                                                        <option value="BARMER">BARMER</option>
                                                        <option value="BARNALA">BARNALA</option>
                                                        <option value="BARODA">BARODA</option>
                                                        <option value="BARWANI">BARWANI</option>
                                                        <option value="BATALA">BATALA</option>
                                                        <option value="BATHINDA">BATHINDA</option>
                                                        <option value="BEAWAR">BEAWAR</option>
                                                        <option value="BEGUSARAI">BEGUSARAI</option>
                                                        <option value="BELGAUM">BELGAUM</option>
                                                        <option value="BELLARY">BELLARY</option>
                                                        <option value="BELUR">BELUR</option>
                                                        <option value="BENAULIM">BENAULIM</option>
                                                        <option value="BERHAMPUR">BERHAMPUR</option>
                                                        <option value="BETTIAH">BETTIAH</option>
                                                        <option value="BETUL">BETUL</option>
                                                        <option value="BHADOHI">BHADOHI</option>
                                                        <option value="BHADRACHALAM">BHADRACHALAM</option>
                                                        <option value="BHADRAK">BHADRAK</option>
                                                        <option value="BHADRAVATI">BHADRAVATI</option>
                                                        <option value="BHAGALPUR">BHAGALPUR</option>
                                                        <option value="BHAMIANA KALANA">BHAMIANA KALANA</option>
                                                        <option value="BHANDARA">BHANDARA</option>
                                                        <option value="BHARATPUR">BHARATPUR</option>
                                                        <option value="BHARUCH">BHARUCH</option>
                                                        <option value="BHATAPARA">BHATAPARA</option>
                                                        <option value="BHAVANI">BHAVANI</option>
                                                        <option value="BHAVNAGAR">BHAVNAGAR</option>
                                                        <option value="BHAWANIPATNA">BHAWANIPATNA</option>
                                                        <option value="BHEL HYDERABAD">BHEL HYDERABAD</option>
                                                        <option value="BHILAI">BHILAI</option>
                                                        <option value="BHILWARA">BHILWARA</option>
                                                        <option value="BHIMAVARAM">BHIMAVARAM</option>
                                                        <option value="BHIMUNIPATNAM">BHIMUNIPATNAM</option>
                                                        <option value="BHIND">BHIND</option>
                                                        <option value="BHIRAKHERI">BHIRAKHERI</option>
                                                        <option value="BHOPAL">BHOPAL</option>
                                                        <option value="BHOPAL - BHEL">BHOPAL - BHEL</option>
                                                        <option value="BHUBANESHWAR">BHUBANESHWAR</option>
                                                        <option value="BHUJ">BHUJ</option>
                                                        <option value="BIDAR">BIDAR</option>
                                                        <option value="BIJAPUR">BIJAPUR</option>
                                                        <option value="BIJAPUR K">BIJAPUR K</option>
                                                        <option value="BIJNOR">BIJNOR</option>
                                                        <option value="BIKANER">BIKANER</option>
                                                        <option value="BILASPUR">BILASPUR</option>
                                                        <option value="BINA">BINA</option>
                                                        <option value="BIRAMITRAPUR">BIRAMITRAPUR</option>
                                                        <option value="BIRISINGPUR">BIRISINGPUR</option>
                                                        <option value="BISHNUPUR">BISHNUPUR</option>
                                                        <option value="BISHRAMPUR">BISHRAMPUR</option>
                                                        <option value="BISHWANATH">BISHWANATH</option>
                                                        <option value="BOBBILI">BOBBILI</option>
                                                        <option value="BODHAN">BODHAN</option>
                                                        <option value="BOKARO STEEL CITY">BOKARO STEEL CITY</option>
                                                        <option value="BOKARO THERMAL">BOKARO THERMAL</option>
                                                        <option value="BOLANGIR">BOLANGIR</option>
                                                        <option value="BOMDILA">BOMDILA</option>
                                                        <option value="BONGAIGAON">BONGAIGAON</option>
                                                        <option value="BORIO-SAHEBGANJ">BORIO-SAHEBGANJ</option>
                                                        <option value="BORIVILI">BORIVILI</option>
                                                        <option value="BORRA CAVES">BORRA CAVES</option>
                                                        <option value="BOWENPALLY">BOWENPALLY</option>
                                                        <option value="BRAJRAJNAGAR">BRAJRAJNAGAR</option>
                                                        <option value="BULANDSHAHR">BULANDSHAHR</option>
                                                        <option value="BULDHANA">BULDHANA</option>
                                                        <option value="BUNDI">BUNDI</option>
                                                        <option value="BUXAR">BUXAR</option>
                                                        <option value="CALCUTTA CENTRAL">CALCUTTA CENTRAL</option>
                                                        <option value="CALCUTTA NORTH">CALCUTTA NORTH</option>
                                                        <option value="CALCUTTA SOUTH">CALCUTTA SOUTH</option>
                                                        <option value="CALICUT">CALICUT</option>
                                                        <option value="CHAIBASA">CHAIBASA</option>
                                                        <option value="CHAKRADHARPUR">CHAKRADHARPUR</option>
                                                        <option value="CHAMARAJNAGAR">CHAMARAJNAGAR</option>
                                                        <option value="CHAMBA">CHAMBA</option>
                                                        <option value="CHAMPHAI">CHAMPHAI</option>
                                                        <option value="CHANDEL">CHANDEL</option>
                                                        <option value="CHANDIGARH">CHANDIGARH</option>
                                                        <option value="CHANDIGARH WEST">CHANDIGARH WEST</option>
                                                        <option value="CHANDRAPUR">CHANDRAPUR</option>
                                                        <option value="CHANDWA">CHANDWA</option>
                                                        <option value="CHANGANACHERRY">CHANGANACHERRY</option>
                                                        <option value="CHANGTONGYA">CHANGTONGYA</option>
                                                        <option value="CHARIMOODU">CHARIMOODU</option>
                                                        <option value="CHATRA">CHATRA</option>
                                                        <option value="CHEMBUR">CHEMBUR</option>
                                                        <option value="CHENGALPATTU">CHENGALPATTU</option>
                                                        <option value="CHENGANNUR">CHENGANNUR</option>
                                                        <option value="CHENNAI INFO">CHENNAI INFO</option>
                                                        <option value="CHERIAL">CHERIAL</option>
                                                        <option value="CHERTHALA">CHERTHALA</option>
                                                        <option value="CHHATARPUR">CHHATARPUR</option>
                                                        <option value="CHHINDWARA">CHHINDWARA</option>
                                                        <option value="CHICKMAGALUR">CHICKMAGALUR</option>
                                                        <option value="CHIDAMBARAM">CHIDAMBARAM</option>
                                                        <option value="CHILAKALURIPETA">CHILAKALURIPETA</option>
                                                        <option value="CHINTAPALLI">CHINTAPALLI</option>
                                                        <option value="CHIRALA">CHIRALA</option>
                                                        <option value="CHIRGAON">CHIRGAON</option>
                                                        <option value="CHIRMIRI">CHIRMIRI</option>
                                                        <option value="CHITRADURGA">CHITRADURGA</option>
                                                        <option value="CHITRANJAN">CHITRANJAN</option>
                                                        <option value="CHITTOOR">CHITTOOR</option>
                                                        <option value="CHITTORGARH">CHITTORGARH</option>
                                                        <option value="CHITTUR">CHITTUR</option>
                                                        <option value="CHUMUKEDIMA">CHUMUKEDIMA</option>
                                                        <option value="CHUNGATHARA">CHUNGATHARA</option>
                                                        <option value="CHURACHANDPUR">CHURACHANDPUR</option>
                                                        <option value="CHURACHANDPUR NORTH">CHURACHANDPUR NORTH</option>
                                                        <option value="COCHIN CENTRAL">COCHIN CENTRAL</option>
                                                        <option value="COCHIN INFO PARK">COCHIN INFO PARK</option>
                                                        <option value="COCHIN ISLANDS">COCHIN ISLANDS</option>
                                                        <option value="COCHIN VYTILLA">COCHIN VYTILLA</option>
                                                        <option value="COIMBATORE EAST">COIMBATORE EAST</option>
                                                        <option value="COIMBATORE NORTH">COIMBATORE NORTH</option>
                                                        <option value="COIMBATORE WEST">COIMBATORE WEST</option>
                                                        <option value="COONOOR">COONOOR</option>
                                                        <option value="CUDDALORE">CUDDALORE</option>
                                                        <option value="CUDDAPAH">CUDDAPAH</option>
                                                        <option value="CUTTACK">CUTTACK</option>
                                                        <option value="DADAR">DADAR</option>
                                                        <option value="DAHOD">DAHOD</option>
                                                        <option value="DALLI RAJHARA">DALLI RAJHARA</option>
                                                        <option value="DALTANGANJ">DALTANGANJ</option>
                                                        <option value="DALU">DALU</option>
                                                        <option value="DAMOH">DAMOH</option>
                                                        <option value="DAPORIJO">DAPORIJO</option>
                                                        <option value="DARBHANGA">DARBHANGA</option>
                                                        <option value="DARJEELING">DARJEELING</option>
                                                        <option value="DASUYA">DASUYA</option>
                                                        <option value="DAUND">DAUND</option>
                                                        <option value="DAVANGERE">DAVANGERE</option>
                                                        <option value="DEHRADUN">DEHRADUN</option>
                                                        <option value="DEHRI-ON-SONE">DEHRI-ON-SONE</option>
                                                        <option value="DEHU-TALEGAON">DEHU-TALEGAON</option>
                                                        <option value="DELHI BURARI">DELHI BURARI</option>
                                                        <option value="DELHI CENTRAL">DELHI CENTRAL</option>
                                                        <option value="DELHI DWARAKA">DELHI DWARAKA</option>
                                                        <option value="DELHI EAST">DELHI EAST</option>
                                                        <option value="DELHI NORTH">DELHI NORTH</option>
                                                        <option value="DELHI NORTH EAST">DELHI NORTH EAST</option>
                                                        <option value="DELHI NORTH WEST">DELHI NORTH WEST</option>
                                                        <option value="DELHI PUSHP VIHAR">DELHI PUSHP VIHAR</option>
                                                        <option value="DELHI ROHINI">DELHI ROHINI</option>
                                                        <option value="DELHI SARITA VIHAR">DELHI SARITA VIHAR</option>
                                                        <option value="DELHI SOUTH">DELHI SOUTH</option>
                                                        <option value="DELHI SOUTH WEST">DELHI SOUTH WEST</option>
                                                        <option value="DELHI VASANT KUNJ">DELHI VASANT KUNJ</option>
                                                        <option value="DELHI WEST">DELHI WEST</option>
                                                        <option value="DEOGHAR">DEOGHAR</option>
                                                        <option value="DERGANG">DERGANG</option>
                                                        <option value="DEVARAKONDA">DEVARAKONDA</option>
                                                        <option value="DEWAS">DEWAS</option>
                                                        <option value="DHALAI">DHALAI</option>
                                                        <option value="DHAMTARI">DHAMTARI</option>
                                                        <option value="DHANBAD">DHANBAD</option>
                                                        <option value="DHAR">DHAR</option>
                                                        <option value="DHARAMSHALA">DHARAMSHALA</option>
                                                        <option value="DHARIWAL">DHARIWAL</option>
                                                        <option value="DHARMAPURI">DHARMAPURI</option>
                                                        <option value="DHARMAVARAM">DHARMAVARAM</option>
                                                        <option value="DHARWAD">DHARWAD</option>
                                                        <option value="DHEMAJI">DHEMAJI</option>
                                                        <option value="DHOLPUR">DHOLPUR</option>
                                                        <option value="DHULE">DHULE</option>
                                                        <option value="DIBRUGARH">DIBRUGARH</option>
                                                        <option value="DIMAPUR EAST">DIMAPUR EAST</option>
                                                        <option value="DIMAPUR WEST">DIMAPUR WEST</option>
                                                        <option value="DINDIGUL">DINDIGUL</option>
                                                        <option value="DIPHU">DIPHU</option>
                                                        <option value="DOMBIVILI">DOMBIVILI</option>
                                                        <option value="DONGARGARH">DONGARGARH</option>
                                                        <option value="DORNAKAL">DORNAKAL</option>
                                                        <option value="DUMKA">DUMKA</option>
                                                        <option value="DUNGARPUR">DUNGARPUR</option>
                                                        <option value="DURGAPUR">DURGAPUR</option>
                                                        <option value="ECIL HYDERABAD">ECIL HYDERABAD</option>
                                                        <option value="EDAPALLY">EDAPALLY</option>
                                                        <option value="EDATHUA">EDATHUA</option>
                                                        <option value="ELURU">ELURU</option>
                                                        <option value="ELURU EAST">ELURU EAST</option>
                                                        <option value="ERAVIPEROOR">ERAVIPEROOR</option>
                                                        <option value="ERODE">ERODE</option>
                                                        <option value="ETAH">ETAH</option>
                                                        <option value="FAIZABAD">FAIZABAD</option>
                                                        <option value="FAMBONG-SOMBARIA">FAMBONG-SOMBARIA</option>
                                                        <option value="FARIDABAD">FARIDABAD</option>
                                                        <option value="FARIDKOT">FARIDKOT</option>
                                                        <option value="FARRUKHABAD">FARRUKHABAD</option>
                                                        <option value="FATEHGARH">FATEHGARH</option>
                                                        <option value="FATEHPUR">FATEHPUR</option>
                                                        <option value="FEROZPUR">FEROZPUR</option>
                                                        <option value="FORT COCHIN">FORT COCHIN</option>
                                                        <option value="G.UDAYAGIRI">G.UDAYAGIRI</option>
                                                        <option value="GADAG-BETGARI">GADAG-BETGARI</option>
                                                        <option value="GADCHANDUR">GADCHANDUR</option>
                                                        <option value="GADWAL">GADWAL</option>
                                                        <option value="GAJWEL">GAJWEL</option>
                                                        <option value="GANDHIDHAM">GANDHIDHAM</option>
                                                        <option value="GANDHINAGAR">GANDHINAGAR</option>
                                                        <option value="GANGTOK">GANGTOK</option>
                                                        <option value="GARHWA">GARHWA</option>
                                                        <option value="GAYA">GAYA</option>
                                                        <option value="GAYZING">GAYZING</option>
                                                        <option value="GHATKOPAR">GHATKOPAR</option>
                                                        <option value="GHATSILA-MUSABANI">GHATSILA-MUSABANI</option>
                                                        <option value="GHAZIABAD">GHAZIABAD</option>
                                                        <option value="GHAZIPUR">GHAZIPUR</option>
                                                        <option value="GHUGUS">GHUGUS</option>
                                                        <option value="GIDDALUR">GIDDALUR</option>
                                                        <option value="GIDEONS (ISOLATED PLACES)">GIDEONS (ISOLATED PLACES)</option>
                                                        <option value="GIRIDIH">GIRIDIH</option>
                                                        <option value="GOA MAPUSA">GOA MAPUSA</option>
                                                        <option value="GOA MARGAO">GOA MARGAO</option>
                                                        <option value="GOA PANJIM">GOA PANJIM</option>
                                                        <option value="GOA PONDA">GOA PONDA</option>
                                                        <option value="GOA VASCO">GOA VASCO</option>
                                                        <option value="GOALPARA">GOALPARA</option>
                                                        <option value="GOBICHETTIPALAYAM">GOBICHETTIPALAYAM</option>
                                                        <option value="GODDA MAHAGAMA">GODDA MAHAGAMA</option>
                                                        <option value="GODHRA">GODHRA</option>
                                                        <option value="GOKAK">GOKAK</option>
                                                        <option value="GOKAVARAM">GOKAVARAM</option>
                                                        <option value="GOLAGHAT">GOLAGHAT</option>
                                                        <option value="GOMOH">GOMOH</option>
                                                        <option value="GONDA">GONDA</option>
                                                        <option value="GONDIA">GONDIA</option>
                                                        <option value="GOOTY">GOOTY</option>
                                                        <option value="GOPALPUR">GOPALPUR</option>
                                                        <option value="GORAKHPUR">GORAKHPUR</option>
                                                        <option value="GOREGAON">GOREGAON</option>
                                                        <option value="GOSAIGAON">GOSAIGAON</option>
                                                        <option value="GREATER NOIDA">GREATER NOIDA</option>
                                                        <option value="GUDALUR">GUDALUR</option>
                                                        <option value="GUDIWADA">GUDIWADA</option>
                                                        <option value="GUDIYATHAM">GUDIYATHAM</option>
                                                        <option value="GUDUR">GUDUR</option>
                                                        <option value="GULBARGA">GULBARGA</option>
                                                        <option value="GUMLA">GUMLA</option>
                                                        <option value="GUNA">GUNA</option>
                                                        <option value="GUNDLUPET">GUNDLUPET</option>
                                                        <option value="GUNTAKAL">GUNTAKAL</option>
                                                        <option value="GUNTUR NORTH">GUNTUR NORTH</option>
                                                        <option value="GUNTUR SOUTH">GUNTUR SOUTH</option>
                                                        <option value="GURAJALA">GURAJALA</option>
                                                        <option value="GURDASPUR">GURDASPUR</option>
                                                        <option value="GURUGRAM">GURUGRAM</option>
                                                        <option value="GUWAHATI">GUWAHATI</option>
                                                        <option value="GWALIOR">GWALIOR</option>
                                                        <option value="HAFLONG">HAFLONG</option>
                                                        <option value="HALDWANI">HALDWANI</option>
                                                        <option value="HAMIRPUR">HAMIRPUR</option>
                                                        <option value="HANAMAKONDA">HANAMAKONDA</option>
                                                        <option value="HAPUR">HAPUR</option>
                                                        <option value="HARDA">HARDA</option>
                                                        <option value="HARDOI">HARDOI</option>
                                                        <option value="HARIDWAR">HARIDWAR</option>
                                                        <option value="HARUR">HARUR</option>
                                                        <option value="HASSAN">HASSAN</option>
                                                        <option value="HAVERI - RANEBENNUR">HAVERI - RANEBENNUR</option>
                                                        <option value="HAZARIBAGH">HAZARIBAGH</option>
                                                        <option value="HAZIPUR">HAZIPUR</option>
                                                        <option value="HERBERTPUR">HERBERTPUR</option>
                                                        <option value="HINDUPUR">HINDUPUR</option>
                                                        <option value="HISAR">HISAR</option>
                                                        <option value="HITECH CITY">HITECH CITY</option>
                                                        <option value="HNATHIAL">HNATHIAL</option>
                                                        <option value="HOSHANGABAD">HOSHANGABAD</option>
                                                        <option value="HOSIARPUR">HOSIARPUR</option>
                                                        <option value="HOSPET">HOSPET</option>
                                                        <option value="HOSUR NORTH">HOSUR NORTH</option>
                                                        <option value="HOSUR SOUTH">HOSUR SOUTH</option>
                                                        <option value="HUBLI">HUBLI</option>
                                                        <option value="HUBLI CENTRAL">HUBLI CENTRAL</option>
                                                        <option value="HUNSUR">HUNSUR</option>
                                                        <option value="HUZUR NAGAR">HUZUR NAGAR</option>
                                                        <option value="HYDERABAD">HYDERABAD</option>
                                                        <option value="IBRAHIMPATNAM">IBRAHIMPATNAM</option>
                                                        <option value="ICHALKARANJI">ICHALKARANJI</option>
                                                        <option value="ICHAPURAM">ICHAPURAM</option>
                                                        <option value="IDAIYANGUDI">IDAIYANGUDI</option>
                                                        <option value="IMPHAL EAST">IMPHAL EAST</option>
                                                        <option value="IMPHAL WEST">IMPHAL WEST</option>
                                                        <option value="INCHIVILA">INCHIVILA</option>
                                                        <option value="INDORE">INDORE</option>
                                                        <option value="INDORE CENTRAL">INDORE CENTRAL</option>
                                                        <option value="INKOLLU">INKOLLU</option>
                                                        <option value="IRINJALAKUDA">IRINJALAKUDA</option>
                                                        <option value="IRITTY">IRITTY</option>
                                                        <option value="ITANAGAR CITY">ITANAGAR CITY</option>
                                                        <option value="ITARSI">ITARSI</option>
                                                        <option value="JABALPUR">JABALPUR</option>
                                                        <option value="JADCHARLA">JADCHARLA</option>
                                                        <option value="JAGDALPUR">JAGDALPUR</option>
                                                        <option value="JAGDEESHPUR">JAGDEESHPUR</option>
                                                        <option value="JAGGAIAHPET">JAGGAIAHPET</option>
                                                        <option value="JAGTIAL">JAGTIAL</option>
                                                        <option value="JAHANABAD">JAHANABAD</option>
                                                        <option value="JAIGAON">JAIGAON</option>
                                                        <option value="JAIPUR CENTRAL">JAIPUR CENTRAL</option>
                                                        <option value="JAIPUR NORTH">JAIPUR NORTH</option>
                                                        <option value="JAIPUR SOUTH">JAIPUR SOUTH</option>
                                                        <option value="JAISALMER">JAISALMER</option>
                                                        <option value="JALANDHAR">JALANDHAR</option>
                                                        <option value="JALANDHAR SOUTH">JALANDHAR SOUTH</option>
                                                        <option value="JALGAON-BHUSAVAL">JALGAON-BHUSAVAL</option>
                                                        <option value="JALNA">JALNA</option>
                                                        <option value="JALORE">JALORE</option>
                                                        <option value="JALPAIGURI">JALPAIGURI</option>
                                                        <option value="JALUKIE">JALUKIE</option>
                                                        <option value="JAMMU">JAMMU</option>
                                                        <option value="JAMNAGAR">JAMNAGAR</option>
                                                        <option value="JAMPUI">JAMPUI</option>
                                                        <option value="JAMSHEDPUR">JAMSHEDPUR</option>
                                                        <option value="JAMTARA">JAMTARA</option>
                                                        <option value="JAMUI">JAMUI</option>
                                                        <option value="JANGAON">JANGAON</option>
                                                        <option value="JANGAREDDIGUDEM">JANGAREDDIGUDEM</option>
                                                        <option value="JANJGIR">JANJGIR</option>
                                                        <option value="JASHPUR">JASHPUR</option>
                                                        <option value="JATNI KHURDA">JATNI KHURDA</option>
                                                        <option value="JAUNPUR">JAUNPUR</option>
                                                        <option value="JEEDIMETLA">JEEDIMETLA</option>
                                                        <option value="JEYPORE">JEYPORE</option>
                                                        <option value="JHALAWAR">JHALAWAR</option>
                                                        <option value="JHANSI">JHANSI</option>
                                                        <option value="JHARSUGUDA">JHARSUGUDA</option>
                                                        <option value="JIRIBAM">JIRIBAM</option>
                                                        <option value="JOBAT">JOBAT</option>
                                                        <option value="JODHPUR">JODHPUR</option>
                                                        <option value="JORETHANG">JORETHANG</option>
                                                        <option value="JORHAT">JORHAT</option>
                                                        <option value="JOWAI">JOWAI</option>
                                                        <option value="JYOTHINAGAR">JYOTHINAGAR</option>
                                                        <option value="KADIRI">KADIRI</option>
                                                        <option value="KAGAL">KAGAL</option>
                                                        <option value="KAILASAPURAM">KAILASAPURAM</option>
                                                        <option value="KAIMUR">KAIMUR</option>
                                                        <option value="KAITHAL">KAITHAL</option>
                                                        <option value="KAKINADA">KAKINADA</option>
                                                        <option value="KALAMASSERY">KALAMASSERY</option>
                                                        <option value="KALIMPONG">KALIMPONG</option>
                                                        <option value="KALLURU">KALLURU</option>
                                                        <option value="KALPAKKAM">KALPAKKAM</option>
                                                        <option value="KALPETTA">KALPETTA</option>
                                                        <option value="KALWAKURTHY">KALWAKURTHY</option>
                                                        <option value="KALYAN">KALYAN</option>
                                                        <option value="KALYANDURG">KALYANDURG</option>
                                                        <option value="KAMAREDDY">KAMAREDDY</option>
                                                        <option value="KANCHIPURAM">KANCHIPURAM</option>
                                                        <option value="KANDUKUR">KANDUKUR</option>
                                                        <option value="KANGPOKPI">KANGPOKPI</option>
                                                        <option value="KANGRA">KANGRA</option>
                                                        <option value="KANIGIRI">KANIGIRI</option>
                                                        <option value="KANJIKODE">KANJIKODE</option>
                                                        <option value="KANKE">KANKE</option>
                                                        <option value="KANKER">KANKER</option>
                                                        <option value="KANNUR">KANNUR</option>
                                                        <option value="KANPUR">KANPUR</option>
                                                        <option value="KANSABEL">KANSABEL</option>
                                                        <option value="KAPURTHALA">KAPURTHALA</option>
                                                        <option value="KARAD">KARAD</option>
                                                        <option value="KARAIKUDI">KARAIKUDI</option>
                                                        <option value="KARAULI">KARAULI</option>
                                                        <option value="KARIMNAGAR">KARIMNAGAR</option>
                                                        <option value="KARIMNAGAR NORTH">KARIMNAGAR NORTH</option>
                                                        <option value="KARNAL">KARNAL</option>
                                                        <option value="KARTHIKAPALLY">KARTHIKAPALLY</option>
                                                        <option value="KARUKACHAL">KARUKACHAL</option>
                                                        <option value="KARUR">KARUR</option>
                                                        <option value="KARWAR">KARWAR</option>
                                                        <option value="KASARAGOD">KASARAGOD</option>
                                                        <option value="KASAULI">KASAULI</option>
                                                        <option value="KASGANJ">KASGANJ</option>
                                                        <option value="KASHIPUR">KASHIPUR</option>
                                                        <option value="KATHUA">KATHUA</option>
                                                        <option value="KATIHAR">KATIHAR</option>
                                                        <option value="KATNI">KATNI</option>
                                                        <option value="KATRA">KATRA</option>
                                                        <option value="KATTAKADA">KATTAKADA</option>
                                                        <option value="KATTAPANA">KATTAPANA</option>
                                                        <option value="KAVALI">KAVALI</option>
                                                        <option value="KAWARDHA">KAWARDHA</option>
                                                        <option value="KAYAMKULAM">KAYAMKULAM</option>
                                                        <option value="KAZIPET">KAZIPET</option>
                                                        <option value="KHADAKWASLA">KHADAKWASLA</option>
                                                        <option value="KHAGARIA">KHAGARIA</option>
                                                        <option value="KHALILABAD">KHALILABAD</option>
                                                        <option value="KHAMMAM NORTH">KHAMMAM NORTH</option>
                                                        <option value="KHAMMAM SOUTH">KHAMMAM SOUTH</option>
                                                        <option value="KHANDWA">KHANDWA</option>
                                                        <option value="KHANNA">KHANNA</option>
                                                        <option value="KHARAGPUR">KHARAGPUR</option>
                                                        <option value="KHARAGPUR CENTRAL">KHARAGPUR CENTRAL</option>
                                                        <option value="KHARAR">KHARAR</option>
                                                        <option value="KHARGHAR">KHARGHAR</option>
                                                        <option value="KHARKUTTA">KHARKUTTA</option>
                                                        <option value="KHATIMA">KHATIMA</option>
                                                        <option value="KHAWZAWL">KHAWZAWL</option>
                                                        <option value="KHLIEHRIAT">KHLIEHRIAT</option>
                                                        <option value="KHUMULWNG">KHUMULWNG</option>
                                                        <option value="KHUNTI MURHU">KHUNTI MURHU</option>
                                                        <option value="KIPHIRE">KIPHIRE</option>
                                                        <option value="KODAD">KODAD</option>
                                                        <option value="KODAIKANAL">KODAIKANAL</option>
                                                        <option value="KODARMA">KODARMA</option>
                                                        <option value="KODOLI">KODOLI</option>
                                                        <option value="KODUKULANJI">KODUKULANJI</option>
                                                        <option value="KOHIMA NORTH">KOHIMA NORTH</option>
                                                        <option value="KOHIMA SOUTH">KOHIMA SOUTH</option>
                                                        <option value="KOILKUNTLA">KOILKUNTLA</option>
                                                        <option value="KOKRAJHAR">KOKRAJHAR</option>
                                                        <option value="KOLAR">KOLAR</option>
                                                        <option value="KOLAR GOLD FIELDS">KOLAR GOLD FIELDS</option>
                                                        <option value="KOLASIB">KOLASIB</option>
                                                        <option value="KOLENCHERRY">KOLENCHERRY</option>
                                                        <option value="KOLHAPUR">KOLHAPUR</option>
                                                        <option value="KOLLEGAL">KOLLEGAL</option>
                                                        <option value="KONDAGAON">KONDAGAON</option>
                                                        <option value="KONDOTTY">KONDOTTY</option>
                                                        <option value="KONNI">KONNI</option>
                                                        <option value="KORAPUT">KORAPUT</option>
                                                        <option value="KORBA">KORBA</option>
                                                        <option value="KORUTLA">KORUTLA</option>
                                                        <option value="KOSA GUMUDA">KOSA GUMUDA</option>
                                                        <option value="KOTA">KOTA</option>
                                                        <option value="KOTDWARA">KOTDWARA</option>
                                                        <option value="KOTGARH">KOTGARH</option>
                                                        <option value="KOTHAGUDEM">KOTHAGUDEM</option>
                                                        <option value="KOTHAMANGALAM">KOTHAMANGALAM</option>
                                                        <option value="KOTPAD">KOTPAD</option>
                                                        <option value="KOTTARAKARA">KOTTARAKARA</option>
                                                        <option value="KOTTAYAM">KOTTAYAM</option>
                                                        <option value="KOVILPATTI">KOVILPATTI</option>
                                                        <option value="KOVVURU">KOVVURU</option>
                                                        <option value="KOZHENCHERRY">KOZHENCHERRY</option>
                                                        <option value="KRISHNAGIRI">KRISHNAGIRI</option>
                                                        <option value="KUDAPPANAKKUNNU">KUDAPPANAKKUNNU</option>
                                                        <option value="KUKATPALLY">KUKATPALLY</option>
                                                        <option value="KULATHUPUZHA">KULATHUPUZHA</option>
                                                        <option value="KULLU">KULLU</option>
                                                        <option value="KUMALI">KUMALI</option>
                                                        <option value="KUMBAKONAM">KUMBAKONAM</option>
                                                        <option value="KUMBANAD">KUMBANAD</option>
                                                        <option value="KUNDARA">KUNDARA</option>
                                                        <option value="KUNNAMKULAM">KUNNAMKULAM</option>
                                                        <option value="KURADA">KURADA</option>
                                                        <option value="KURNOOL">KURNOOL</option>
                                                        <option value="KURSEONG">KURSEONG</option>
                                                        <option value="KURTAMGARH">KURTAMGARH</option>
                                                        <option value="L.B. NAGAR">L.B. NAGAR</option>
                                                        <option value="LAKHIMPUR">LAKHIMPUR</option>
                                                        <option value="LAKHIMPUR KHERI">LAKHIMPUR KHERI</option>
                                                        <option value="LAKHIPUR">LAKHIPUR</option>
                                                        <option value="LAKHNADON">LAKHNADON</option>
                                                        <option value="LAKLA">LAKLA</option>
                                                        <option value="LALITPUR">LALITPUR</option>
                                                        <option value="LATEHAR">LATEHAR</option>
                                                        <option value="LATUR">LATUR</option>
                                                        <option value="LAWNGTLAI">LAWNGTLAI</option>
                                                        <option value="LEH">LEH</option>
                                                        <option value="LOHARDAGA">LOHARDAGA</option>
                                                        <option value="LONAVALA">LONAVALA</option>
                                                        <option value="LONGDING">LONGDING</option>
                                                        <option value="LONGLENG">LONGLENG</option>
                                                        <option value="LUCKNOW">LUCKNOW</option>
                                                        <option value="LUCKNOW SOUTH">LUCKNOW SOUTH</option>
                                                        <option value="LUCKNOW TRANSGOMTI">LUCKNOW TRANSGOMTI</option>
                                                        <option value="LUDHIANA">LUDHIANA</option>
                                                        <option value="LUMDING">LUMDING</option>
                                                        <option value="LUNGLEI">LUNGLEI</option>
                                                        <option value="MACHERLA">MACHERLA</option>
                                                        <option value="MACHILIPATNAM">MACHILIPATNAM</option>
                                                        <option value="MADANAPALLE">MADANAPALLE</option>
                                                        <option value="MADEKERI">MADEKERI</option>
                                                        <option value="MADHEPURA">MADHEPURA</option>
                                                        <option value="MADHIRA">MADHIRA</option>
                                                        <option value="MADHUPUR">MADHUPUR</option>
                                                        <option value="MADHURANTHAGAM">MADHURANTHAGAM</option>
                                                        <option value="MADHYAMGRAM">MADHYAMGRAM</option>
                                                        <option value="MADRAS CENTRAL">MADRAS CENTRAL</option>
                                                        <option value="MADRAS NORTH">MADRAS NORTH</option>
                                                        <option value="MADRAS SOUTH">MADRAS SOUTH</option>
                                                        <option value="MADRAS WEST">MADRAS WEST</option>
                                                        <option value="MADURAI EAST">MADURAI EAST</option>
                                                        <option value="MADURAI NORTH">MADURAI NORTH</option>
                                                        <option value="MADURAI SOUTH">MADURAI SOUTH</option>
                                                        <option value="MAHASAMUND">MAHASAMUND</option>
                                                        <option value="MAHBUBABAD">MAHBUBABAD</option>
                                                        <option value="MAHBUBNAGAR">MAHBUBNAGAR</option>
                                                        <option value="MAJIRI">MAJIRI</option>
                                                        <option value="MALAJKHAND">MALAJKHAND</option>
                                                        <option value="MALAYINKEEZHU">MALAYINKEEZHU</option>
                                                        <option value="MALBAZAR">MALBAZAR</option>
                                                        <option value="MALKANGIRI">MALKANGIRI</option>
                                                        <option value="MALLAPALLY">MALLAPALLY</option>
                                                        <option value="MANALI">MANALI</option>
                                                        <option value="MANANTHAVADY">MANANTHAVADY</option>
                                                        <option value="MANAPARAI">MANAPARAI</option>
                                                        <option value="MANCHERIAL">MANCHERIAL</option>
                                                        <option value="MANDLA">MANDLA</option>
                                                        <option value="MANDYA">MANDYA</option>
                                                        <option value="MANENDRAGARH">MANENDRAGARH</option>
                                                        <option value="MANGALAGIRI">MANGALAGIRI</option>
                                                        <option value="MANGALORE">MANGALORE</option>
                                                        <option value="MANGO">MANGO</option>
                                                        <option value="MANMAD">MANMAD</option>
                                                        <option value="MANNARGUDI">MANNARGUDI</option>
                                                        <option value="MANNUTHY">MANNUTHY</option>
                                                        <option value="MANOHARPUR">MANOHARPUR</option>
                                                        <option value="MANSA">MANSA</option>
                                                        <option value="MANTHANI">MANTHANI</option>
                                                        <option value="MANUGURU">MANUGURU</option>
                                                        <option value="MARKAPUR">MARKAPUR</option>
                                                        <option value="MARTHANDAM">MARTHANDAM</option>
                                                        <option value="MARTUR">MARTUR</option>
                                                        <option value="MATHURA">MATHURA</option>
                                                        <option value="MATTAMPALLI">MATTAMPALLI</option>
                                                        <option value="MAU">MAU</option>
                                                        <option value="MAVELIKARA">MAVELIKARA</option>
                                                        <option value="MAWKYRWAT">MAWKYRWAT</option>
                                                        <option value="MAYILADUTHURAI">MAYILADUTHURAI</option>
                                                        <option value="MEDAK">MEDAK</option>
                                                        <option value="MEENANGADI">MEENANGADI</option>
                                                        <option value="MEERPET">MEERPET</option>
                                                        <option value="MEERUT">MEERUT</option>
                                                        <option value="MEHDIPATNAM">MEHDIPATNAM</option>
                                                        <option value="MEHSANA">MEHSANA</option>
                                                        <option value="METPALLY">METPALLY</option>
                                                        <option value="METTUPALAYAM">METTUPALAYAM</option>
                                                        <option value="METTUR DAM">METTUR DAM</option>
                                                        <option value="MHOW">MHOW</option>
                                                        <option value="MIAO">MIAO</option>
                                                        <option value="MIRA-BHAYANDER">MIRA-BHAYANDER</option>
                                                        <option value="MIRAJ">MIRAJ</option>
                                                        <option value="MIRIK">MIRIK</option>
                                                        <option value="MIRYALAGUDA">MIRYALAGUDA</option>
                                                        <option value="MIRZAPUR">MIRZAPUR</option>
                                                        <option value="MODINAGAR">MODINAGAR</option>
                                                        <option value="MOGA">MOGA</option>
                                                        <option value="MOHALI">MOHALI</option>
                                                        <option value="MOKOKCHUNG">MOKOKCHUNG</option>
                                                        <option value="MON">MON</option>
                                                        <option value="MORADABAD">MORADABAD</option>
                                                        <option value="MOTIHARI">MOTIHARI</option>
                                                        <option value="MUDALGI">MUDALGI</option>
                                                        <option value="MUKTSAR">MUKTSAR</option>
                                                        <option value="MUL">MUL</option>
                                                        <option value="MULANTHURUTHY">MULANTHURUTHY</option>
                                                        <option value="MUMBAI BANDRA">MUMBAI BANDRA</option>
                                                        <option value="MUMBAI CENTRAL">MUMBAI CENTRAL</option>
                                                        <option value="MUNDAKKAYAM">MUNDAKKAYAM</option>
                                                        <option value="MUNGELI">MUNGELI</option>
                                                        <option value="MUNGER JAMALPUR">MUNGER JAMALPUR</option>
                                                        <option value="MUNIGUDA">MUNIGUDA</option>
                                                        <option value="MUNNAR">MUNNAR</option>
                                                        <option value="MURI">MURI</option>
                                                        <option value="MUSSOORIE">MUSSOORIE</option>
                                                        <option value="MUVATTUPUZHA">MUVATTUPUZHA</option>
                                                        <option value="MUZAFFARPUR">MUZAFFARPUR</option>
                                                        <option value="MYSORE">MYSORE</option>
                                                        <option value="NABARANGPUR">NABARANGPUR</option>
                                                        <option value="NABHA">NABHA</option>
                                                        <option value="NAGAPATTINAM">NAGAPATTINAM</option>
                                                        <option value="NAGARJUNASAGAR">NAGARJUNASAGAR</option>
                                                        <option value="NAGARKURNOOL">NAGARKURNOOL</option>
                                                        <option value="NAGAUR">NAGAUR</option>
                                                        <option value="NAGERCOIL EAST">NAGERCOIL EAST</option>
                                                        <option value="NAGERCOIL NORTH">NAGERCOIL NORTH</option>
                                                        <option value="NAGERCOIL SOUTH">NAGERCOIL SOUTH</option>
                                                        <option value="NAGERCOIL WEST">NAGERCOIL WEST</option>
                                                        <option value="NAGPUR AJANI">NAGPUR AJANI</option>
                                                        <option value="NAGPUR KAMPTEE">NAGPUR KAMPTEE</option>
                                                        <option value="NAGPUR MANKAPUR">NAGPUR MANKAPUR</option>
                                                        <option value="NAGPUR WADI">NAGPUR WADI</option>
                                                        <option value="NAHARLAGUN">NAHARLAGUN</option>
                                                        <option value="NAIDUPETA">NAIDUPETA</option>
                                                        <option value="NAIGAON">NAIGAON</option>
                                                        <option value="NAINI">NAINI</option>
                                                        <option value="NAINITAL">NAINITAL</option>
                                                        <option value="NAINPUR">NAINPUR</option>
                                                        <option value="NAKREKAL">NAKREKAL</option>
                                                        <option value="NALAGARH">NALAGARH</option>
                                                        <option value="NALANDA">NALANDA</option>
                                                        <option value="NALGONDA">NALGONDA</option>
                                                        <option value="NALGONDA SOUTH">NALGONDA SOUTH</option>
                                                        <option value="NALLASOPARA">NALLASOPARA</option>
                                                        <option value="NAMAKKAL">NAMAKKAL</option>
                                                        <option value="NAMCHI">NAMCHI</option>
                                                        <option value="NAMKUM">NAMKUM</option>
                                                        <option value="NANDED">NANDED</option>
                                                        <option value="NANDIGAMA">NANDIGAMA</option>
                                                        <option value="NANDURBAR">NANDURBAR</option>
                                                        <option value="NANDYAL">NANDYAL</option>
                                                        <option value="NARASARAOPET">NARASARAOPET</option>
                                                        <option value="NARAYANPUR">NARAYANPUR</option>
                                                        <option value="NARSAPUR MEDAK">NARSAPUR MEDAK</option>
                                                        <option value="NARSAPURAM">NARSAPURAM</option>
                                                        <option value="NARSINGPUR">NARSINGPUR</option>
                                                        <option value="NARSIPATNAM">NARSIPATNAM</option>
                                                        <option value="NASHIK">NASHIK</option>
                                                        <option value="NAVAPUR">NAVAPUR</option>
                                                        <option value="NAWADA">NAWADA</option>
                                                        <option value="NAWAN SHAHR">NAWAN SHAHR</option>
                                                        <option value="NAXALBARI">NAXALBARI</option>
                                                        <option value="NAZARETH">NAZARETH</option>
                                                        <option value="NEDUMANGADU">NEDUMANGADU</option>
                                                        <option value="NEEMUCH">NEEMUCH</option>
                                                        <option value="NELLIMOODU">NELLIMOODU</option>
                                                        <option value="NELLORE">NELLORE</option>
                                                        <option value="NELYADI">NELYADI</option>
                                                        <option value="NERUL">NERUL</option>
                                                        <option value="NEW DELHI">NEW DELHI</option>
                                                        <option value="NEYATTINKARA">NEYATTINKARA</option>
                                                        <option value="NEYVELI">NEYVELI</option>
                                                        <option value="NIDADAVOLU">NIDADAVOLU</option>
                                                        <option value="NIDUBROLU">NIDUBROLU</option>
                                                        <option value="NIGDI">NIGDI</option>
                                                        <option value="NIRMAL">NIRMAL</option>
                                                        <option value="NIULAND">NIULAND</option>
                                                        <option value="NIZAMABAD">NIZAMABAD</option>
                                                        <option value="NOIDA">NOIDA</option>
                                                        <option value="NONGPOH">NONGPOH</option>
                                                        <option value="NONGSTOIN">NONGSTOIN</option>
                                                        <option value="NORTH VANLAIPHAI">NORTH VANLAIPHAI</option>
                                                        <option value="NOWROZABAD">NOWROZABAD</option>
                                                        <option value="NUZVID">NUZVID</option>
                                                        <option value="ODDANCHATRAM">ODDANCHATRAM</option>
                                                        <option value="OLAVAKKOD">OLAVAKKOD</option>
                                                        <option value="ONGOLE">ONGOLE</option>
                                                        <option value="PADERU">PADERU</option>
                                                        <option value="PADHAR">PADHAR</option>
                                                        <option value="PAKUR - HIRANPUR">PAKUR - HIRANPUR</option>
                                                        <option value="PALAKONDA">PALAKONDA</option>
                                                        <option value="PALAMPUR">PALAMPUR</option>
                                                        <option value="PALGHAT">PALGHAT</option>
                                                        <option value="PALI MARWAR">PALI MARWAR</option>
                                                        <option value="PALLEL">PALLEL</option>
                                                        <option value="PALONCHA">PALONCHA</option>
                                                        <option value="PANCHKULA">PANCHKULA</option>
                                                        <option value="PANDALAM">PANDALAM</option>
                                                        <option value="PANIPAT">PANIPAT</option>
                                                        <option value="PANVEL">PANVEL</option>
                                                        <option value="PARALAKHEMUNDI">PARALAKHEMUNDI</option>
                                                        <option value="PARAMAKUDI">PARAMAKUDI</option>
                                                        <option value="PARASSALA">PARASSALA</option>
                                                        <option value="PARBHANI">PARBHANI</option>
                                                        <option value="PARVATHIPURAM">PARVATHIPURAM</option>
                                                        <option value="PASIGHAT">PASIGHAT</option>
                                                        <option value="PATHALGAON">PATHALGAON</option>
                                                        <option value="PATHANAMTHITTA">PATHANAMTHITTA</option>
                                                        <option value="PATHANAPURAM">PATHANAPURAM</option>
                                                        <option value="PATHANKOT">PATHANKOT</option>
                                                        <option value="PATHAPATNAM">PATHAPATNAM</option>
                                                        <option value="PATIALA">PATIALA</option>
                                                        <option value="PATNA">PATNA</option>
                                                        <option value="PATNA WEST">PATNA WEST</option>
                                                        <option value="PAURI GARWHAL">PAURI GARWHAL</option>
                                                        <option value="PAVATHIYANVILA">PAVATHIYANVILA</option>
                                                        <option value="PAYANNUR">PAYANNUR</option>
                                                        <option value="PAYYAPADY">PAYYAPADY</option>
                                                        <option value="PEDDAPALLI">PEDDAPALLI</option>
                                                        <option value="PEHOWA">PEHOWA</option>
                                                        <option value="PENDRA ROAD">PENDRA ROAD</option>
                                                        <option value="PENNAGARAM">PENNAGARAM</option>
                                                        <option value="PERAMBALUR">PERAMBALUR</option>
                                                        <option value="PEREN">PEREN</option>
                                                        <option value="PERUMBAVOOR">PERUMBAVOOR</option>
                                                        <option value="PFIITSERO">PFIITSERO</option>
                                                        <option value="PHEK">PHEK</option>
                                                        <option value="PHILLAUR">PHILLAUR</option>
                                                        <option value="PHULBANI">PHULBANI</option>
                                                        <option value="PIDUGURALLA">PIDUGURALLA</option>
                                                        <option value="PILER">PILER</option>
                                                        <option value="PILIBHIT">PILIBHIT</option>
                                                        <option value="PIMPRI">PIMPRI</option>
                                                        <option value="PINJOR - KALKA">PINJOR - KALKA</option>
                                                        <option value="PIPARIA">PIPARIA</option>
                                                        <option value="PIRAVAM">PIRAVAM</option>
                                                        <option value="PISKA NAGRI ITKI">PISKA NAGRI ITKI</option>
                                                        <option value="PITHAPURAM">PITHAPURAM</option>
                                                        <option value="PITHORAGARH">PITHORAGARH</option>
                                                        <option value="PODILI">PODILI</option>
                                                        <option value="POLLACHI">POLLACHI</option>
                                                        <option value="PONDICHERRY">PONDICHERRY</option>
                                                        <option value="PONKUNNAM">PONKUNNAM</option>
                                                        <option value="POONA CENTRAL">POONA CENTRAL</option>
                                                        <option value="POONTHURA">POONTHURA</option>
                                                        <option value="PORBANDAR">PORBANDAR</option>
                                                        <option value="PORT BLAIR">PORT BLAIR</option>
                                                        <option value="POWAI">POWAI</option>
                                                        <option value="PRATAPGARH">PRATAPGARH</option>
                                                        <option value="PRODDATUR">PRODDATUR</option>
                                                        <option value="PUDUKOTTAI">PUDUKOTTAI</option>
                                                        <option value="PULIVENDLA">PULIVENDLA</option>
                                                        <option value="PUNALUR">PUNALUR</option>
                                                        <option value="PUNGANUR">PUNGANUR</option>
                                                        <option value="PURI">PURI</option>
                                                        <option value="PURNIA">PURNIA</option>
                                                        <option value="PUTHUPPADY">PUTHUPPADY</option>
                                                        <option value="PUTTUR">PUTTUR</option>
                                                        <option value="PUTTUR DK">PUTTUR DK</option>
                                                        <option value="QUILON">QUILON</option>
                                                        <option value="RAEBARELI">RAEBARELI</option>
                                                        <option value="RAHATA-RAHURI">RAHATA-RAHURI</option>
                                                        <option value="RAICHUR">RAICHUR</option>
                                                        <option value="RAIGARH">RAIGARH</option>
                                                        <option value="RAIKIA">RAIKIA</option>
                                                        <option value="RAIPUR">RAIPUR</option>
                                                        <option value="RAJAMUNDRY">RAJAMUNDRY</option>
                                                        <option value="RAJAPALAYAM">RAJAPALAYAM</option>
                                                        <option value="RAJGANGPUR">RAJGANGPUR</option>
                                                        <option value="RAJKOT">RAJKOT</option>
                                                        <option value="RAJNANDGAON">RAJNANDGAON</option>
                                                        <option value="RAJPURA">RAJPURA</option>
                                                        <option value="RAJSAMAND">RAJSAMAND</option>
                                                        <option value="RAMACHANDRAPURAM">RAMACHANDRAPURAM</option>
                                                        <option value="RAMANATHAPURAM">RAMANATHAPURAM</option>
                                                        <option value="RAMAYAMPET">RAMAYAMPET</option>
                                                        <option value="RAMESWARAM">RAMESWARAM</option>
                                                        <option value="RAMGARH-BARKHAKANA">RAMGARH-BARKHAKANA</option>
                                                        <option value="RAMPACHODAVARAM">RAMPACHODAVARAM</option>
                                                        <option value="RAMPUR">RAMPUR</option>
                                                        <option value="RAMPUR BUSHAHR">RAMPUR BUSHAHR</option>
                                                        <option value="RANCHI">RANCHI</option>
                                                        <option value="RANCHI SOUTH">RANCHI SOUTH</option>
                                                        <option value="RANGAPARA">RANGAPARA</option>
                                                        <option value="RANIPET">RANIPET</option>
                                                        <option value="RANNI">RANNI</option>
                                                        <option value="RANNI NORTH WEST">RANNI NORTH WEST</option>
                                                        <option value="RASIPURAM">RASIPURAM</option>
                                                        <option value="RATIA CITY">RATIA CITY</option>
                                                        <option value="RATLAM">RATLAM</option>
                                                        <option value="RATNAGIRI">RATNAGIRI</option>
                                                        <option value="RAVULAPALEM">RAVULAPALEM</option>
                                                        <option value="RAXAUL">RAXAUL</option>
                                                        <option value="RAYACHOTI">RAYACHOTI</option>
                                                        <option value="RAYAGADA">RAYAGADA</option>
                                                        <option value="RAZOLE">RAZOLE</option>
                                                        <option value="RENUKOOT ANPARA">RENUKOOT ANPARA</option>
                                                        <option value="REPALLE">REPALLE</option>
                                                        <option value="RESUBELPARA">RESUBELPARA</option>
                                                        <option value="REWA">REWA</option>
                                                        <option value="ROHTAK">ROHTAK</option>
                                                        <option value="ROING">ROING</option>
                                                        <option value="ROORKEE">ROORKEE</option>
                                                        <option value="ROPAR">ROPAR</option>
                                                        <option value="RORHU">RORHU</option>
                                                        <option value="ROURKELA">ROURKELA</option>
                                                        <option value="RUDRAPRAYAG">RUDRAPRAYAG</option>
                                                        <option value="RUDRAPUR">RUDRAPUR</option>
                                                        <option value="RUPAIDIHA">RUPAIDIHA</option>
                                                        <option value="SABROOM">SABROOM</option>
                                                        <option value="SAGAR C">SAGAR C</option>
                                                        <option value="SAGAR K">SAGAR K</option>
                                                        <option value="SAHARANPUR">SAHARANPUR</option>
                                                        <option value="SAIDABAD">SAIDABAD</option>
                                                        <option value="SALEM">SALEM</option>
                                                        <option value="SALUR">SALUR</option>
                                                        <option value="SAMALKOT">SAMALKOT</option>
                                                        <option value="SAMBA">SAMBA</option>
                                                        <option value="SAMBALPUR">SAMBALPUR</option>
                                                        <option value="SAMSI">SAMSI</option>
                                                        <option value="SANATHNAGAR">SANATHNAGAR</option>
                                                        <option value="SANGAMNER">SANGAMNER</option>
                                                        <option value="SANGAREDDY">SANGAREDDY</option>
                                                        <option value="SANGLI">SANGLI</option>
                                                        <option value="SANGRUR">SANGRUR</option>
                                                        <option value="SANKARANKOVIL">SANKARANKOVIL</option>
                                                        <option value="SANKESHWAR">SANKESHWAR</option>
                                                        <option value="SANTIR BAZAR">SANTIR BAZAR</option>
                                                        <option value="SARNI">SARNI</option>
                                                        <option value="SATARA">SATARA</option>
                                                        <option value="SATHUPALLI">SATHUPALLI</option>
                                                        <option value="SATHUR">SATHUR</option>
                                                        <option value="SATNA">SATNA</option>
                                                        <option value="SATTENAPALLI">SATTENAPALLI</option>
                                                        <option value="SAWAI MADHOPUR">SAWAI MADHOPUR</option>
                                                        <option value="SECUNDERABAD">SECUNDERABAD</option>
                                                        <option value="SENAPATI">SENAPATI</option>
                                                        <option value="SEONI">SEONI</option>
                                                        <option value="SERCHHIP">SERCHHIP</option>
                                                        <option value="SHADNAGAR">SHADNAGAR</option>
                                                        <option value="SHAHDOL">SHAHDOL</option>
                                                        <option value="SHAHJAHANPUR">SHAHJAHANPUR</option>
                                                        <option value="SHAMIRPET">SHAMIRPET</option>
                                                        <option value="SHAMSHABAD">SHAMSHABAD</option>
                                                        <option value="SHILLONG EAST">SHILLONG EAST</option>
                                                        <option value="SHILLONG NORTH">SHILLONG NORTH</option>
                                                        <option value="SHILLONG SOUTH">SHILLONG SOUTH</option>
                                                        <option value="SHIMLA">SHIMLA</option>
                                                        <option value="SHIMOGA">SHIMOGA</option>
                                                        <option value="SHORNUR">SHORNUR</option>
                                                        <option value="SHREERAMPUR">SHREERAMPUR</option>
                                                        <option value="SIAHA">SIAHA</option>
                                                        <option value="SIBSAGAR">SIBSAGAR</option>
                                                        <option value="SIDDIPETA">SIDDIPETA</option>
                                                        <option value="SIKAR">SIKAR</option>
                                                        <option value="SILCHAR">SILCHAR</option>
                                                        <option value="SILIGURI">SILIGURI</option>
                                                        <option value="SIMDEGA">SIMDEGA</option>
                                                        <option value="SINDHUDURG">SINDHUDURG</option>
                                                        <option value="SINGRAULI">SINGRAULI</option>
                                                        <option value="SINGTAM">SINGTAM</option>
                                                        <option value="SIROHI">SIROHI</option>
                                                        <option value="SITAPUR (CHATTISGARH)">SITAPUR (CHATTISGARH)</option>
                                                        <option value="SITAPUR (UTTAR PRADESH)">SITAPUR (UTTAR PRADESH)</option>
                                                        <option value="SIVAGANGAI">SIVAGANGAI</option>
                                                        <option value="SIVAKASI">SIVAKASI</option>
                                                        <option value="SIWAN">SIWAN</option>
                                                        <option value="SOLAN">SOLAN</option>
                                                        <option value="SOLAPUR">SOLAPUR</option>
                                                        <option value="SONARI">SONARI</option>
                                                        <option value="SONBHADRA">SONBHADRA</option>
                                                        <option value="SONEPAT">SONEPAT</option>
                                                        <option value="SONGADH">SONGADH</option>
                                                        <option value="SRIGANGANAGAR">SRIGANGANAGAR</option>
                                                        <option value="SRIKAKULAM">SRIKAKULAM</option>
                                                        <option value="SRIKALAHASTI">SRIKALAHASTI</option>
                                                        <option value="SRINAGAR">SRINAGAR</option>
                                                        <option value="SUKMA">SUKMA</option>
                                                        <option value="SUKUMA">SUKUMA</option>
                                                        <option value="SULLURUPET">SULLURUPET</option>
                                                        <option value="SULTAN BATHERY">SULTAN BATHERY</option>
                                                        <option value="SUNABEDA">SUNABEDA</option>
                                                        <option value="SUNDARGARH">SUNDARGARH</option>
                                                        <option value="SUNDERNAGAR">SUNDERNAGAR</option>
                                                        <option value="SURANDAI">SURANDAI</option>
                                                        <option value="SURAT">SURAT</option>
                                                        <option value="SURENDRANAGAR">SURENDRANAGAR</option>
                                                        <option value="SURYAPET">SURYAPET</option>
                                                        <option value="SURYAPET NORTH">SURYAPET NORTH</option>
                                                        <option value="SURYAPET SOUTH">SURYAPET SOUTH</option>
                                                        <option value="TADEPALLEGUDEM">TADEPALLEGUDEM</option>
                                                        <option value="TADPATRI">TADPATRI</option>
                                                        <option value="TAMBARAM">TAMBARAM</option>
                                                        <option value="TAMENGLONG">TAMENGLONG</option>
                                                        <option value="TANAKPUR">TANAKPUR</option>
                                                        <option value="TANDA">TANDA</option>
                                                        <option value="TANUKU">TANUKU</option>
                                                        <option value="TARAN-TARAN">TARAN-TARAN</option>
                                                        <option value="TENALI">TENALI</option>
                                                        <option value="TENKASI">TENKASI</option>
                                                        <option value="TEZPUR">TEZPUR</option>
                                                        <option value="TEZU">TEZU</option>
                                                        <option value="THANE">THANE</option>
                                                        <option value="THANJAVUR">THANJAVUR</option>
                                                        <option value="THENI">THENI</option>
                                                        <option value="THENZAWL">THENZAWL</option>
                                                        <option value="THIDANADU">THIDANADU</option>
                                                        <option value="THIRUKOILUR">THIRUKOILUR</option>
                                                        <option value="THIRUMALA">THIRUMALA</option>
                                                        <option value="THIRUVALLUR">THIRUVALLUR</option>
                                                        <option value="THIRUVARUR">THIRUVARUR</option>
                                                        <option value="THODUPUZHA">THODUPUZHA</option>
                                                        <option value="THUNGATHURTHY">THUNGATHURTHY</option>
                                                        <option value="TILDA">TILDA</option>
                                                        <option value="TINDIVANAM">TINDIVANAM</option>
                                                        <option value="TINSUKIA">TINSUKIA</option>
                                                        <option value="TIRUCHENDUR">TIRUCHENDUR</option>
                                                        <option value="TIRUCHENGODU">TIRUCHENGODU</option>
                                                        <option value="TIRUCHIRAPALLY">TIRUCHIRAPALLY</option>
                                                        <option value="TIRUNELVELI NORTH">TIRUNELVELI NORTH</option>
                                                        <option value="TIRUNELVELI SOUTH">TIRUNELVELI SOUTH</option>
                                                        <option value="TIRUPATHI">TIRUPATHI</option>
                                                        <option value="TIRUPATTUR">TIRUPATTUR</option>
                                                        <option value="TIRUPUR">TIRUPUR</option>
                                                        <option value="TIRUVALLA">TIRUVALLA</option>
                                                        <option value="TIRUVANNAMALAI">TIRUVANNAMALAI</option>
                                                        <option value="TIRUVURU">TIRUVURU</option>
                                                        <option value="TITLAGARH">TITLAGARH</option>
                                                        <option value="TONK">TONK</option>
                                                        <option value="TRANQUEBAR">TRANQUEBAR</option>
                                                        <option value="TRICHUR">TRICHUR</option>
                                                        <option value="TRICHUR CENTRAL">TRICHUR CENTRAL</option>
                                                        <option value="TRIPUNITHURA">TRIPUNITHURA</option>
                                                        <option value="TRIVANDRUM EAST">TRIVANDRUM EAST</option>
                                                        <option value="TRIVANDRUM NORTH">TRIVANDRUM NORTH</option>
                                                        <option value="TRIVANDRUM SECRETARIAT">TRIVANDRUM SECRETARIAT</option>
                                                        <option value="TRIVANDRUM SOUTH">TRIVANDRUM SOUTH</option>
                                                        <option value="TRIVANDRUM TECHNO">TRIVANDRUM TECHNO</option>
                                                        <option value="TRIVANDRUM WEST">TRIVANDRUM WEST</option>
                                                        <option value="TSEMINYU">TSEMINYU</option>
                                                        <option value="TUENSANG">TUENSANG</option>
                                                        <option value="TUMKUR">TUMKUR</option>
                                                        <option value="TUNI">TUNI</option>
                                                        <option value="TURA">TURA</option>
                                                        <option value="TUTICORIN">TUTICORIN</option>
                                                        <option value="UDAIPUR">UDAIPUR</option>
                                                        <option value="UDAIPUR-T">UDAIPUR-T</option>
                                                        <option value="UDALGURI">UDALGURI</option>
                                                        <option value="UDAYAGIRI">UDAYAGIRI</option>
                                                        <option value="UDGIR">UDGIR</option>
                                                        <option value="UDHAMPUR">UDHAMPUR</option>
                                                        <option value="UDUMALPET">UDUMALPET</option>
                                                        <option value="UDUPI">UDUPI</option>
                                                        <option value="UJJAIN">UJJAIN</option>
                                                        <option value="UKHRUL">UKHRUL</option>
                                                        <option value="ULHAS NAGAR">ULHAS NAGAR</option>
                                                        <option value="UNA - NANGAL">UNA - NANGAL</option>
                                                        <option value="UNNAO">UNNAO</option>
                                                        <option value="UPPAL">UPPAL</option>
                                                        <option value="URIACODE">URIACODE</option>
                                                        <option value="UTHANGARAI">UTHANGARAI</option>
                                                        <option value="UTRAULA">UTRAULA</option>
                                                        <option value="VADALA">VADALA</option>
                                                        <option value="VADASERIKARA">VADASERIKARA</option>
                                                        <option value="VALAKAM">VALAKAM</option>
                                                        <option value="VALLIYOOR">VALLIYOOR</option>
                                                        <option value="VALPARAI">VALPARAI</option>
                                                        <option value="VALSAD">VALSAD</option>
                                                        <option value="VANASTHALIPURAM">VANASTHALIPURAM</option>
                                                        <option value="VANNIYACODE">VANNIYACODE</option>
                                                        <option value="VAPI">VAPI</option>
                                                        <option value="VARANASI">VARANASI</option>
                                                        <option value="VASAI">VASAI</option>
                                                        <option value="VASHI">VASHI</option>
                                                        <option value="VATTAPPARA">VATTAPPARA</option>
                                                        <option value="VATTIYOORKAVU">VATTIYOORKAVU</option>
                                                        <option value="VECHOOCHIRA">VECHOOCHIRA</option>
                                                        <option value="VELLARADA">VELLARADA</option>
                                                        <option value="VELLORE">VELLORE</option>
                                                        <option value="VERAVAL">VERAVAL</option>
                                                        <option value="VIJAYAWADA">VIJAYAWADA</option>
                                                        <option value="VIJAYAWADA EAST">VIJAYAWADA EAST</option>
                                                        <option value="VILLUPURAM">VILLUPURAM</option>
                                                        <option value="VINUKONDA">VINUKONDA</option>
                                                        <option value="VIRAR">VIRAR</option>
                                                        <option value="VIRUDHNAGAR">VIRUDHNAGAR</option>
                                                        <option value="VISHAKHAPATNAM NORTH">VISHAKHAPATNAM NORTH</option>
                                                        <option value="VISHAKHAPATNAM SOUTH">VISHAKHAPATNAM SOUTH</option>
                                                        <option value="VISHRANTWADI">VISHRANTWADI</option>
                                                        <option value="VISSANNAPETA">VISSANNAPETA</option>
                                                        <option value="VITHURA">VITHURA</option>
                                                        <option value="VIZHINJAM">VIZHINJAM</option>
                                                        <option value="VIZIANAGARAM">VIZIANAGARAM</option>
                                                        <option value="VUYYURU">VUYYURU</option>
                                                        <option value="WANAPARTHY">WANAPARTHY</option>
                                                        <option value="WANOWRIE">WANOWRIE</option>
                                                        <option value="WARANGAL">WARANGAL</option>
                                                        <option value="WARDHA">WARDHA</option>
                                                        <option value="WASHIM">WASHIM</option>
                                                        <option value="WILLIAMNAGAR">WILLIAMNAGAR</option>
                                                        <option value="WOKHA">WOKHA</option>
                                                        <option value="YADGIR">YADGIR</option>
                                                        <option value="YAMUNANAGAR">YAMUNANAGAR</option>
                                                        <option value="YAVATMAL">YAVATMAL</option>
                                                        <option value="YELLANDU">YELLANDU</option>
                                                        <option value="YEMMIGANUR">YEMMIGANUR</option>
                                                        <option value="YERCAUD">YERCAUD</option>
                                                        <option value="ZAHEERABAD">ZAHEERABAD</option>
                                                        <option value="ZIRAKPUR">ZIRAKPUR</option>
                                                        <option value="ZIRO">ZIRO</option>
                                                        <option value="ZUNHEBOTO">ZUNHEBOTO</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="references" style="background-color: rgb(224, 248, 247);">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; height: 30px;">
                                        <font style="font-size: 13px; font-weight: bold; color: brown">References : </font>&nbsp;
                                        <font style="font-size: 12px; font-weight: bold;">Please give names and contact details of 2 Christian business/professional men (preferably Gideons) who know you well</font>
                                    </legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-3" id="ref1namediv">
                                                <label for="trno">Reference 1 : Name *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="ref1name" id="ref1name" style="font-size: 12px;" placeholder="..Reference 1 Name" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="ref1phonediv">
                                                <label for="trno">Reference 1 : Phone *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input inputmode="numeric" class="form-control" name="ref1phone" id="ref1phone" style="font-size: 12px;" maxlength="10" placeholder="..Reference 1 Phone/Mobile No" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="ref1campdiv">
                                                <label for="trno">Reference 1 : Camp</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <select name="ref1camp" id="ref1camp" class="form-control" style="font-size: 12px;">
                                                        <option value="0">-- Select Camp --</option>
                                                        <option value="AALO">AALO</option>
                                                        <option value="ACHAMPET">ACHAMPET</option>
                                                        <option value="ADDA KATHAR JALANDHAR">ADDA KATHAR JALANDHAR</option>
                                                        <option value="ADILABAD">ADILABAD</option>
                                                        <option value="ADITYAPUR">ADITYAPUR</option>
                                                        <option value="ADONI">ADONI</option>
                                                        <option value="ADOOR">ADOOR</option>
                                                        <option value="AGARTALA">AGARTALA</option>
                                                        <option value="AGRA">AGRA</option>
                                                        <option value="AHMEDABAD CENTRAL">AHMEDABAD CENTRAL</option>
                                                        <option value="AHMEDABAD MANINAGAR">AHMEDABAD MANINAGAR</option>
                                                        <option value="AHMEDABAD WEST">AHMEDABAD WEST</option>
                                                        <option value="AHMEDNAGAR">AHMEDNAGAR</option>
                                                        <option value="AHWA">AHWA</option>
                                                        <option value="AIROLI">AIROLI</option>
                                                        <option value="AIZAWL EAST">AIZAWL EAST</option>
                                                        <option value="AIZAWL NORTH">AIZAWL NORTH</option>
                                                        <option value="AIZAWL SOUTH">AIZAWL SOUTH</option>
                                                        <option value="AIZAWL WEST">AIZAWL WEST</option>
                                                        <option value="AJMER">AJMER</option>
                                                        <option value="AKOLA">AKOLA</option>
                                                        <option value="ALAIR">ALAIR</option>
                                                        <option value="ALAKODE">ALAKODE</option>
                                                        <option value="ALIBAUG">ALIBAUG</option>
                                                        <option value="ALIGARH">ALIGARH</option>
                                                        <option value="ALIPURDUAR">ALIPURDUAR</option>
                                                        <option value="ALIRAJPUR">ALIRAJPUR</option>
                                                        <option value="ALLAHABAD">ALLAHABAD</option>
                                                        <option value="ALLEPPEY">ALLEPPEY</option>
                                                        <option value="ALMORA">ALMORA</option>
                                                        <option value="ALUVA">ALUVA</option>
                                                        <option value="ALWAL">ALWAL</option>
                                                        <option value="ALWAR">ALWAR</option>
                                                        <option value="AMALAPURAM">AMALAPURAM</option>
                                                        <option value="AMBABAR">AMBABAR</option>
                                                        <option value="AMBALA">AMBALA</option>
                                                        <option value="AMBASAMUDRAM">AMBASAMUDRAM</option>
                                                        <option value="AMBERNATH">AMBERNATH</option>
                                                        <option value="AMBIKAPUR">AMBIKAPUR</option>
                                                        <option value="AMBUR">AMBUR</option>
                                                        <option value="AMLAI">AMLAI</option>
                                                        <option value="AMPATI">AMPATI</option>
                                                        <option value="AMRAVATI">AMRAVATI</option>
                                                        <option value="AMRITSAR">AMRITSAR</option>
                                                        <option value="ANAKAPALLE">ANAKAPALLE</option>
                                                        <option value="ANAND">ANAND</option>
                                                        <option value="ANANTAPUR">ANANTAPUR</option>
                                                        <option value="ANCHAL">ANCHAL</option>
                                                        <option value="ANDHERI">ANDHERI</option>
                                                        <option value="ANGAMALI">ANGAMALI</option>
                                                        <option value="ANGUL">ANGUL</option>
                                                        <option value="ANKLESHWAR">ANKLESHWAR</option>
                                                        <option value="ANNI">ANNI</option>
                                                        <option value="ARAKKONAM">ARAKKONAM</option>
                                                        <option value="ARAKU">ARAKU</option>
                                                        <option value="ARARIA">ARARIA</option>
                                                        <option value="ARCOT">ARCOT</option>
                                                        <option value="ARIYALUR">ARIYALUR</option>
                                                        <option value="ARMOOR">ARMOOR</option>
                                                        <option value="ARRAH">ARRAH</option>
                                                        <option value="ARUMUGANERI">ARUMUGANERI</option>
                                                        <option value="ARUPPUKOTTAI">ARUPPUKOTTAI</option>
                                                        <option value="ARYANAD">ARYANAD</option>
                                                        <option value="ASANSOL">ASANSOL</option>
                                                        <option value="ATHIKAYAM">ATHIKAYAM</option>
                                                        <option value="ATHMAKUR">ATHMAKUR</option>
                                                        <option value="ATMAKUR KNL">ATMAKUR KNL</option>
                                                        <option value="ATTINGAL">ATTINGAL</option>
                                                        <option value="ATTUR">ATTUR</option>
                                                        <option value="AURANGABAD">AURANGABAD</option>
                                                        <option value="AVADI">AVADI</option>
                                                        <option value="AYINKAMAM">AYINKAMAM</option>
                                                        <option value="AYUR">AYUR</option>
                                                        <option value="AZAMGARH">AZAMGARH</option>
                                                        <option value="BADAUN">BADAUN</option>
                                                        <option value="BADLAPUR">BADLAPUR</option>
                                                        <option value="BADVEL">BADVEL</option>
                                                        <option value="BAHRAICH">BAHRAICH</option>
                                                        <option value="BAIKUNTHPUR">BAIKUNTHPUR</option>
                                                        <option value="BAILADILA">BAILADILA</option>
                                                        <option value="BAKALIA">BAKALIA</option>
                                                        <option value="BALAGHAT">BALAGHAT</option>
                                                        <option value="BALARAMAPURAM">BALARAMAPURAM</option>
                                                        <option value="BALASORE">BALASORE</option>
                                                        <option value="BALIGUDA">BALIGUDA</option>
                                                        <option value="BALLARSHA">BALLARSHA</option>
                                                        <option value="BALLIA">BALLIA</option>
                                                        <option value="BANDA">BANDA</option>
                                                        <option value="BANGALORE BOMMANAHALLI">BANGALORE BOMMANAHALLI</option>
                                                        <option value="BANGALORE CENTRAL">BANGALORE CENTRAL</option>
                                                        <option value="BANGALORE CHANDAPURA">BANGALORE CHANDAPURA</option>
                                                        <option value="BANGALORE ELECTRONIC CITY">BANGALORE ELECTRONIC CITY</option>
                                                        <option value="BANGALORE HOSA ROAD">BANGALORE HOSA ROAD</option>
                                                        <option value="BANGALORE KORAMANGALA">BANGALORE KORAMANGALA</option>
                                                        <option value="BANGALORE NORTH">BANGALORE NORTH</option>
                                                        <option value="BANGALORE NORTH EAST">BANGALORE NORTH EAST</option>
                                                        <option value="BANGALORE PEENYA">BANGALORE PEENYA</option>
                                                        <option value="BANGALORE RAJAJI NAGAR">BANGALORE RAJAJI NAGAR</option>
                                                        <option value="BANGALORE RT NAGAR">BANGALORE RT NAGAR</option>
                                                        <option value="BANGALORE SOUTH">BANGALORE SOUTH</option>
                                                        <option value="BANGALORE SOUTH EAST">BANGALORE SOUTH EAST</option>
                                                        <option value="BANGALORE WHITEFIELD">BANGALORE WHITEFIELD</option>
                                                        <option value="BANGALORE YELAHANKA">BANGALORE YELAHANKA</option>
                                                        <option value="BANGALORE-RR NAGAR AND KENGERI">BANGALORE-RR NAGAR AND KENGERI</option>
                                                        <option value="BANKURA">BANKURA</option>
                                                        <option value="BANSWARA">BANSWARA</option>
                                                        <option value="BAPATLA">BAPATLA</option>
                                                        <option value="BAR-E-BRAHMANA">BAR-E-BRAHMANA</option>
                                                        <option value="BARABANKI">BARABANKI</option>
                                                        <option value="BARAMATI">BARAMATI</option>
                                                        <option value="BARAN">BARAN</option>
                                                        <option value="BAREILLEY">BAREILLEY</option>
                                                        <option value="BARGARH">BARGARH</option>
                                                        <option value="BARH">BARH</option>
                                                        <option value="BARHARWA">BARHARWA</option>
                                                        <option value="BARMER">BARMER</option>
                                                        <option value="BARNALA">BARNALA</option>
                                                        <option value="BARODA">BARODA</option>
                                                        <option value="BARWANI">BARWANI</option>
                                                        <option value="BATALA">BATALA</option>
                                                        <option value="BATHINDA">BATHINDA</option>
                                                        <option value="BEAWAR">BEAWAR</option>
                                                        <option value="BEGUSARAI">BEGUSARAI</option>
                                                        <option value="BELGAUM">BELGAUM</option>
                                                        <option value="BELLARY">BELLARY</option>
                                                        <option value="BELUR">BELUR</option>
                                                        <option value="BENAULIM">BENAULIM</option>
                                                        <option value="BERHAMPUR">BERHAMPUR</option>
                                                        <option value="BETTIAH">BETTIAH</option>
                                                        <option value="BETUL">BETUL</option>
                                                        <option value="BHADOHI">BHADOHI</option>
                                                        <option value="BHADRACHALAM">BHADRACHALAM</option>
                                                        <option value="BHADRAK">BHADRAK</option>
                                                        <option value="BHADRAVATI">BHADRAVATI</option>
                                                        <option value="BHAGALPUR">BHAGALPUR</option>
                                                        <option value="BHAMIANA KALANA">BHAMIANA KALANA</option>
                                                        <option value="BHANDARA">BHANDARA</option>
                                                        <option value="BHARATPUR">BHARATPUR</option>
                                                        <option value="BHARUCH">BHARUCH</option>
                                                        <option value="BHATAPARA">BHATAPARA</option>
                                                        <option value="BHAVANI">BHAVANI</option>
                                                        <option value="BHAVNAGAR">BHAVNAGAR</option>
                                                        <option value="BHAWANIPATNA">BHAWANIPATNA</option>
                                                        <option value="BHEL HYDERABAD">BHEL HYDERABAD</option>
                                                        <option value="BHILAI">BHILAI</option>
                                                        <option value="BHILWARA">BHILWARA</option>
                                                        <option value="BHIMAVARAM">BHIMAVARAM</option>
                                                        <option value="BHIMUNIPATNAM">BHIMUNIPATNAM</option>
                                                        <option value="BHIND">BHIND</option>
                                                        <option value="BHIRAKHERI">BHIRAKHERI</option>
                                                        <option value="BHOPAL">BHOPAL</option>
                                                        <option value="BHOPAL - BHEL">BHOPAL - BHEL</option>
                                                        <option value="BHUBANESHWAR">BHUBANESHWAR</option>
                                                        <option value="BHUJ">BHUJ</option>
                                                        <option value="BIDAR">BIDAR</option>
                                                        <option value="BIJAPUR">BIJAPUR</option>
                                                        <option value="BIJAPUR K">BIJAPUR K</option>
                                                        <option value="BIJNOR">BIJNOR</option>
                                                        <option value="BIKANER">BIKANER</option>
                                                        <option value="BILASPUR">BILASPUR</option>
                                                        <option value="BINA">BINA</option>
                                                        <option value="BIRAMITRAPUR">BIRAMITRAPUR</option>
                                                        <option value="BIRISINGPUR">BIRISINGPUR</option>
                                                        <option value="BISHNUPUR">BISHNUPUR</option>
                                                        <option value="BISHRAMPUR">BISHRAMPUR</option>
                                                        <option value="BISHWANATH">BISHWANATH</option>
                                                        <option value="BOBBILI">BOBBILI</option>
                                                        <option value="BODHAN">BODHAN</option>
                                                        <option value="BOKARO STEEL CITY">BOKARO STEEL CITY</option>
                                                        <option value="BOKARO THERMAL">BOKARO THERMAL</option>
                                                        <option value="BOLANGIR">BOLANGIR</option>
                                                        <option value="BOMDILA">BOMDILA</option>
                                                        <option value="BONGAIGAON">BONGAIGAON</option>
                                                        <option value="BORIO-SAHEBGANJ">BORIO-SAHEBGANJ</option>
                                                        <option value="BORIVILI">BORIVILI</option>
                                                        <option value="BORRA CAVES">BORRA CAVES</option>
                                                        <option value="BOWENPALLY">BOWENPALLY</option>
                                                        <option value="BRAJRAJNAGAR">BRAJRAJNAGAR</option>
                                                        <option value="BULANDSHAHR">BULANDSHAHR</option>
                                                        <option value="BULDHANA">BULDHANA</option>
                                                        <option value="BUNDI">BUNDI</option>
                                                        <option value="BUXAR">BUXAR</option>
                                                        <option value="CALCUTTA CENTRAL">CALCUTTA CENTRAL</option>
                                                        <option value="CALCUTTA NORTH">CALCUTTA NORTH</option>
                                                        <option value="CALCUTTA SOUTH">CALCUTTA SOUTH</option>
                                                        <option value="CALICUT">CALICUT</option>
                                                        <option value="CHAIBASA">CHAIBASA</option>
                                                        <option value="CHAKRADHARPUR">CHAKRADHARPUR</option>
                                                        <option value="CHAMARAJNAGAR">CHAMARAJNAGAR</option>
                                                        <option value="CHAMBA">CHAMBA</option>
                                                        <option value="CHAMPHAI">CHAMPHAI</option>
                                                        <option value="CHANDEL">CHANDEL</option>
                                                        <option value="CHANDIGARH">CHANDIGARH</option>
                                                        <option value="CHANDIGARH WEST">CHANDIGARH WEST</option>
                                                        <option value="CHANDRAPUR">CHANDRAPUR</option>
                                                        <option value="CHANDWA">CHANDWA</option>
                                                        <option value="CHANGANACHERRY">CHANGANACHERRY</option>
                                                        <option value="CHANGTONGYA">CHANGTONGYA</option>
                                                        <option value="CHARIMOODU">CHARIMOODU</option>
                                                        <option value="CHATRA">CHATRA</option>
                                                        <option value="CHEMBUR">CHEMBUR</option>
                                                        <option value="CHENGALPATTU">CHENGALPATTU</option>
                                                        <option value="CHENGANNUR">CHENGANNUR</option>
                                                        <option value="CHENNAI INFO">CHENNAI INFO</option>
                                                        <option value="CHERIAL">CHERIAL</option>
                                                        <option value="CHERTHALA">CHERTHALA</option>
                                                        <option value="CHHATARPUR">CHHATARPUR</option>
                                                        <option value="CHHINDWARA">CHHINDWARA</option>
                                                        <option value="CHICKMAGALUR">CHICKMAGALUR</option>
                                                        <option value="CHIDAMBARAM">CHIDAMBARAM</option>
                                                        <option value="CHILAKALURIPETA">CHILAKALURIPETA</option>
                                                        <option value="CHINTAPALLI">CHINTAPALLI</option>
                                                        <option value="CHIRALA">CHIRALA</option>
                                                        <option value="CHIRGAON">CHIRGAON</option>
                                                        <option value="CHIRMIRI">CHIRMIRI</option>
                                                        <option value="CHITRADURGA">CHITRADURGA</option>
                                                        <option value="CHITRANJAN">CHITRANJAN</option>
                                                        <option value="CHITTOOR">CHITTOOR</option>
                                                        <option value="CHITTORGARH">CHITTORGARH</option>
                                                        <option value="CHITTUR">CHITTUR</option>
                                                        <option value="CHUMUKEDIMA">CHUMUKEDIMA</option>
                                                        <option value="CHUNGATHARA">CHUNGATHARA</option>
                                                        <option value="CHURACHANDPUR">CHURACHANDPUR</option>
                                                        <option value="CHURACHANDPUR NORTH">CHURACHANDPUR NORTH</option>
                                                        <option value="COCHIN CENTRAL">COCHIN CENTRAL</option>
                                                        <option value="COCHIN INFO PARK">COCHIN INFO PARK</option>
                                                        <option value="COCHIN ISLANDS">COCHIN ISLANDS</option>
                                                        <option value="COCHIN VYTILLA">COCHIN VYTILLA</option>
                                                        <option value="COIMBATORE EAST">COIMBATORE EAST</option>
                                                        <option value="COIMBATORE NORTH">COIMBATORE NORTH</option>
                                                        <option value="COIMBATORE WEST">COIMBATORE WEST</option>
                                                        <option value="COONOOR">COONOOR</option>
                                                        <option value="CUDDALORE">CUDDALORE</option>
                                                        <option value="CUDDAPAH">CUDDAPAH</option>
                                                        <option value="CUTTACK">CUTTACK</option>
                                                        <option value="DADAR">DADAR</option>
                                                        <option value="DAHOD">DAHOD</option>
                                                        <option value="DALLI RAJHARA">DALLI RAJHARA</option>
                                                        <option value="DALTANGANJ">DALTANGANJ</option>
                                                        <option value="DALU">DALU</option>
                                                        <option value="DAMOH">DAMOH</option>
                                                        <option value="DAPORIJO">DAPORIJO</option>
                                                        <option value="DARBHANGA">DARBHANGA</option>
                                                        <option value="DARJEELING">DARJEELING</option>
                                                        <option value="DASUYA">DASUYA</option>
                                                        <option value="DAUND">DAUND</option>
                                                        <option value="DAVANGERE">DAVANGERE</option>
                                                        <option value="DEHRADUN">DEHRADUN</option>
                                                        <option value="DEHRI-ON-SONE">DEHRI-ON-SONE</option>
                                                        <option value="DEHU-TALEGAON">DEHU-TALEGAON</option>
                                                        <option value="DELHI BURARI">DELHI BURARI</option>
                                                        <option value="DELHI CENTRAL">DELHI CENTRAL</option>
                                                        <option value="DELHI DWARAKA">DELHI DWARAKA</option>
                                                        <option value="DELHI EAST">DELHI EAST</option>
                                                        <option value="DELHI NORTH">DELHI NORTH</option>
                                                        <option value="DELHI NORTH EAST">DELHI NORTH EAST</option>
                                                        <option value="DELHI NORTH WEST">DELHI NORTH WEST</option>
                                                        <option value="DELHI PUSHP VIHAR">DELHI PUSHP VIHAR</option>
                                                        <option value="DELHI ROHINI">DELHI ROHINI</option>
                                                        <option value="DELHI SARITA VIHAR">DELHI SARITA VIHAR</option>
                                                        <option value="DELHI SOUTH">DELHI SOUTH</option>
                                                        <option value="DELHI SOUTH WEST">DELHI SOUTH WEST</option>
                                                        <option value="DELHI VASANT KUNJ">DELHI VASANT KUNJ</option>
                                                        <option value="DELHI WEST">DELHI WEST</option>
                                                        <option value="DEOGHAR">DEOGHAR</option>
                                                        <option value="DERGANG">DERGANG</option>
                                                        <option value="DEVARAKONDA">DEVARAKONDA</option>
                                                        <option value="DEWAS">DEWAS</option>
                                                        <option value="DHALAI">DHALAI</option>
                                                        <option value="DHAMTARI">DHAMTARI</option>
                                                        <option value="DHANBAD">DHANBAD</option>
                                                        <option value="DHAR">DHAR</option>
                                                        <option value="DHARAMSHALA">DHARAMSHALA</option>
                                                        <option value="DHARIWAL">DHARIWAL</option>
                                                        <option value="DHARMAPURI">DHARMAPURI</option>
                                                        <option value="DHARMAVARAM">DHARMAVARAM</option>
                                                        <option value="DHARWAD">DHARWAD</option>
                                                        <option value="DHEMAJI">DHEMAJI</option>
                                                        <option value="DHOLPUR">DHOLPUR</option>
                                                        <option value="DHULE">DHULE</option>
                                                        <option value="DIBRUGARH">DIBRUGARH</option>
                                                        <option value="DIMAPUR EAST">DIMAPUR EAST</option>
                                                        <option value="DIMAPUR WEST">DIMAPUR WEST</option>
                                                        <option value="DINDIGUL">DINDIGUL</option>
                                                        <option value="DIPHU">DIPHU</option>
                                                        <option value="DOMBIVILI">DOMBIVILI</option>
                                                        <option value="DONGARGARH">DONGARGARH</option>
                                                        <option value="DORNAKAL">DORNAKAL</option>
                                                        <option value="DUMKA">DUMKA</option>
                                                        <option value="DUNGARPUR">DUNGARPUR</option>
                                                        <option value="DURGAPUR">DURGAPUR</option>
                                                        <option value="ECIL HYDERABAD">ECIL HYDERABAD</option>
                                                        <option value="EDAPALLY">EDAPALLY</option>
                                                        <option value="EDATHUA">EDATHUA</option>
                                                        <option value="ELURU">ELURU</option>
                                                        <option value="ELURU EAST">ELURU EAST</option>
                                                        <option value="ERAVIPEROOR">ERAVIPEROOR</option>
                                                        <option value="ERODE">ERODE</option>
                                                        <option value="ETAH">ETAH</option>
                                                        <option value="FAIZABAD">FAIZABAD</option>
                                                        <option value="FAMBONG-SOMBARIA">FAMBONG-SOMBARIA</option>
                                                        <option value="FARIDABAD">FARIDABAD</option>
                                                        <option value="FARIDKOT">FARIDKOT</option>
                                                        <option value="FARRUKHABAD">FARRUKHABAD</option>
                                                        <option value="FATEHGARH">FATEHGARH</option>
                                                        <option value="FATEHPUR">FATEHPUR</option>
                                                        <option value="FEROZPUR">FEROZPUR</option>
                                                        <option value="FORT COCHIN">FORT COCHIN</option>
                                                        <option value="G.UDAYAGIRI">G.UDAYAGIRI</option>
                                                        <option value="GADAG-BETGARI">GADAG-BETGARI</option>
                                                        <option value="GADCHANDUR">GADCHANDUR</option>
                                                        <option value="GADWAL">GADWAL</option>
                                                        <option value="GAJWEL">GAJWEL</option>
                                                        <option value="GANDHIDHAM">GANDHIDHAM</option>
                                                        <option value="GANDHINAGAR">GANDHINAGAR</option>
                                                        <option value="GANGTOK">GANGTOK</option>
                                                        <option value="GARHWA">GARHWA</option>
                                                        <option value="GAYA">GAYA</option>
                                                        <option value="GAYZING">GAYZING</option>
                                                        <option value="GHATKOPAR">GHATKOPAR</option>
                                                        <option value="GHATSILA-MUSABANI">GHATSILA-MUSABANI</option>
                                                        <option value="GHAZIABAD">GHAZIABAD</option>
                                                        <option value="GHAZIPUR">GHAZIPUR</option>
                                                        <option value="GHUGUS">GHUGUS</option>
                                                        <option value="GIDDALUR">GIDDALUR</option>
                                                        <option value="GIDEONS (ISOLATED PLACES)">GIDEONS (ISOLATED PLACES)</option>
                                                        <option value="GIRIDIH">GIRIDIH</option>
                                                        <option value="GOA MAPUSA">GOA MAPUSA</option>
                                                        <option value="GOA MARGAO">GOA MARGAO</option>
                                                        <option value="GOA PANJIM">GOA PANJIM</option>
                                                        <option value="GOA PONDA">GOA PONDA</option>
                                                        <option value="GOA VASCO">GOA VASCO</option>
                                                        <option value="GOALPARA">GOALPARA</option>
                                                        <option value="GOBICHETTIPALAYAM">GOBICHETTIPALAYAM</option>
                                                        <option value="GODDA MAHAGAMA">GODDA MAHAGAMA</option>
                                                        <option value="GODHRA">GODHRA</option>
                                                        <option value="GOKAK">GOKAK</option>
                                                        <option value="GOKAVARAM">GOKAVARAM</option>
                                                        <option value="GOLAGHAT">GOLAGHAT</option>
                                                        <option value="GOMOH">GOMOH</option>
                                                        <option value="GONDA">GONDA</option>
                                                        <option value="GONDIA">GONDIA</option>
                                                        <option value="GOOTY">GOOTY</option>
                                                        <option value="GOPALPUR">GOPALPUR</option>
                                                        <option value="GORAKHPUR">GORAKHPUR</option>
                                                        <option value="GOREGAON">GOREGAON</option>
                                                        <option value="GOSAIGAON">GOSAIGAON</option>
                                                        <option value="GREATER NOIDA">GREATER NOIDA</option>
                                                        <option value="GUDALUR">GUDALUR</option>
                                                        <option value="GUDIWADA">GUDIWADA</option>
                                                        <option value="GUDIYATHAM">GUDIYATHAM</option>
                                                        <option value="GUDUR">GUDUR</option>
                                                        <option value="GULBARGA">GULBARGA</option>
                                                        <option value="GUMLA">GUMLA</option>
                                                        <option value="GUNA">GUNA</option>
                                                        <option value="GUNDLUPET">GUNDLUPET</option>
                                                        <option value="GUNTAKAL">GUNTAKAL</option>
                                                        <option value="GUNTUR NORTH">GUNTUR NORTH</option>
                                                        <option value="GUNTUR SOUTH">GUNTUR SOUTH</option>
                                                        <option value="GURAJALA">GURAJALA</option>
                                                        <option value="GURDASPUR">GURDASPUR</option>
                                                        <option value="GURUGRAM">GURUGRAM</option>
                                                        <option value="GUWAHATI">GUWAHATI</option>
                                                        <option value="GWALIOR">GWALIOR</option>
                                                        <option value="HAFLONG">HAFLONG</option>
                                                        <option value="HALDWANI">HALDWANI</option>
                                                        <option value="HAMIRPUR">HAMIRPUR</option>
                                                        <option value="HANAMAKONDA">HANAMAKONDA</option>
                                                        <option value="HAPUR">HAPUR</option>
                                                        <option value="HARDA">HARDA</option>
                                                        <option value="HARDOI">HARDOI</option>
                                                        <option value="HARIDWAR">HARIDWAR</option>
                                                        <option value="HARUR">HARUR</option>
                                                        <option value="HASSAN">HASSAN</option>
                                                        <option value="HAVERI - RANEBENNUR">HAVERI - RANEBENNUR</option>
                                                        <option value="HAZARIBAGH">HAZARIBAGH</option>
                                                        <option value="HAZIPUR">HAZIPUR</option>
                                                        <option value="HERBERTPUR">HERBERTPUR</option>
                                                        <option value="HINDUPUR">HINDUPUR</option>
                                                        <option value="HISAR">HISAR</option>
                                                        <option value="HITECH CITY">HITECH CITY</option>
                                                        <option value="HNATHIAL">HNATHIAL</option>
                                                        <option value="HOSHANGABAD">HOSHANGABAD</option>
                                                        <option value="HOSIARPUR">HOSIARPUR</option>
                                                        <option value="HOSPET">HOSPET</option>
                                                        <option value="HOSUR NORTH">HOSUR NORTH</option>
                                                        <option value="HOSUR SOUTH">HOSUR SOUTH</option>
                                                        <option value="HUBLI">HUBLI</option>
                                                        <option value="HUBLI CENTRAL">HUBLI CENTRAL</option>
                                                        <option value="HUNSUR">HUNSUR</option>
                                                        <option value="HUZUR NAGAR">HUZUR NAGAR</option>
                                                        <option value="HYDERABAD">HYDERABAD</option>
                                                        <option value="IBRAHIMPATNAM">IBRAHIMPATNAM</option>
                                                        <option value="ICHALKARANJI">ICHALKARANJI</option>
                                                        <option value="ICHAPURAM">ICHAPURAM</option>
                                                        <option value="IDAIYANGUDI">IDAIYANGUDI</option>
                                                        <option value="IMPHAL EAST">IMPHAL EAST</option>
                                                        <option value="IMPHAL WEST">IMPHAL WEST</option>
                                                        <option value="INCHIVILA">INCHIVILA</option>
                                                        <option value="INDORE">INDORE</option>
                                                        <option value="INDORE CENTRAL">INDORE CENTRAL</option>
                                                        <option value="INKOLLU">INKOLLU</option>
                                                        <option value="IRINJALAKUDA">IRINJALAKUDA</option>
                                                        <option value="IRITTY">IRITTY</option>
                                                        <option value="ITANAGAR CITY">ITANAGAR CITY</option>
                                                        <option value="ITARSI">ITARSI</option>
                                                        <option value="JABALPUR">JABALPUR</option>
                                                        <option value="JADCHARLA">JADCHARLA</option>
                                                        <option value="JAGDALPUR">JAGDALPUR</option>
                                                        <option value="JAGDEESHPUR">JAGDEESHPUR</option>
                                                        <option value="JAGGAIAHPET">JAGGAIAHPET</option>
                                                        <option value="JAGTIAL">JAGTIAL</option>
                                                        <option value="JAHANABAD">JAHANABAD</option>
                                                        <option value="JAIGAON">JAIGAON</option>
                                                        <option value="JAIPUR CENTRAL">JAIPUR CENTRAL</option>
                                                        <option value="JAIPUR NORTH">JAIPUR NORTH</option>
                                                        <option value="JAIPUR SOUTH">JAIPUR SOUTH</option>
                                                        <option value="JAISALMER">JAISALMER</option>
                                                        <option value="JALANDHAR">JALANDHAR</option>
                                                        <option value="JALANDHAR SOUTH">JALANDHAR SOUTH</option>
                                                        <option value="JALGAON-BHUSAVAL">JALGAON-BHUSAVAL</option>
                                                        <option value="JALNA">JALNA</option>
                                                        <option value="JALORE">JALORE</option>
                                                        <option value="JALPAIGURI">JALPAIGURI</option>
                                                        <option value="JALUKIE">JALUKIE</option>
                                                        <option value="JAMMU">JAMMU</option>
                                                        <option value="JAMNAGAR">JAMNAGAR</option>
                                                        <option value="JAMPUI">JAMPUI</option>
                                                        <option value="JAMSHEDPUR">JAMSHEDPUR</option>
                                                        <option value="JAMTARA">JAMTARA</option>
                                                        <option value="JAMUI">JAMUI</option>
                                                        <option value="JANGAON">JANGAON</option>
                                                        <option value="JANGAREDDIGUDEM">JANGAREDDIGUDEM</option>
                                                        <option value="JANJGIR">JANJGIR</option>
                                                        <option value="JASHPUR">JASHPUR</option>
                                                        <option value="JATNI KHURDA">JATNI KHURDA</option>
                                                        <option value="JAUNPUR">JAUNPUR</option>
                                                        <option value="JEEDIMETLA">JEEDIMETLA</option>
                                                        <option value="JEYPORE">JEYPORE</option>
                                                        <option value="JHALAWAR">JHALAWAR</option>
                                                        <option value="JHANSI">JHANSI</option>
                                                        <option value="JHARSUGUDA">JHARSUGUDA</option>
                                                        <option value="JIRIBAM">JIRIBAM</option>
                                                        <option value="JOBAT">JOBAT</option>
                                                        <option value="JODHPUR">JODHPUR</option>
                                                        <option value="JORETHANG">JORETHANG</option>
                                                        <option value="JORHAT">JORHAT</option>
                                                        <option value="JOWAI">JOWAI</option>
                                                        <option value="JYOTHINAGAR">JYOTHINAGAR</option>
                                                        <option value="KADIRI">KADIRI</option>
                                                        <option value="KAGAL">KAGAL</option>
                                                        <option value="KAILASAPURAM">KAILASAPURAM</option>
                                                        <option value="KAIMUR">KAIMUR</option>
                                                        <option value="KAITHAL">KAITHAL</option>
                                                        <option value="KAKINADA">KAKINADA</option>
                                                        <option value="KALAMASSERY">KALAMASSERY</option>
                                                        <option value="KALIMPONG">KALIMPONG</option>
                                                        <option value="KALLURU">KALLURU</option>
                                                        <option value="KALPAKKAM">KALPAKKAM</option>
                                                        <option value="KALPETTA">KALPETTA</option>
                                                        <option value="KALWAKURTHY">KALWAKURTHY</option>
                                                        <option value="KALYAN">KALYAN</option>
                                                        <option value="KALYANDURG">KALYANDURG</option>
                                                        <option value="KAMAREDDY">KAMAREDDY</option>
                                                        <option value="KANCHIPURAM">KANCHIPURAM</option>
                                                        <option value="KANDUKUR">KANDUKUR</option>
                                                        <option value="KANGPOKPI">KANGPOKPI</option>
                                                        <option value="KANGRA">KANGRA</option>
                                                        <option value="KANIGIRI">KANIGIRI</option>
                                                        <option value="KANJIKODE">KANJIKODE</option>
                                                        <option value="KANKE">KANKE</option>
                                                        <option value="KANKER">KANKER</option>
                                                        <option value="KANNUR">KANNUR</option>
                                                        <option value="KANPUR">KANPUR</option>
                                                        <option value="KANSABEL">KANSABEL</option>
                                                        <option value="KAPURTHALA">KAPURTHALA</option>
                                                        <option value="KARAD">KARAD</option>
                                                        <option value="KARAIKUDI">KARAIKUDI</option>
                                                        <option value="KARAULI">KARAULI</option>
                                                        <option value="KARIMNAGAR">KARIMNAGAR</option>
                                                        <option value="KARIMNAGAR NORTH">KARIMNAGAR NORTH</option>
                                                        <option value="KARNAL">KARNAL</option>
                                                        <option value="KARTHIKAPALLY">KARTHIKAPALLY</option>
                                                        <option value="KARUKACHAL">KARUKACHAL</option>
                                                        <option value="KARUR">KARUR</option>
                                                        <option value="KARWAR">KARWAR</option>
                                                        <option value="KASARAGOD">KASARAGOD</option>
                                                        <option value="KASAULI">KASAULI</option>
                                                        <option value="KASGANJ">KASGANJ</option>
                                                        <option value="KASHIPUR">KASHIPUR</option>
                                                        <option value="KATHUA">KATHUA</option>
                                                        <option value="KATIHAR">KATIHAR</option>
                                                        <option value="KATNI">KATNI</option>
                                                        <option value="KATRA">KATRA</option>
                                                        <option value="KATTAKADA">KATTAKADA</option>
                                                        <option value="KATTAPANA">KATTAPANA</option>
                                                        <option value="KAVALI">KAVALI</option>
                                                        <option value="KAWARDHA">KAWARDHA</option>
                                                        <option value="KAYAMKULAM">KAYAMKULAM</option>
                                                        <option value="KAZIPET">KAZIPET</option>
                                                        <option value="KHADAKWASLA">KHADAKWASLA</option>
                                                        <option value="KHAGARIA">KHAGARIA</option>
                                                        <option value="KHALILABAD">KHALILABAD</option>
                                                        <option value="KHAMMAM NORTH">KHAMMAM NORTH</option>
                                                        <option value="KHAMMAM SOUTH">KHAMMAM SOUTH</option>
                                                        <option value="KHANDWA">KHANDWA</option>
                                                        <option value="KHANNA">KHANNA</option>
                                                        <option value="KHARAGPUR">KHARAGPUR</option>
                                                        <option value="KHARAGPUR CENTRAL">KHARAGPUR CENTRAL</option>
                                                        <option value="KHARAR">KHARAR</option>
                                                        <option value="KHARGHAR">KHARGHAR</option>
                                                        <option value="KHARKUTTA">KHARKUTTA</option>
                                                        <option value="KHATIMA">KHATIMA</option>
                                                        <option value="KHAWZAWL">KHAWZAWL</option>
                                                        <option value="KHLIEHRIAT">KHLIEHRIAT</option>
                                                        <option value="KHUMULWNG">KHUMULWNG</option>
                                                        <option value="KHUNTI MURHU">KHUNTI MURHU</option>
                                                        <option value="KIPHIRE">KIPHIRE</option>
                                                        <option value="KODAD">KODAD</option>
                                                        <option value="KODAIKANAL">KODAIKANAL</option>
                                                        <option value="KODARMA">KODARMA</option>
                                                        <option value="KODOLI">KODOLI</option>
                                                        <option value="KODUKULANJI">KODUKULANJI</option>
                                                        <option value="KOHIMA NORTH">KOHIMA NORTH</option>
                                                        <option value="KOHIMA SOUTH">KOHIMA SOUTH</option>
                                                        <option value="KOILKUNTLA">KOILKUNTLA</option>
                                                        <option value="KOKRAJHAR">KOKRAJHAR</option>
                                                        <option value="KOLAR">KOLAR</option>
                                                        <option value="KOLAR GOLD FIELDS">KOLAR GOLD FIELDS</option>
                                                        <option value="KOLASIB">KOLASIB</option>
                                                        <option value="KOLENCHERRY">KOLENCHERRY</option>
                                                        <option value="KOLHAPUR">KOLHAPUR</option>
                                                        <option value="KOLLEGAL">KOLLEGAL</option>
                                                        <option value="KONDAGAON">KONDAGAON</option>
                                                        <option value="KONDOTTY">KONDOTTY</option>
                                                        <option value="KONNI">KONNI</option>
                                                        <option value="KORAPUT">KORAPUT</option>
                                                        <option value="KORBA">KORBA</option>
                                                        <option value="KORUTLA">KORUTLA</option>
                                                        <option value="KOSA GUMUDA">KOSA GUMUDA</option>
                                                        <option value="KOTA">KOTA</option>
                                                        <option value="KOTDWARA">KOTDWARA</option>
                                                        <option value="KOTGARH">KOTGARH</option>
                                                        <option value="KOTHAGUDEM">KOTHAGUDEM</option>
                                                        <option value="KOTHAMANGALAM">KOTHAMANGALAM</option>
                                                        <option value="KOTPAD">KOTPAD</option>
                                                        <option value="KOTTARAKARA">KOTTARAKARA</option>
                                                        <option value="KOTTAYAM">KOTTAYAM</option>
                                                        <option value="KOVILPATTI">KOVILPATTI</option>
                                                        <option value="KOVVURU">KOVVURU</option>
                                                        <option value="KOZHENCHERRY">KOZHENCHERRY</option>
                                                        <option value="KRISHNAGIRI">KRISHNAGIRI</option>
                                                        <option value="KUDAPPANAKKUNNU">KUDAPPANAKKUNNU</option>
                                                        <option value="KUKATPALLY">KUKATPALLY</option>
                                                        <option value="KULATHUPUZHA">KULATHUPUZHA</option>
                                                        <option value="KULLU">KULLU</option>
                                                        <option value="KUMALI">KUMALI</option>
                                                        <option value="KUMBAKONAM">KUMBAKONAM</option>
                                                        <option value="KUMBANAD">KUMBANAD</option>
                                                        <option value="KUNDARA">KUNDARA</option>
                                                        <option value="KUNNAMKULAM">KUNNAMKULAM</option>
                                                        <option value="KURADA">KURADA</option>
                                                        <option value="KURNOOL">KURNOOL</option>
                                                        <option value="KURSEONG">KURSEONG</option>
                                                        <option value="KURTAMGARH">KURTAMGARH</option>
                                                        <option value="L.B. NAGAR">L.B. NAGAR</option>
                                                        <option value="LAKHIMPUR">LAKHIMPUR</option>
                                                        <option value="LAKHIMPUR KHERI">LAKHIMPUR KHERI</option>
                                                        <option value="LAKHIPUR">LAKHIPUR</option>
                                                        <option value="LAKHNADON">LAKHNADON</option>
                                                        <option value="LAKLA">LAKLA</option>
                                                        <option value="LALITPUR">LALITPUR</option>
                                                        <option value="LATEHAR">LATEHAR</option>
                                                        <option value="LATUR">LATUR</option>
                                                        <option value="LAWNGTLAI">LAWNGTLAI</option>
                                                        <option value="LEH">LEH</option>
                                                        <option value="LOHARDAGA">LOHARDAGA</option>
                                                        <option value="LONAVALA">LONAVALA</option>
                                                        <option value="LONGDING">LONGDING</option>
                                                        <option value="LONGLENG">LONGLENG</option>
                                                        <option value="LUCKNOW">LUCKNOW</option>
                                                        <option value="LUCKNOW SOUTH">LUCKNOW SOUTH</option>
                                                        <option value="LUCKNOW TRANSGOMTI">LUCKNOW TRANSGOMTI</option>
                                                        <option value="LUDHIANA">LUDHIANA</option>
                                                        <option value="LUMDING">LUMDING</option>
                                                        <option value="LUNGLEI">LUNGLEI</option>
                                                        <option value="MACHERLA">MACHERLA</option>
                                                        <option value="MACHILIPATNAM">MACHILIPATNAM</option>
                                                        <option value="MADANAPALLE">MADANAPALLE</option>
                                                        <option value="MADEKERI">MADEKERI</option>
                                                        <option value="MADHEPURA">MADHEPURA</option>
                                                        <option value="MADHIRA">MADHIRA</option>
                                                        <option value="MADHUPUR">MADHUPUR</option>
                                                        <option value="MADHURANTHAGAM">MADHURANTHAGAM</option>
                                                        <option value="MADHYAMGRAM">MADHYAMGRAM</option>
                                                        <option value="MADRAS CENTRAL">MADRAS CENTRAL</option>
                                                        <option value="MADRAS NORTH">MADRAS NORTH</option>
                                                        <option value="MADRAS SOUTH">MADRAS SOUTH</option>
                                                        <option value="MADRAS WEST">MADRAS WEST</option>
                                                        <option value="MADURAI EAST">MADURAI EAST</option>
                                                        <option value="MADURAI NORTH">MADURAI NORTH</option>
                                                        <option value="MADURAI SOUTH">MADURAI SOUTH</option>
                                                        <option value="MAHASAMUND">MAHASAMUND</option>
                                                        <option value="MAHBUBABAD">MAHBUBABAD</option>
                                                        <option value="MAHBUBNAGAR">MAHBUBNAGAR</option>
                                                        <option value="MAJIRI">MAJIRI</option>
                                                        <option value="MALAJKHAND">MALAJKHAND</option>
                                                        <option value="MALAYINKEEZHU">MALAYINKEEZHU</option>
                                                        <option value="MALBAZAR">MALBAZAR</option>
                                                        <option value="MALKANGIRI">MALKANGIRI</option>
                                                        <option value="MALLAPALLY">MALLAPALLY</option>
                                                        <option value="MANALI">MANALI</option>
                                                        <option value="MANANTHAVADY">MANANTHAVADY</option>
                                                        <option value="MANAPARAI">MANAPARAI</option>
                                                        <option value="MANCHERIAL">MANCHERIAL</option>
                                                        <option value="MANDLA">MANDLA</option>
                                                        <option value="MANDYA">MANDYA</option>
                                                        <option value="MANENDRAGARH">MANENDRAGARH</option>
                                                        <option value="MANGALAGIRI">MANGALAGIRI</option>
                                                        <option value="MANGALORE">MANGALORE</option>
                                                        <option value="MANGO">MANGO</option>
                                                        <option value="MANMAD">MANMAD</option>
                                                        <option value="MANNARGUDI">MANNARGUDI</option>
                                                        <option value="MANNUTHY">MANNUTHY</option>
                                                        <option value="MANOHARPUR">MANOHARPUR</option>
                                                        <option value="MANSA">MANSA</option>
                                                        <option value="MANTHANI">MANTHANI</option>
                                                        <option value="MANUGURU">MANUGURU</option>
                                                        <option value="MARKAPUR">MARKAPUR</option>
                                                        <option value="MARTHANDAM">MARTHANDAM</option>
                                                        <option value="MARTUR">MARTUR</option>
                                                        <option value="MATHURA">MATHURA</option>
                                                        <option value="MATTAMPALLI">MATTAMPALLI</option>
                                                        <option value="MAU">MAU</option>
                                                        <option value="MAVELIKARA">MAVELIKARA</option>
                                                        <option value="MAWKYRWAT">MAWKYRWAT</option>
                                                        <option value="MAYILADUTHURAI">MAYILADUTHURAI</option>
                                                        <option value="MEDAK">MEDAK</option>
                                                        <option value="MEENANGADI">MEENANGADI</option>
                                                        <option value="MEERPET">MEERPET</option>
                                                        <option value="MEERUT">MEERUT</option>
                                                        <option value="MEHDIPATNAM">MEHDIPATNAM</option>
                                                        <option value="MEHSANA">MEHSANA</option>
                                                        <option value="METPALLY">METPALLY</option>
                                                        <option value="METTUPALAYAM">METTUPALAYAM</option>
                                                        <option value="METTUR DAM">METTUR DAM</option>
                                                        <option value="MHOW">MHOW</option>
                                                        <option value="MIAO">MIAO</option>
                                                        <option value="MIRA-BHAYANDER">MIRA-BHAYANDER</option>
                                                        <option value="MIRAJ">MIRAJ</option>
                                                        <option value="MIRIK">MIRIK</option>
                                                        <option value="MIRYALAGUDA">MIRYALAGUDA</option>
                                                        <option value="MIRZAPUR">MIRZAPUR</option>
                                                        <option value="MODINAGAR">MODINAGAR</option>
                                                        <option value="MOGA">MOGA</option>
                                                        <option value="MOHALI">MOHALI</option>
                                                        <option value="MOKOKCHUNG">MOKOKCHUNG</option>
                                                        <option value="MON">MON</option>
                                                        <option value="MORADABAD">MORADABAD</option>
                                                        <option value="MOTIHARI">MOTIHARI</option>
                                                        <option value="MUDALGI">MUDALGI</option>
                                                        <option value="MUKTSAR">MUKTSAR</option>
                                                        <option value="MUL">MUL</option>
                                                        <option value="MULANTHURUTHY">MULANTHURUTHY</option>
                                                        <option value="MUMBAI BANDRA">MUMBAI BANDRA</option>
                                                        <option value="MUMBAI CENTRAL">MUMBAI CENTRAL</option>
                                                        <option value="MUNDAKKAYAM">MUNDAKKAYAM</option>
                                                        <option value="MUNGELI">MUNGELI</option>
                                                        <option value="MUNGER JAMALPUR">MUNGER JAMALPUR</option>
                                                        <option value="MUNIGUDA">MUNIGUDA</option>
                                                        <option value="MUNNAR">MUNNAR</option>
                                                        <option value="MURI">MURI</option>
                                                        <option value="MUSSOORIE">MUSSOORIE</option>
                                                        <option value="MUVATTUPUZHA">MUVATTUPUZHA</option>
                                                        <option value="MUZAFFARPUR">MUZAFFARPUR</option>
                                                        <option value="MYSORE">MYSORE</option>
                                                        <option value="NABARANGPUR">NABARANGPUR</option>
                                                        <option value="NABHA">NABHA</option>
                                                        <option value="NAGAPATTINAM">NAGAPATTINAM</option>
                                                        <option value="NAGARJUNASAGAR">NAGARJUNASAGAR</option>
                                                        <option value="NAGARKURNOOL">NAGARKURNOOL</option>
                                                        <option value="NAGAUR">NAGAUR</option>
                                                        <option value="NAGERCOIL EAST">NAGERCOIL EAST</option>
                                                        <option value="NAGERCOIL NORTH">NAGERCOIL NORTH</option>
                                                        <option value="NAGERCOIL SOUTH">NAGERCOIL SOUTH</option>
                                                        <option value="NAGERCOIL WEST">NAGERCOIL WEST</option>
                                                        <option value="NAGPUR AJANI">NAGPUR AJANI</option>
                                                        <option value="NAGPUR KAMPTEE">NAGPUR KAMPTEE</option>
                                                        <option value="NAGPUR MANKAPUR">NAGPUR MANKAPUR</option>
                                                        <option value="NAGPUR WADI">NAGPUR WADI</option>
                                                        <option value="NAHARLAGUN">NAHARLAGUN</option>
                                                        <option value="NAIDUPETA">NAIDUPETA</option>
                                                        <option value="NAIGAON">NAIGAON</option>
                                                        <option value="NAINI">NAINI</option>
                                                        <option value="NAINITAL">NAINITAL</option>
                                                        <option value="NAINPUR">NAINPUR</option>
                                                        <option value="NAKREKAL">NAKREKAL</option>
                                                        <option value="NALAGARH">NALAGARH</option>
                                                        <option value="NALANDA">NALANDA</option>
                                                        <option value="NALGONDA">NALGONDA</option>
                                                        <option value="NALGONDA SOUTH">NALGONDA SOUTH</option>
                                                        <option value="NALLASOPARA">NALLASOPARA</option>
                                                        <option value="NAMAKKAL">NAMAKKAL</option>
                                                        <option value="NAMCHI">NAMCHI</option>
                                                        <option value="NAMKUM">NAMKUM</option>
                                                        <option value="NANDED">NANDED</option>
                                                        <option value="NANDIGAMA">NANDIGAMA</option>
                                                        <option value="NANDURBAR">NANDURBAR</option>
                                                        <option value="NANDYAL">NANDYAL</option>
                                                        <option value="NARASARAOPET">NARASARAOPET</option>
                                                        <option value="NARAYANPUR">NARAYANPUR</option>
                                                        <option value="NARSAPUR MEDAK">NARSAPUR MEDAK</option>
                                                        <option value="NARSAPURAM">NARSAPURAM</option>
                                                        <option value="NARSINGPUR">NARSINGPUR</option>
                                                        <option value="NARSIPATNAM">NARSIPATNAM</option>
                                                        <option value="NASHIK">NASHIK</option>
                                                        <option value="NAVAPUR">NAVAPUR</option>
                                                        <option value="NAWADA">NAWADA</option>
                                                        <option value="NAWAN SHAHR">NAWAN SHAHR</option>
                                                        <option value="NAXALBARI">NAXALBARI</option>
                                                        <option value="NAZARETH">NAZARETH</option>
                                                        <option value="NEDUMANGADU">NEDUMANGADU</option>
                                                        <option value="NEEMUCH">NEEMUCH</option>
                                                        <option value="NELLIMOODU">NELLIMOODU</option>
                                                        <option value="NELLORE">NELLORE</option>
                                                        <option value="NELYADI">NELYADI</option>
                                                        <option value="NERUL">NERUL</option>
                                                        <option value="NEW DELHI">NEW DELHI</option>
                                                        <option value="NEYATTINKARA">NEYATTINKARA</option>
                                                        <option value="NEYVELI">NEYVELI</option>
                                                        <option value="NIDADAVOLU">NIDADAVOLU</option>
                                                        <option value="NIDUBROLU">NIDUBROLU</option>
                                                        <option value="NIGDI">NIGDI</option>
                                                        <option value="NIRMAL">NIRMAL</option>
                                                        <option value="NIULAND">NIULAND</option>
                                                        <option value="NIZAMABAD">NIZAMABAD</option>
                                                        <option value="NOIDA">NOIDA</option>
                                                        <option value="NONGPOH">NONGPOH</option>
                                                        <option value="NONGSTOIN">NONGSTOIN</option>
                                                        <option value="NORTH VANLAIPHAI">NORTH VANLAIPHAI</option>
                                                        <option value="NOWROZABAD">NOWROZABAD</option>
                                                        <option value="NUZVID">NUZVID</option>
                                                        <option value="ODDANCHATRAM">ODDANCHATRAM</option>
                                                        <option value="OLAVAKKOD">OLAVAKKOD</option>
                                                        <option value="ONGOLE">ONGOLE</option>
                                                        <option value="PADERU">PADERU</option>
                                                        <option value="PADHAR">PADHAR</option>
                                                        <option value="PAKUR - HIRANPUR">PAKUR - HIRANPUR</option>
                                                        <option value="PALAKONDA">PALAKONDA</option>
                                                        <option value="PALAMPUR">PALAMPUR</option>
                                                        <option value="PALGHAT">PALGHAT</option>
                                                        <option value="PALI MARWAR">PALI MARWAR</option>
                                                        <option value="PALLEL">PALLEL</option>
                                                        <option value="PALONCHA">PALONCHA</option>
                                                        <option value="PANCHKULA">PANCHKULA</option>
                                                        <option value="PANDALAM">PANDALAM</option>
                                                        <option value="PANIPAT">PANIPAT</option>
                                                        <option value="PANVEL">PANVEL</option>
                                                        <option value="PARALAKHEMUNDI">PARALAKHEMUNDI</option>
                                                        <option value="PARAMAKUDI">PARAMAKUDI</option>
                                                        <option value="PARASSALA">PARASSALA</option>
                                                        <option value="PARBHANI">PARBHANI</option>
                                                        <option value="PARVATHIPURAM">PARVATHIPURAM</option>
                                                        <option value="PASIGHAT">PASIGHAT</option>
                                                        <option value="PATHALGAON">PATHALGAON</option>
                                                        <option value="PATHANAMTHITTA">PATHANAMTHITTA</option>
                                                        <option value="PATHANAPURAM">PATHANAPURAM</option>
                                                        <option value="PATHANKOT">PATHANKOT</option>
                                                        <option value="PATHAPATNAM">PATHAPATNAM</option>
                                                        <option value="PATIALA">PATIALA</option>
                                                        <option value="PATNA">PATNA</option>
                                                        <option value="PATNA WEST">PATNA WEST</option>
                                                        <option value="PAURI GARWHAL">PAURI GARWHAL</option>
                                                        <option value="PAVATHIYANVILA">PAVATHIYANVILA</option>
                                                        <option value="PAYANNUR">PAYANNUR</option>
                                                        <option value="PAYYAPADY">PAYYAPADY</option>
                                                        <option value="PEDDAPALLI">PEDDAPALLI</option>
                                                        <option value="PEHOWA">PEHOWA</option>
                                                        <option value="PENDRA ROAD">PENDRA ROAD</option>
                                                        <option value="PENNAGARAM">PENNAGARAM</option>
                                                        <option value="PERAMBALUR">PERAMBALUR</option>
                                                        <option value="PEREN">PEREN</option>
                                                        <option value="PERUMBAVOOR">PERUMBAVOOR</option>
                                                        <option value="PFIITSERO">PFIITSERO</option>
                                                        <option value="PHEK">PHEK</option>
                                                        <option value="PHILLAUR">PHILLAUR</option>
                                                        <option value="PHULBANI">PHULBANI</option>
                                                        <option value="PIDUGURALLA">PIDUGURALLA</option>
                                                        <option value="PILER">PILER</option>
                                                        <option value="PILIBHIT">PILIBHIT</option>
                                                        <option value="PIMPRI">PIMPRI</option>
                                                        <option value="PINJOR - KALKA">PINJOR - KALKA</option>
                                                        <option value="PIPARIA">PIPARIA</option>
                                                        <option value="PIRAVAM">PIRAVAM</option>
                                                        <option value="PISKA NAGRI ITKI">PISKA NAGRI ITKI</option>
                                                        <option value="PITHAPURAM">PITHAPURAM</option>
                                                        <option value="PITHORAGARH">PITHORAGARH</option>
                                                        <option value="PODILI">PODILI</option>
                                                        <option value="POLLACHI">POLLACHI</option>
                                                        <option value="PONDICHERRY">PONDICHERRY</option>
                                                        <option value="PONKUNNAM">PONKUNNAM</option>
                                                        <option value="POONA CENTRAL">POONA CENTRAL</option>
                                                        <option value="POONTHURA">POONTHURA</option>
                                                        <option value="PORBANDAR">PORBANDAR</option>
                                                        <option value="PORT BLAIR">PORT BLAIR</option>
                                                        <option value="POWAI">POWAI</option>
                                                        <option value="PRATAPGARH">PRATAPGARH</option>
                                                        <option value="PRODDATUR">PRODDATUR</option>
                                                        <option value="PUDUKOTTAI">PUDUKOTTAI</option>
                                                        <option value="PULIVENDLA">PULIVENDLA</option>
                                                        <option value="PUNALUR">PUNALUR</option>
                                                        <option value="PUNGANUR">PUNGANUR</option>
                                                        <option value="PURI">PURI</option>
                                                        <option value="PURNIA">PURNIA</option>
                                                        <option value="PUTHUPPADY">PUTHUPPADY</option>
                                                        <option value="PUTTUR">PUTTUR</option>
                                                        <option value="PUTTUR DK">PUTTUR DK</option>
                                                        <option value="QUILON">QUILON</option>
                                                        <option value="RAEBARELI">RAEBARELI</option>
                                                        <option value="RAHATA-RAHURI">RAHATA-RAHURI</option>
                                                        <option value="RAICHUR">RAICHUR</option>
                                                        <option value="RAIGARH">RAIGARH</option>
                                                        <option value="RAIKIA">RAIKIA</option>
                                                        <option value="RAIPUR">RAIPUR</option>
                                                        <option value="RAJAMUNDRY">RAJAMUNDRY</option>
                                                        <option value="RAJAPALAYAM">RAJAPALAYAM</option>
                                                        <option value="RAJGANGPUR">RAJGANGPUR</option>
                                                        <option value="RAJKOT">RAJKOT</option>
                                                        <option value="RAJNANDGAON">RAJNANDGAON</option>
                                                        <option value="RAJPURA">RAJPURA</option>
                                                        <option value="RAJSAMAND">RAJSAMAND</option>
                                                        <option value="RAMACHANDRAPURAM">RAMACHANDRAPURAM</option>
                                                        <option value="RAMANATHAPURAM">RAMANATHAPURAM</option>
                                                        <option value="RAMAYAMPET">RAMAYAMPET</option>
                                                        <option value="RAMESWARAM">RAMESWARAM</option>
                                                        <option value="RAMGARH-BARKHAKANA">RAMGARH-BARKHAKANA</option>
                                                        <option value="RAMPACHODAVARAM">RAMPACHODAVARAM</option>
                                                        <option value="RAMPUR">RAMPUR</option>
                                                        <option value="RAMPUR BUSHAHR">RAMPUR BUSHAHR</option>
                                                        <option value="RANCHI">RANCHI</option>
                                                        <option value="RANCHI SOUTH">RANCHI SOUTH</option>
                                                        <option value="RANGAPARA">RANGAPARA</option>
                                                        <option value="RANIPET">RANIPET</option>
                                                        <option value="RANNI">RANNI</option>
                                                        <option value="RANNI NORTH WEST">RANNI NORTH WEST</option>
                                                        <option value="RASIPURAM">RASIPURAM</option>
                                                        <option value="RATIA CITY">RATIA CITY</option>
                                                        <option value="RATLAM">RATLAM</option>
                                                        <option value="RATNAGIRI">RATNAGIRI</option>
                                                        <option value="RAVULAPALEM">RAVULAPALEM</option>
                                                        <option value="RAXAUL">RAXAUL</option>
                                                        <option value="RAYACHOTI">RAYACHOTI</option>
                                                        <option value="RAYAGADA">RAYAGADA</option>
                                                        <option value="RAZOLE">RAZOLE</option>
                                                        <option value="RENUKOOT ANPARA">RENUKOOT ANPARA</option>
                                                        <option value="REPALLE">REPALLE</option>
                                                        <option value="RESUBELPARA">RESUBELPARA</option>
                                                        <option value="REWA">REWA</option>
                                                        <option value="ROHTAK">ROHTAK</option>
                                                        <option value="ROING">ROING</option>
                                                        <option value="ROORKEE">ROORKEE</option>
                                                        <option value="ROPAR">ROPAR</option>
                                                        <option value="RORHU">RORHU</option>
                                                        <option value="ROURKELA">ROURKELA</option>
                                                        <option value="RUDRAPRAYAG">RUDRAPRAYAG</option>
                                                        <option value="RUDRAPUR">RUDRAPUR</option>
                                                        <option value="RUPAIDIHA">RUPAIDIHA</option>
                                                        <option value="SABROOM">SABROOM</option>
                                                        <option value="SAGAR C">SAGAR C</option>
                                                        <option value="SAGAR K">SAGAR K</option>
                                                        <option value="SAHARANPUR">SAHARANPUR</option>
                                                        <option value="SAIDABAD">SAIDABAD</option>
                                                        <option value="SALEM">SALEM</option>
                                                        <option value="SALUR">SALUR</option>
                                                        <option value="SAMALKOT">SAMALKOT</option>
                                                        <option value="SAMBA">SAMBA</option>
                                                        <option value="SAMBALPUR">SAMBALPUR</option>
                                                        <option value="SAMSI">SAMSI</option>
                                                        <option value="SANATHNAGAR">SANATHNAGAR</option>
                                                        <option value="SANGAMNER">SANGAMNER</option>
                                                        <option value="SANGAREDDY">SANGAREDDY</option>
                                                        <option value="SANGLI">SANGLI</option>
                                                        <option value="SANGRUR">SANGRUR</option>
                                                        <option value="SANKARANKOVIL">SANKARANKOVIL</option>
                                                        <option value="SANKESHWAR">SANKESHWAR</option>
                                                        <option value="SANTIR BAZAR">SANTIR BAZAR</option>
                                                        <option value="SARNI">SARNI</option>
                                                        <option value="SATARA">SATARA</option>
                                                        <option value="SATHUPALLI">SATHUPALLI</option>
                                                        <option value="SATHUR">SATHUR</option>
                                                        <option value="SATNA">SATNA</option>
                                                        <option value="SATTENAPALLI">SATTENAPALLI</option>
                                                        <option value="SAWAI MADHOPUR">SAWAI MADHOPUR</option>
                                                        <option value="SECUNDERABAD">SECUNDERABAD</option>
                                                        <option value="SENAPATI">SENAPATI</option>
                                                        <option value="SEONI">SEONI</option>
                                                        <option value="SERCHHIP">SERCHHIP</option>
                                                        <option value="SHADNAGAR">SHADNAGAR</option>
                                                        <option value="SHAHDOL">SHAHDOL</option>
                                                        <option value="SHAHJAHANPUR">SHAHJAHANPUR</option>
                                                        <option value="SHAMIRPET">SHAMIRPET</option>
                                                        <option value="SHAMSHABAD">SHAMSHABAD</option>
                                                        <option value="SHILLONG EAST">SHILLONG EAST</option>
                                                        <option value="SHILLONG NORTH">SHILLONG NORTH</option>
                                                        <option value="SHILLONG SOUTH">SHILLONG SOUTH</option>
                                                        <option value="SHIMLA">SHIMLA</option>
                                                        <option value="SHIMOGA">SHIMOGA</option>
                                                        <option value="SHORNUR">SHORNUR</option>
                                                        <option value="SHREERAMPUR">SHREERAMPUR</option>
                                                        <option value="SIAHA">SIAHA</option>
                                                        <option value="SIBSAGAR">SIBSAGAR</option>
                                                        <option value="SIDDIPETA">SIDDIPETA</option>
                                                        <option value="SIKAR">SIKAR</option>
                                                        <option value="SILCHAR">SILCHAR</option>
                                                        <option value="SILIGURI">SILIGURI</option>
                                                        <option value="SIMDEGA">SIMDEGA</option>
                                                        <option value="SINDHUDURG">SINDHUDURG</option>
                                                        <option value="SINGRAULI">SINGRAULI</option>
                                                        <option value="SINGTAM">SINGTAM</option>
                                                        <option value="SIROHI">SIROHI</option>
                                                        <option value="SITAPUR (CHATTISGARH)">SITAPUR (CHATTISGARH)</option>
                                                        <option value="SITAPUR (UTTAR PRADESH)">SITAPUR (UTTAR PRADESH)</option>
                                                        <option value="SIVAGANGAI">SIVAGANGAI</option>
                                                        <option value="SIVAKASI">SIVAKASI</option>
                                                        <option value="SIWAN">SIWAN</option>
                                                        <option value="SOLAN">SOLAN</option>
                                                        <option value="SOLAPUR">SOLAPUR</option>
                                                        <option value="SONARI">SONARI</option>
                                                        <option value="SONBHADRA">SONBHADRA</option>
                                                        <option value="SONEPAT">SONEPAT</option>
                                                        <option value="SONGADH">SONGADH</option>
                                                        <option value="SRIGANGANAGAR">SRIGANGANAGAR</option>
                                                        <option value="SRIKAKULAM">SRIKAKULAM</option>
                                                        <option value="SRIKALAHASTI">SRIKALAHASTI</option>
                                                        <option value="SRINAGAR">SRINAGAR</option>
                                                        <option value="SUKMA">SUKMA</option>
                                                        <option value="SUKUMA">SUKUMA</option>
                                                        <option value="SULLURUPET">SULLURUPET</option>
                                                        <option value="SULTAN BATHERY">SULTAN BATHERY</option>
                                                        <option value="SUNABEDA">SUNABEDA</option>
                                                        <option value="SUNDARGARH">SUNDARGARH</option>
                                                        <option value="SUNDERNAGAR">SUNDERNAGAR</option>
                                                        <option value="SURANDAI">SURANDAI</option>
                                                        <option value="SURAT">SURAT</option>
                                                        <option value="SURENDRANAGAR">SURENDRANAGAR</option>
                                                        <option value="SURYAPET">SURYAPET</option>
                                                        <option value="SURYAPET NORTH">SURYAPET NORTH</option>
                                                        <option value="SURYAPET SOUTH">SURYAPET SOUTH</option>
                                                        <option value="TADEPALLEGUDEM">TADEPALLEGUDEM</option>
                                                        <option value="TADPATRI">TADPATRI</option>
                                                        <option value="TAMBARAM">TAMBARAM</option>
                                                        <option value="TAMENGLONG">TAMENGLONG</option>
                                                        <option value="TANAKPUR">TANAKPUR</option>
                                                        <option value="TANDA">TANDA</option>
                                                        <option value="TANUKU">TANUKU</option>
                                                        <option value="TARAN-TARAN">TARAN-TARAN</option>
                                                        <option value="TENALI">TENALI</option>
                                                        <option value="TENKASI">TENKASI</option>
                                                        <option value="TEZPUR">TEZPUR</option>
                                                        <option value="TEZU">TEZU</option>
                                                        <option value="THANE">THANE</option>
                                                        <option value="THANJAVUR">THANJAVUR</option>
                                                        <option value="THENI">THENI</option>
                                                        <option value="THENZAWL">THENZAWL</option>
                                                        <option value="THIDANADU">THIDANADU</option>
                                                        <option value="THIRUKOILUR">THIRUKOILUR</option>
                                                        <option value="THIRUMALA">THIRUMALA</option>
                                                        <option value="THIRUVALLUR">THIRUVALLUR</option>
                                                        <option value="THIRUVARUR">THIRUVARUR</option>
                                                        <option value="THODUPUZHA">THODUPUZHA</option>
                                                        <option value="THUNGATHURTHY">THUNGATHURTHY</option>
                                                        <option value="TILDA">TILDA</option>
                                                        <option value="TINDIVANAM">TINDIVANAM</option>
                                                        <option value="TINSUKIA">TINSUKIA</option>
                                                        <option value="TIRUCHENDUR">TIRUCHENDUR</option>
                                                        <option value="TIRUCHENGODU">TIRUCHENGODU</option>
                                                        <option value="TIRUCHIRAPALLY">TIRUCHIRAPALLY</option>
                                                        <option value="TIRUNELVELI NORTH">TIRUNELVELI NORTH</option>
                                                        <option value="TIRUNELVELI SOUTH">TIRUNELVELI SOUTH</option>
                                                        <option value="TIRUPATHI">TIRUPATHI</option>
                                                        <option value="TIRUPATTUR">TIRUPATTUR</option>
                                                        <option value="TIRUPUR">TIRUPUR</option>
                                                        <option value="TIRUVALLA">TIRUVALLA</option>
                                                        <option value="TIRUVANNAMALAI">TIRUVANNAMALAI</option>
                                                        <option value="TIRUVURU">TIRUVURU</option>
                                                        <option value="TITLAGARH">TITLAGARH</option>
                                                        <option value="TONK">TONK</option>
                                                        <option value="TRANQUEBAR">TRANQUEBAR</option>
                                                        <option value="TRICHUR">TRICHUR</option>
                                                        <option value="TRICHUR CENTRAL">TRICHUR CENTRAL</option>
                                                        <option value="TRIPUNITHURA">TRIPUNITHURA</option>
                                                        <option value="TRIVANDRUM EAST">TRIVANDRUM EAST</option>
                                                        <option value="TRIVANDRUM NORTH">TRIVANDRUM NORTH</option>
                                                        <option value="TRIVANDRUM SECRETARIAT">TRIVANDRUM SECRETARIAT</option>
                                                        <option value="TRIVANDRUM SOUTH">TRIVANDRUM SOUTH</option>
                                                        <option value="TRIVANDRUM TECHNO">TRIVANDRUM TECHNO</option>
                                                        <option value="TRIVANDRUM WEST">TRIVANDRUM WEST</option>
                                                        <option value="TSEMINYU">TSEMINYU</option>
                                                        <option value="TUENSANG">TUENSANG</option>
                                                        <option value="TUMKUR">TUMKUR</option>
                                                        <option value="TUNI">TUNI</option>
                                                        <option value="TURA">TURA</option>
                                                        <option value="TUTICORIN">TUTICORIN</option>
                                                        <option value="UDAIPUR">UDAIPUR</option>
                                                        <option value="UDAIPUR-T">UDAIPUR-T</option>
                                                        <option value="UDALGURI">UDALGURI</option>
                                                        <option value="UDAYAGIRI">UDAYAGIRI</option>
                                                        <option value="UDGIR">UDGIR</option>
                                                        <option value="UDHAMPUR">UDHAMPUR</option>
                                                        <option value="UDUMALPET">UDUMALPET</option>
                                                        <option value="UDUPI">UDUPI</option>
                                                        <option value="UJJAIN">UJJAIN</option>
                                                        <option value="UKHRUL">UKHRUL</option>
                                                        <option value="ULHAS NAGAR">ULHAS NAGAR</option>
                                                        <option value="UNA - NANGAL">UNA - NANGAL</option>
                                                        <option value="UNNAO">UNNAO</option>
                                                        <option value="UPPAL">UPPAL</option>
                                                        <option value="URIACODE">URIACODE</option>
                                                        <option value="UTHANGARAI">UTHANGARAI</option>
                                                        <option value="UTRAULA">UTRAULA</option>
                                                        <option value="VADALA">VADALA</option>
                                                        <option value="VADASERIKARA">VADASERIKARA</option>
                                                        <option value="VALAKAM">VALAKAM</option>
                                                        <option value="VALLIYOOR">VALLIYOOR</option>
                                                        <option value="VALPARAI">VALPARAI</option>
                                                        <option value="VALSAD">VALSAD</option>
                                                        <option value="VANASTHALIPURAM">VANASTHALIPURAM</option>
                                                        <option value="VANNIYACODE">VANNIYACODE</option>
                                                        <option value="VAPI">VAPI</option>
                                                        <option value="VARANASI">VARANASI</option>
                                                        <option value="VASAI">VASAI</option>
                                                        <option value="VASHI">VASHI</option>
                                                        <option value="VATTAPPARA">VATTAPPARA</option>
                                                        <option value="VATTIYOORKAVU">VATTIYOORKAVU</option>
                                                        <option value="VECHOOCHIRA">VECHOOCHIRA</option>
                                                        <option value="VELLARADA">VELLARADA</option>
                                                        <option value="VELLORE">VELLORE</option>
                                                        <option value="VERAVAL">VERAVAL</option>
                                                        <option value="VIJAYAWADA">VIJAYAWADA</option>
                                                        <option value="VIJAYAWADA EAST">VIJAYAWADA EAST</option>
                                                        <option value="VILLUPURAM">VILLUPURAM</option>
                                                        <option value="VINUKONDA">VINUKONDA</option>
                                                        <option value="VIRAR">VIRAR</option>
                                                        <option value="VIRUDHNAGAR">VIRUDHNAGAR</option>
                                                        <option value="VISHAKHAPATNAM NORTH">VISHAKHAPATNAM NORTH</option>
                                                        <option value="VISHAKHAPATNAM SOUTH">VISHAKHAPATNAM SOUTH</option>
                                                        <option value="VISHRANTWADI">VISHRANTWADI</option>
                                                        <option value="VISSANNAPETA">VISSANNAPETA</option>
                                                        <option value="VITHURA">VITHURA</option>
                                                        <option value="VIZHINJAM">VIZHINJAM</option>
                                                        <option value="VIZIANAGARAM">VIZIANAGARAM</option>
                                                        <option value="VUYYURU">VUYYURU</option>
                                                        <option value="WANAPARTHY">WANAPARTHY</option>
                                                        <option value="WANOWRIE">WANOWRIE</option>
                                                        <option value="WARANGAL">WARANGAL</option>
                                                        <option value="WARDHA">WARDHA</option>
                                                        <option value="WASHIM">WASHIM</option>
                                                        <option value="WILLIAMNAGAR">WILLIAMNAGAR</option>
                                                        <option value="WOKHA">WOKHA</option>
                                                        <option value="YADGIR">YADGIR</option>
                                                        <option value="YAMUNANAGAR">YAMUNANAGAR</option>
                                                        <option value="YAVATMAL">YAVATMAL</option>
                                                        <option value="YELLANDU">YELLANDU</option>
                                                        <option value="YEMMIGANUR">YEMMIGANUR</option>
                                                        <option value="YERCAUD">YERCAUD</option>
                                                        <option value="ZAHEERABAD">ZAHEERABAD</option>
                                                        <option value="ZIRAKPUR">ZIRAKPUR</option>
                                                        <option value="ZIRO">ZIRO</option>
                                                        <option value="ZUNHEBOTO">ZUNHEBOTO</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group col-md-3" id="ref2namediv">
                                                <label for="trno">Reference 2 : Name *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="ref2name" id="ref2name" style="font-size: 12px;" placeholder="..Reference 2 Name" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="ref2namediv">
                                                <label for="trno">Reference 2 : Phone *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input inputmode="numeric" class="form-control" name="ref2phone" id="ref2phone" style="font-size: 12px;" maxlength="10" placeholder="..Reference 2 Phone/Mobile No" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="ref2campdiv">
                                                <label for="trno">Reference 2 : Camp</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <select name="ref2camp" id="ref2camp" class="form-control" style="font-size: 12px;">
                                                        <option value="0">-- Select Camp --</option>
                                                        <option value="AALO">AALO</option>
                                                        <option value="ACHAMPET">ACHAMPET</option>
                                                        <option value="ADDA KATHAR JALANDHAR">ADDA KATHAR JALANDHAR</option>
                                                        <option value="ADILABAD">ADILABAD</option>
                                                        <option value="ADITYAPUR">ADITYAPUR</option>
                                                        <option value="ADONI">ADONI</option>
                                                        <option value="ADOOR">ADOOR</option>
                                                        <option value="AGARTALA">AGARTALA</option>
                                                        <option value="AGRA">AGRA</option>
                                                        <option value="AHMEDABAD CENTRAL">AHMEDABAD CENTRAL</option>
                                                        <option value="AHMEDABAD MANINAGAR">AHMEDABAD MANINAGAR</option>
                                                        <option value="AHMEDABAD WEST">AHMEDABAD WEST</option>
                                                        <option value="AHMEDNAGAR">AHMEDNAGAR</option>
                                                        <option value="AHWA">AHWA</option>
                                                        <option value="AIROLI">AIROLI</option>
                                                        <option value="AIZAWL EAST">AIZAWL EAST</option>
                                                        <option value="AIZAWL NORTH">AIZAWL NORTH</option>
                                                        <option value="AIZAWL SOUTH">AIZAWL SOUTH</option>
                                                        <option value="AIZAWL WEST">AIZAWL WEST</option>
                                                        <option value="AJMER">AJMER</option>
                                                        <option value="AKOLA">AKOLA</option>
                                                        <option value="ALAIR">ALAIR</option>
                                                        <option value="ALAKODE">ALAKODE</option>
                                                        <option value="ALIBAUG">ALIBAUG</option>
                                                        <option value="ALIGARH">ALIGARH</option>
                                                        <option value="ALIPURDUAR">ALIPURDUAR</option>
                                                        <option value="ALIRAJPUR">ALIRAJPUR</option>
                                                        <option value="ALLAHABAD">ALLAHABAD</option>
                                                        <option value="ALLEPPEY">ALLEPPEY</option>
                                                        <option value="ALMORA">ALMORA</option>
                                                        <option value="ALUVA">ALUVA</option>
                                                        <option value="ALWAL">ALWAL</option>
                                                        <option value="ALWAR">ALWAR</option>
                                                        <option value="AMALAPURAM">AMALAPURAM</option>
                                                        <option value="AMBABAR">AMBABAR</option>
                                                        <option value="AMBALA">AMBALA</option>
                                                        <option value="AMBASAMUDRAM">AMBASAMUDRAM</option>
                                                        <option value="AMBERNATH">AMBERNATH</option>
                                                        <option value="AMBIKAPUR">AMBIKAPUR</option>
                                                        <option value="AMBUR">AMBUR</option>
                                                        <option value="AMLAI">AMLAI</option>
                                                        <option value="AMPATI">AMPATI</option>
                                                        <option value="AMRAVATI">AMRAVATI</option>
                                                        <option value="AMRITSAR">AMRITSAR</option>
                                                        <option value="ANAKAPALLE">ANAKAPALLE</option>
                                                        <option value="ANAND">ANAND</option>
                                                        <option value="ANANTAPUR">ANANTAPUR</option>
                                                        <option value="ANCHAL">ANCHAL</option>
                                                        <option value="ANDHERI">ANDHERI</option>
                                                        <option value="ANGAMALI">ANGAMALI</option>
                                                        <option value="ANGUL">ANGUL</option>
                                                        <option value="ANKLESHWAR">ANKLESHWAR</option>
                                                        <option value="ANNI">ANNI</option>
                                                        <option value="ARAKKONAM">ARAKKONAM</option>
                                                        <option value="ARAKU">ARAKU</option>
                                                        <option value="ARARIA">ARARIA</option>
                                                        <option value="ARCOT">ARCOT</option>
                                                        <option value="ARIYALUR">ARIYALUR</option>
                                                        <option value="ARMOOR">ARMOOR</option>
                                                        <option value="ARRAH">ARRAH</option>
                                                        <option value="ARUMUGANERI">ARUMUGANERI</option>
                                                        <option value="ARUPPUKOTTAI">ARUPPUKOTTAI</option>
                                                        <option value="ARYANAD">ARYANAD</option>
                                                        <option value="ASANSOL">ASANSOL</option>
                                                        <option value="ATHIKAYAM">ATHIKAYAM</option>
                                                        <option value="ATHMAKUR">ATHMAKUR</option>
                                                        <option value="ATMAKUR KNL">ATMAKUR KNL</option>
                                                        <option value="ATTINGAL">ATTINGAL</option>
                                                        <option value="ATTUR">ATTUR</option>
                                                        <option value="AURANGABAD">AURANGABAD</option>
                                                        <option value="AVADI">AVADI</option>
                                                        <option value="AYINKAMAM">AYINKAMAM</option>
                                                        <option value="AYUR">AYUR</option>
                                                        <option value="AZAMGARH">AZAMGARH</option>
                                                        <option value="BADAUN">BADAUN</option>
                                                        <option value="BADLAPUR">BADLAPUR</option>
                                                        <option value="BADVEL">BADVEL</option>
                                                        <option value="BAHRAICH">BAHRAICH</option>
                                                        <option value="BAIKUNTHPUR">BAIKUNTHPUR</option>
                                                        <option value="BAILADILA">BAILADILA</option>
                                                        <option value="BAKALIA">BAKALIA</option>
                                                        <option value="BALAGHAT">BALAGHAT</option>
                                                        <option value="BALARAMAPURAM">BALARAMAPURAM</option>
                                                        <option value="BALASORE">BALASORE</option>
                                                        <option value="BALIGUDA">BALIGUDA</option>
                                                        <option value="BALLARSHA">BALLARSHA</option>
                                                        <option value="BALLIA">BALLIA</option>
                                                        <option value="BANDA">BANDA</option>
                                                        <option value="BANGALORE BOMMANAHALLI">BANGALORE BOMMANAHALLI</option>
                                                        <option value="BANGALORE CENTRAL">BANGALORE CENTRAL</option>
                                                        <option value="BANGALORE CHANDAPURA">BANGALORE CHANDAPURA</option>
                                                        <option value="BANGALORE ELECTRONIC CITY">BANGALORE ELECTRONIC CITY</option>
                                                        <option value="BANGALORE HOSA ROAD">BANGALORE HOSA ROAD</option>
                                                        <option value="BANGALORE KORAMANGALA">BANGALORE KORAMANGALA</option>
                                                        <option value="BANGALORE NORTH">BANGALORE NORTH</option>
                                                        <option value="BANGALORE NORTH EAST">BANGALORE NORTH EAST</option>
                                                        <option value="BANGALORE PEENYA">BANGALORE PEENYA</option>
                                                        <option value="BANGALORE RAJAJI NAGAR">BANGALORE RAJAJI NAGAR</option>
                                                        <option value="BANGALORE RT NAGAR">BANGALORE RT NAGAR</option>
                                                        <option value="BANGALORE SOUTH">BANGALORE SOUTH</option>
                                                        <option value="BANGALORE SOUTH EAST">BANGALORE SOUTH EAST</option>
                                                        <option value="BANGALORE WHITEFIELD">BANGALORE WHITEFIELD</option>
                                                        <option value="BANGALORE YELAHANKA">BANGALORE YELAHANKA</option>
                                                        <option value="BANGALORE-RR NAGAR AND KENGERI">BANGALORE-RR NAGAR AND KENGERI</option>
                                                        <option value="BANKURA">BANKURA</option>
                                                        <option value="BANSWARA">BANSWARA</option>
                                                        <option value="BAPATLA">BAPATLA</option>
                                                        <option value="BAR-E-BRAHMANA">BAR-E-BRAHMANA</option>
                                                        <option value="BARABANKI">BARABANKI</option>
                                                        <option value="BARAMATI">BARAMATI</option>
                                                        <option value="BARAN">BARAN</option>
                                                        <option value="BAREILLEY">BAREILLEY</option>
                                                        <option value="BARGARH">BARGARH</option>
                                                        <option value="BARH">BARH</option>
                                                        <option value="BARHARWA">BARHARWA</option>
                                                        <option value="BARMER">BARMER</option>
                                                        <option value="BARNALA">BARNALA</option>
                                                        <option value="BARODA">BARODA</option>
                                                        <option value="BARWANI">BARWANI</option>
                                                        <option value="BATALA">BATALA</option>
                                                        <option value="BATHINDA">BATHINDA</option>
                                                        <option value="BEAWAR">BEAWAR</option>
                                                        <option value="BEGUSARAI">BEGUSARAI</option>
                                                        <option value="BELGAUM">BELGAUM</option>
                                                        <option value="BELLARY">BELLARY</option>
                                                        <option value="BELUR">BELUR</option>
                                                        <option value="BENAULIM">BENAULIM</option>
                                                        <option value="BERHAMPUR">BERHAMPUR</option>
                                                        <option value="BETTIAH">BETTIAH</option>
                                                        <option value="BETUL">BETUL</option>
                                                        <option value="BHADOHI">BHADOHI</option>
                                                        <option value="BHADRACHALAM">BHADRACHALAM</option>
                                                        <option value="BHADRAK">BHADRAK</option>
                                                        <option value="BHADRAVATI">BHADRAVATI</option>
                                                        <option value="BHAGALPUR">BHAGALPUR</option>
                                                        <option value="BHAMIANA KALANA">BHAMIANA KALANA</option>
                                                        <option value="BHANDARA">BHANDARA</option>
                                                        <option value="BHARATPUR">BHARATPUR</option>
                                                        <option value="BHARUCH">BHARUCH</option>
                                                        <option value="BHATAPARA">BHATAPARA</option>
                                                        <option value="BHAVANI">BHAVANI</option>
                                                        <option value="BHAVNAGAR">BHAVNAGAR</option>
                                                        <option value="BHAWANIPATNA">BHAWANIPATNA</option>
                                                        <option value="BHEL HYDERABAD">BHEL HYDERABAD</option>
                                                        <option value="BHILAI">BHILAI</option>
                                                        <option value="BHILWARA">BHILWARA</option>
                                                        <option value="BHIMAVARAM">BHIMAVARAM</option>
                                                        <option value="BHIMUNIPATNAM">BHIMUNIPATNAM</option>
                                                        <option value="BHIND">BHIND</option>
                                                        <option value="BHIRAKHERI">BHIRAKHERI</option>
                                                        <option value="BHOPAL">BHOPAL</option>
                                                        <option value="BHOPAL - BHEL">BHOPAL - BHEL</option>
                                                        <option value="BHUBANESHWAR">BHUBANESHWAR</option>
                                                        <option value="BHUJ">BHUJ</option>
                                                        <option value="BIDAR">BIDAR</option>
                                                        <option value="BIJAPUR">BIJAPUR</option>
                                                        <option value="BIJAPUR K">BIJAPUR K</option>
                                                        <option value="BIJNOR">BIJNOR</option>
                                                        <option value="BIKANER">BIKANER</option>
                                                        <option value="BILASPUR">BILASPUR</option>
                                                        <option value="BINA">BINA</option>
                                                        <option value="BIRAMITRAPUR">BIRAMITRAPUR</option>
                                                        <option value="BIRISINGPUR">BIRISINGPUR</option>
                                                        <option value="BISHNUPUR">BISHNUPUR</option>
                                                        <option value="BISHRAMPUR">BISHRAMPUR</option>
                                                        <option value="BISHWANATH">BISHWANATH</option>
                                                        <option value="BOBBILI">BOBBILI</option>
                                                        <option value="BODHAN">BODHAN</option>
                                                        <option value="BOKARO STEEL CITY">BOKARO STEEL CITY</option>
                                                        <option value="BOKARO THERMAL">BOKARO THERMAL</option>
                                                        <option value="BOLANGIR">BOLANGIR</option>
                                                        <option value="BOMDILA">BOMDILA</option>
                                                        <option value="BONGAIGAON">BONGAIGAON</option>
                                                        <option value="BORIO-SAHEBGANJ">BORIO-SAHEBGANJ</option>
                                                        <option value="BORIVILI">BORIVILI</option>
                                                        <option value="BORRA CAVES">BORRA CAVES</option>
                                                        <option value="BOWENPALLY">BOWENPALLY</option>
                                                        <option value="BRAJRAJNAGAR">BRAJRAJNAGAR</option>
                                                        <option value="BULANDSHAHR">BULANDSHAHR</option>
                                                        <option value="BULDHANA">BULDHANA</option>
                                                        <option value="BUNDI">BUNDI</option>
                                                        <option value="BUXAR">BUXAR</option>
                                                        <option value="CALCUTTA CENTRAL">CALCUTTA CENTRAL</option>
                                                        <option value="CALCUTTA NORTH">CALCUTTA NORTH</option>
                                                        <option value="CALCUTTA SOUTH">CALCUTTA SOUTH</option>
                                                        <option value="CALICUT">CALICUT</option>
                                                        <option value="CHAIBASA">CHAIBASA</option>
                                                        <option value="CHAKRADHARPUR">CHAKRADHARPUR</option>
                                                        <option value="CHAMARAJNAGAR">CHAMARAJNAGAR</option>
                                                        <option value="CHAMBA">CHAMBA</option>
                                                        <option value="CHAMPHAI">CHAMPHAI</option>
                                                        <option value="CHANDEL">CHANDEL</option>
                                                        <option value="CHANDIGARH">CHANDIGARH</option>
                                                        <option value="CHANDIGARH WEST">CHANDIGARH WEST</option>
                                                        <option value="CHANDRAPUR">CHANDRAPUR</option>
                                                        <option value="CHANDWA">CHANDWA</option>
                                                        <option value="CHANGANACHERRY">CHANGANACHERRY</option>
                                                        <option value="CHANGTONGYA">CHANGTONGYA</option>
                                                        <option value="CHARIMOODU">CHARIMOODU</option>
                                                        <option value="CHATRA">CHATRA</option>
                                                        <option value="CHEMBUR">CHEMBUR</option>
                                                        <option value="CHENGALPATTU">CHENGALPATTU</option>
                                                        <option value="CHENGANNUR">CHENGANNUR</option>
                                                        <option value="CHENNAI INFO">CHENNAI INFO</option>
                                                        <option value="CHERIAL">CHERIAL</option>
                                                        <option value="CHERTHALA">CHERTHALA</option>
                                                        <option value="CHHATARPUR">CHHATARPUR</option>
                                                        <option value="CHHINDWARA">CHHINDWARA</option>
                                                        <option value="CHICKMAGALUR">CHICKMAGALUR</option>
                                                        <option value="CHIDAMBARAM">CHIDAMBARAM</option>
                                                        <option value="CHILAKALURIPETA">CHILAKALURIPETA</option>
                                                        <option value="CHINTAPALLI">CHINTAPALLI</option>
                                                        <option value="CHIRALA">CHIRALA</option>
                                                        <option value="CHIRGAON">CHIRGAON</option>
                                                        <option value="CHIRMIRI">CHIRMIRI</option>
                                                        <option value="CHITRADURGA">CHITRADURGA</option>
                                                        <option value="CHITRANJAN">CHITRANJAN</option>
                                                        <option value="CHITTOOR">CHITTOOR</option>
                                                        <option value="CHITTORGARH">CHITTORGARH</option>
                                                        <option value="CHITTUR">CHITTUR</option>
                                                        <option value="CHUMUKEDIMA">CHUMUKEDIMA</option>
                                                        <option value="CHUNGATHARA">CHUNGATHARA</option>
                                                        <option value="CHURACHANDPUR">CHURACHANDPUR</option>
                                                        <option value="CHURACHANDPUR NORTH">CHURACHANDPUR NORTH</option>
                                                        <option value="COCHIN CENTRAL">COCHIN CENTRAL</option>
                                                        <option value="COCHIN INFO PARK">COCHIN INFO PARK</option>
                                                        <option value="COCHIN ISLANDS">COCHIN ISLANDS</option>
                                                        <option value="COCHIN VYTILLA">COCHIN VYTILLA</option>
                                                        <option value="COIMBATORE EAST">COIMBATORE EAST</option>
                                                        <option value="COIMBATORE NORTH">COIMBATORE NORTH</option>
                                                        <option value="COIMBATORE WEST">COIMBATORE WEST</option>
                                                        <option value="COONOOR">COONOOR</option>
                                                        <option value="CUDDALORE">CUDDALORE</option>
                                                        <option value="CUDDAPAH">CUDDAPAH</option>
                                                        <option value="CUTTACK">CUTTACK</option>
                                                        <option value="DADAR">DADAR</option>
                                                        <option value="DAHOD">DAHOD</option>
                                                        <option value="DALLI RAJHARA">DALLI RAJHARA</option>
                                                        <option value="DALTANGANJ">DALTANGANJ</option>
                                                        <option value="DALU">DALU</option>
                                                        <option value="DAMOH">DAMOH</option>
                                                        <option value="DAPORIJO">DAPORIJO</option>
                                                        <option value="DARBHANGA">DARBHANGA</option>
                                                        <option value="DARJEELING">DARJEELING</option>
                                                        <option value="DASUYA">DASUYA</option>
                                                        <option value="DAUND">DAUND</option>
                                                        <option value="DAVANGERE">DAVANGERE</option>
                                                        <option value="DEHRADUN">DEHRADUN</option>
                                                        <option value="DEHRI-ON-SONE">DEHRI-ON-SONE</option>
                                                        <option value="DEHU-TALEGAON">DEHU-TALEGAON</option>
                                                        <option value="DELHI BURARI">DELHI BURARI</option>
                                                        <option value="DELHI CENTRAL">DELHI CENTRAL</option>
                                                        <option value="DELHI DWARAKA">DELHI DWARAKA</option>
                                                        <option value="DELHI EAST">DELHI EAST</option>
                                                        <option value="DELHI NORTH">DELHI NORTH</option>
                                                        <option value="DELHI NORTH EAST">DELHI NORTH EAST</option>
                                                        <option value="DELHI NORTH WEST">DELHI NORTH WEST</option>
                                                        <option value="DELHI PUSHP VIHAR">DELHI PUSHP VIHAR</option>
                                                        <option value="DELHI ROHINI">DELHI ROHINI</option>
                                                        <option value="DELHI SARITA VIHAR">DELHI SARITA VIHAR</option>
                                                        <option value="DELHI SOUTH">DELHI SOUTH</option>
                                                        <option value="DELHI SOUTH WEST">DELHI SOUTH WEST</option>
                                                        <option value="DELHI VASANT KUNJ">DELHI VASANT KUNJ</option>
                                                        <option value="DELHI WEST">DELHI WEST</option>
                                                        <option value="DEOGHAR">DEOGHAR</option>
                                                        <option value="DERGANG">DERGANG</option>
                                                        <option value="DEVARAKONDA">DEVARAKONDA</option>
                                                        <option value="DEWAS">DEWAS</option>
                                                        <option value="DHALAI">DHALAI</option>
                                                        <option value="DHAMTARI">DHAMTARI</option>
                                                        <option value="DHANBAD">DHANBAD</option>
                                                        <option value="DHAR">DHAR</option>
                                                        <option value="DHARAMSHALA">DHARAMSHALA</option>
                                                        <option value="DHARIWAL">DHARIWAL</option>
                                                        <option value="DHARMAPURI">DHARMAPURI</option>
                                                        <option value="DHARMAVARAM">DHARMAVARAM</option>
                                                        <option value="DHARWAD">DHARWAD</option>
                                                        <option value="DHEMAJI">DHEMAJI</option>
                                                        <option value="DHOLPUR">DHOLPUR</option>
                                                        <option value="DHULE">DHULE</option>
                                                        <option value="DIBRUGARH">DIBRUGARH</option>
                                                        <option value="DIMAPUR EAST">DIMAPUR EAST</option>
                                                        <option value="DIMAPUR WEST">DIMAPUR WEST</option>
                                                        <option value="DINDIGUL">DINDIGUL</option>
                                                        <option value="DIPHU">DIPHU</option>
                                                        <option value="DOMBIVILI">DOMBIVILI</option>
                                                        <option value="DONGARGARH">DONGARGARH</option>
                                                        <option value="DORNAKAL">DORNAKAL</option>
                                                        <option value="DUMKA">DUMKA</option>
                                                        <option value="DUNGARPUR">DUNGARPUR</option>
                                                        <option value="DURGAPUR">DURGAPUR</option>
                                                        <option value="ECIL HYDERABAD">ECIL HYDERABAD</option>
                                                        <option value="EDAPALLY">EDAPALLY</option>
                                                        <option value="EDATHUA">EDATHUA</option>
                                                        <option value="ELURU">ELURU</option>
                                                        <option value="ELURU EAST">ELURU EAST</option>
                                                        <option value="ERAVIPEROOR">ERAVIPEROOR</option>
                                                        <option value="ERODE">ERODE</option>
                                                        <option value="ETAH">ETAH</option>
                                                        <option value="FAIZABAD">FAIZABAD</option>
                                                        <option value="FAMBONG-SOMBARIA">FAMBONG-SOMBARIA</option>
                                                        <option value="FARIDABAD">FARIDABAD</option>
                                                        <option value="FARIDKOT">FARIDKOT</option>
                                                        <option value="FARRUKHABAD">FARRUKHABAD</option>
                                                        <option value="FATEHGARH">FATEHGARH</option>
                                                        <option value="FATEHPUR">FATEHPUR</option>
                                                        <option value="FEROZPUR">FEROZPUR</option>
                                                        <option value="FORT COCHIN">FORT COCHIN</option>
                                                        <option value="G.UDAYAGIRI">G.UDAYAGIRI</option>
                                                        <option value="GADAG-BETGARI">GADAG-BETGARI</option>
                                                        <option value="GADCHANDUR">GADCHANDUR</option>
                                                        <option value="GADWAL">GADWAL</option>
                                                        <option value="GAJWEL">GAJWEL</option>
                                                        <option value="GANDHIDHAM">GANDHIDHAM</option>
                                                        <option value="GANDHINAGAR">GANDHINAGAR</option>
                                                        <option value="GANGTOK">GANGTOK</option>
                                                        <option value="GARHWA">GARHWA</option>
                                                        <option value="GAYA">GAYA</option>
                                                        <option value="GAYZING">GAYZING</option>
                                                        <option value="GHATKOPAR">GHATKOPAR</option>
                                                        <option value="GHATSILA-MUSABANI">GHATSILA-MUSABANI</option>
                                                        <option value="GHAZIABAD">GHAZIABAD</option>
                                                        <option value="GHAZIPUR">GHAZIPUR</option>
                                                        <option value="GHUGUS">GHUGUS</option>
                                                        <option value="GIDDALUR">GIDDALUR</option>
                                                        <option value="GIDEONS (ISOLATED PLACES)">GIDEONS (ISOLATED PLACES)</option>
                                                        <option value="GIRIDIH">GIRIDIH</option>
                                                        <option value="GOA MAPUSA">GOA MAPUSA</option>
                                                        <option value="GOA MARGAO">GOA MARGAO</option>
                                                        <option value="GOA PANJIM">GOA PANJIM</option>
                                                        <option value="GOA PONDA">GOA PONDA</option>
                                                        <option value="GOA VASCO">GOA VASCO</option>
                                                        <option value="GOALPARA">GOALPARA</option>
                                                        <option value="GOBICHETTIPALAYAM">GOBICHETTIPALAYAM</option>
                                                        <option value="GODDA MAHAGAMA">GODDA MAHAGAMA</option>
                                                        <option value="GODHRA">GODHRA</option>
                                                        <option value="GOKAK">GOKAK</option>
                                                        <option value="GOKAVARAM">GOKAVARAM</option>
                                                        <option value="GOLAGHAT">GOLAGHAT</option>
                                                        <option value="GOMOH">GOMOH</option>
                                                        <option value="GONDA">GONDA</option>
                                                        <option value="GONDIA">GONDIA</option>
                                                        <option value="GOOTY">GOOTY</option>
                                                        <option value="GOPALPUR">GOPALPUR</option>
                                                        <option value="GORAKHPUR">GORAKHPUR</option>
                                                        <option value="GOREGAON">GOREGAON</option>
                                                        <option value="GOSAIGAON">GOSAIGAON</option>
                                                        <option value="GREATER NOIDA">GREATER NOIDA</option>
                                                        <option value="GUDALUR">GUDALUR</option>
                                                        <option value="GUDIWADA">GUDIWADA</option>
                                                        <option value="GUDIYATHAM">GUDIYATHAM</option>
                                                        <option value="GUDUR">GUDUR</option>
                                                        <option value="GULBARGA">GULBARGA</option>
                                                        <option value="GUMLA">GUMLA</option>
                                                        <option value="GUNA">GUNA</option>
                                                        <option value="GUNDLUPET">GUNDLUPET</option>
                                                        <option value="GUNTAKAL">GUNTAKAL</option>
                                                        <option value="GUNTUR NORTH">GUNTUR NORTH</option>
                                                        <option value="GUNTUR SOUTH">GUNTUR SOUTH</option>
                                                        <option value="GURAJALA">GURAJALA</option>
                                                        <option value="GURDASPUR">GURDASPUR</option>
                                                        <option value="GURUGRAM">GURUGRAM</option>
                                                        <option value="GUWAHATI">GUWAHATI</option>
                                                        <option value="GWALIOR">GWALIOR</option>
                                                        <option value="HAFLONG">HAFLONG</option>
                                                        <option value="HALDWANI">HALDWANI</option>
                                                        <option value="HAMIRPUR">HAMIRPUR</option>
                                                        <option value="HANAMAKONDA">HANAMAKONDA</option>
                                                        <option value="HAPUR">HAPUR</option>
                                                        <option value="HARDA">HARDA</option>
                                                        <option value="HARDOI">HARDOI</option>
                                                        <option value="HARIDWAR">HARIDWAR</option>
                                                        <option value="HARUR">HARUR</option>
                                                        <option value="HASSAN">HASSAN</option>
                                                        <option value="HAVERI - RANEBENNUR">HAVERI - RANEBENNUR</option>
                                                        <option value="HAZARIBAGH">HAZARIBAGH</option>
                                                        <option value="HAZIPUR">HAZIPUR</option>
                                                        <option value="HERBERTPUR">HERBERTPUR</option>
                                                        <option value="HINDUPUR">HINDUPUR</option>
                                                        <option value="HISAR">HISAR</option>
                                                        <option value="HITECH CITY">HITECH CITY</option>
                                                        <option value="HNATHIAL">HNATHIAL</option>
                                                        <option value="HOSHANGABAD">HOSHANGABAD</option>
                                                        <option value="HOSIARPUR">HOSIARPUR</option>
                                                        <option value="HOSPET">HOSPET</option>
                                                        <option value="HOSUR NORTH">HOSUR NORTH</option>
                                                        <option value="HOSUR SOUTH">HOSUR SOUTH</option>
                                                        <option value="HUBLI">HUBLI</option>
                                                        <option value="HUBLI CENTRAL">HUBLI CENTRAL</option>
                                                        <option value="HUNSUR">HUNSUR</option>
                                                        <option value="HUZUR NAGAR">HUZUR NAGAR</option>
                                                        <option value="HYDERABAD">HYDERABAD</option>
                                                        <option value="IBRAHIMPATNAM">IBRAHIMPATNAM</option>
                                                        <option value="ICHALKARANJI">ICHALKARANJI</option>
                                                        <option value="ICHAPURAM">ICHAPURAM</option>
                                                        <option value="IDAIYANGUDI">IDAIYANGUDI</option>
                                                        <option value="IMPHAL EAST">IMPHAL EAST</option>
                                                        <option value="IMPHAL WEST">IMPHAL WEST</option>
                                                        <option value="INCHIVILA">INCHIVILA</option>
                                                        <option value="INDORE">INDORE</option>
                                                        <option value="INDORE CENTRAL">INDORE CENTRAL</option>
                                                        <option value="INKOLLU">INKOLLU</option>
                                                        <option value="IRINJALAKUDA">IRINJALAKUDA</option>
                                                        <option value="IRITTY">IRITTY</option>
                                                        <option value="ITANAGAR CITY">ITANAGAR CITY</option>
                                                        <option value="ITARSI">ITARSI</option>
                                                        <option value="JABALPUR">JABALPUR</option>
                                                        <option value="JADCHARLA">JADCHARLA</option>
                                                        <option value="JAGDALPUR">JAGDALPUR</option>
                                                        <option value="JAGDEESHPUR">JAGDEESHPUR</option>
                                                        <option value="JAGGAIAHPET">JAGGAIAHPET</option>
                                                        <option value="JAGTIAL">JAGTIAL</option>
                                                        <option value="JAHANABAD">JAHANABAD</option>
                                                        <option value="JAIGAON">JAIGAON</option>
                                                        <option value="JAIPUR CENTRAL">JAIPUR CENTRAL</option>
                                                        <option value="JAIPUR NORTH">JAIPUR NORTH</option>
                                                        <option value="JAIPUR SOUTH">JAIPUR SOUTH</option>
                                                        <option value="JAISALMER">JAISALMER</option>
                                                        <option value="JALANDHAR">JALANDHAR</option>
                                                        <option value="JALANDHAR SOUTH">JALANDHAR SOUTH</option>
                                                        <option value="JALGAON-BHUSAVAL">JALGAON-BHUSAVAL</option>
                                                        <option value="JALNA">JALNA</option>
                                                        <option value="JALORE">JALORE</option>
                                                        <option value="JALPAIGURI">JALPAIGURI</option>
                                                        <option value="JALUKIE">JALUKIE</option>
                                                        <option value="JAMMU">JAMMU</option>
                                                        <option value="JAMNAGAR">JAMNAGAR</option>
                                                        <option value="JAMPUI">JAMPUI</option>
                                                        <option value="JAMSHEDPUR">JAMSHEDPUR</option>
                                                        <option value="JAMTARA">JAMTARA</option>
                                                        <option value="JAMUI">JAMUI</option>
                                                        <option value="JANGAON">JANGAON</option>
                                                        <option value="JANGAREDDIGUDEM">JANGAREDDIGUDEM</option>
                                                        <option value="JANJGIR">JANJGIR</option>
                                                        <option value="JASHPUR">JASHPUR</option>
                                                        <option value="JATNI KHURDA">JATNI KHURDA</option>
                                                        <option value="JAUNPUR">JAUNPUR</option>
                                                        <option value="JEEDIMETLA">JEEDIMETLA</option>
                                                        <option value="JEYPORE">JEYPORE</option>
                                                        <option value="JHALAWAR">JHALAWAR</option>
                                                        <option value="JHANSI">JHANSI</option>
                                                        <option value="JHARSUGUDA">JHARSUGUDA</option>
                                                        <option value="JIRIBAM">JIRIBAM</option>
                                                        <option value="JOBAT">JOBAT</option>
                                                        <option value="JODHPUR">JODHPUR</option>
                                                        <option value="JORETHANG">JORETHANG</option>
                                                        <option value="JORHAT">JORHAT</option>
                                                        <option value="JOWAI">JOWAI</option>
                                                        <option value="JYOTHINAGAR">JYOTHINAGAR</option>
                                                        <option value="KADIRI">KADIRI</option>
                                                        <option value="KAGAL">KAGAL</option>
                                                        <option value="KAILASAPURAM">KAILASAPURAM</option>
                                                        <option value="KAIMUR">KAIMUR</option>
                                                        <option value="KAITHAL">KAITHAL</option>
                                                        <option value="KAKINADA">KAKINADA</option>
                                                        <option value="KALAMASSERY">KALAMASSERY</option>
                                                        <option value="KALIMPONG">KALIMPONG</option>
                                                        <option value="KALLURU">KALLURU</option>
                                                        <option value="KALPAKKAM">KALPAKKAM</option>
                                                        <option value="KALPETTA">KALPETTA</option>
                                                        <option value="KALWAKURTHY">KALWAKURTHY</option>
                                                        <option value="KALYAN">KALYAN</option>
                                                        <option value="KALYANDURG">KALYANDURG</option>
                                                        <option value="KAMAREDDY">KAMAREDDY</option>
                                                        <option value="KANCHIPURAM">KANCHIPURAM</option>
                                                        <option value="KANDUKUR">KANDUKUR</option>
                                                        <option value="KANGPOKPI">KANGPOKPI</option>
                                                        <option value="KANGRA">KANGRA</option>
                                                        <option value="KANIGIRI">KANIGIRI</option>
                                                        <option value="KANJIKODE">KANJIKODE</option>
                                                        <option value="KANKE">KANKE</option>
                                                        <option value="KANKER">KANKER</option>
                                                        <option value="KANNUR">KANNUR</option>
                                                        <option value="KANPUR">KANPUR</option>
                                                        <option value="KANSABEL">KANSABEL</option>
                                                        <option value="KAPURTHALA">KAPURTHALA</option>
                                                        <option value="KARAD">KARAD</option>
                                                        <option value="KARAIKUDI">KARAIKUDI</option>
                                                        <option value="KARAULI">KARAULI</option>
                                                        <option value="KARIMNAGAR">KARIMNAGAR</option>
                                                        <option value="KARIMNAGAR NORTH">KARIMNAGAR NORTH</option>
                                                        <option value="KARNAL">KARNAL</option>
                                                        <option value="KARTHIKAPALLY">KARTHIKAPALLY</option>
                                                        <option value="KARUKACHAL">KARUKACHAL</option>
                                                        <option value="KARUR">KARUR</option>
                                                        <option value="KARWAR">KARWAR</option>
                                                        <option value="KASARAGOD">KASARAGOD</option>
                                                        <option value="KASAULI">KASAULI</option>
                                                        <option value="KASGANJ">KASGANJ</option>
                                                        <option value="KASHIPUR">KASHIPUR</option>
                                                        <option value="KATHUA">KATHUA</option>
                                                        <option value="KATIHAR">KATIHAR</option>
                                                        <option value="KATNI">KATNI</option>
                                                        <option value="KATRA">KATRA</option>
                                                        <option value="KATTAKADA">KATTAKADA</option>
                                                        <option value="KATTAPANA">KATTAPANA</option>
                                                        <option value="KAVALI">KAVALI</option>
                                                        <option value="KAWARDHA">KAWARDHA</option>
                                                        <option value="KAYAMKULAM">KAYAMKULAM</option>
                                                        <option value="KAZIPET">KAZIPET</option>
                                                        <option value="KHADAKWASLA">KHADAKWASLA</option>
                                                        <option value="KHAGARIA">KHAGARIA</option>
                                                        <option value="KHALILABAD">KHALILABAD</option>
                                                        <option value="KHAMMAM NORTH">KHAMMAM NORTH</option>
                                                        <option value="KHAMMAM SOUTH">KHAMMAM SOUTH</option>
                                                        <option value="KHANDWA">KHANDWA</option>
                                                        <option value="KHANNA">KHANNA</option>
                                                        <option value="KHARAGPUR">KHARAGPUR</option>
                                                        <option value="KHARAGPUR CENTRAL">KHARAGPUR CENTRAL</option>
                                                        <option value="KHARAR">KHARAR</option>
                                                        <option value="KHARGHAR">KHARGHAR</option>
                                                        <option value="KHARKUTTA">KHARKUTTA</option>
                                                        <option value="KHATIMA">KHATIMA</option>
                                                        <option value="KHAWZAWL">KHAWZAWL</option>
                                                        <option value="KHLIEHRIAT">KHLIEHRIAT</option>
                                                        <option value="KHUMULWNG">KHUMULWNG</option>
                                                        <option value="KHUNTI MURHU">KHUNTI MURHU</option>
                                                        <option value="KIPHIRE">KIPHIRE</option>
                                                        <option value="KODAD">KODAD</option>
                                                        <option value="KODAIKANAL">KODAIKANAL</option>
                                                        <option value="KODARMA">KODARMA</option>
                                                        <option value="KODOLI">KODOLI</option>
                                                        <option value="KODUKULANJI">KODUKULANJI</option>
                                                        <option value="KOHIMA NORTH">KOHIMA NORTH</option>
                                                        <option value="KOHIMA SOUTH">KOHIMA SOUTH</option>
                                                        <option value="KOILKUNTLA">KOILKUNTLA</option>
                                                        <option value="KOKRAJHAR">KOKRAJHAR</option>
                                                        <option value="KOLAR">KOLAR</option>
                                                        <option value="KOLAR GOLD FIELDS">KOLAR GOLD FIELDS</option>
                                                        <option value="KOLASIB">KOLASIB</option>
                                                        <option value="KOLENCHERRY">KOLENCHERRY</option>
                                                        <option value="KOLHAPUR">KOLHAPUR</option>
                                                        <option value="KOLLEGAL">KOLLEGAL</option>
                                                        <option value="KONDAGAON">KONDAGAON</option>
                                                        <option value="KONDOTTY">KONDOTTY</option>
                                                        <option value="KONNI">KONNI</option>
                                                        <option value="KORAPUT">KORAPUT</option>
                                                        <option value="KORBA">KORBA</option>
                                                        <option value="KORUTLA">KORUTLA</option>
                                                        <option value="KOSA GUMUDA">KOSA GUMUDA</option>
                                                        <option value="KOTA">KOTA</option>
                                                        <option value="KOTDWARA">KOTDWARA</option>
                                                        <option value="KOTGARH">KOTGARH</option>
                                                        <option value="KOTHAGUDEM">KOTHAGUDEM</option>
                                                        <option value="KOTHAMANGALAM">KOTHAMANGALAM</option>
                                                        <option value="KOTPAD">KOTPAD</option>
                                                        <option value="KOTTARAKARA">KOTTARAKARA</option>
                                                        <option value="KOTTAYAM">KOTTAYAM</option>
                                                        <option value="KOVILPATTI">KOVILPATTI</option>
                                                        <option value="KOVVURU">KOVVURU</option>
                                                        <option value="KOZHENCHERRY">KOZHENCHERRY</option>
                                                        <option value="KRISHNAGIRI">KRISHNAGIRI</option>
                                                        <option value="KUDAPPANAKKUNNU">KUDAPPANAKKUNNU</option>
                                                        <option value="KUKATPALLY">KUKATPALLY</option>
                                                        <option value="KULATHUPUZHA">KULATHUPUZHA</option>
                                                        <option value="KULLU">KULLU</option>
                                                        <option value="KUMALI">KUMALI</option>
                                                        <option value="KUMBAKONAM">KUMBAKONAM</option>
                                                        <option value="KUMBANAD">KUMBANAD</option>
                                                        <option value="KUNDARA">KUNDARA</option>
                                                        <option value="KUNNAMKULAM">KUNNAMKULAM</option>
                                                        <option value="KURADA">KURADA</option>
                                                        <option value="KURNOOL">KURNOOL</option>
                                                        <option value="KURSEONG">KURSEONG</option>
                                                        <option value="KURTAMGARH">KURTAMGARH</option>
                                                        <option value="L.B. NAGAR">L.B. NAGAR</option>
                                                        <option value="LAKHIMPUR">LAKHIMPUR</option>
                                                        <option value="LAKHIMPUR KHERI">LAKHIMPUR KHERI</option>
                                                        <option value="LAKHIPUR">LAKHIPUR</option>
                                                        <option value="LAKHNADON">LAKHNADON</option>
                                                        <option value="LAKLA">LAKLA</option>
                                                        <option value="LALITPUR">LALITPUR</option>
                                                        <option value="LATEHAR">LATEHAR</option>
                                                        <option value="LATUR">LATUR</option>
                                                        <option value="LAWNGTLAI">LAWNGTLAI</option>
                                                        <option value="LEH">LEH</option>
                                                        <option value="LOHARDAGA">LOHARDAGA</option>
                                                        <option value="LONAVALA">LONAVALA</option>
                                                        <option value="LONGDING">LONGDING</option>
                                                        <option value="LONGLENG">LONGLENG</option>
                                                        <option value="LUCKNOW">LUCKNOW</option>
                                                        <option value="LUCKNOW SOUTH">LUCKNOW SOUTH</option>
                                                        <option value="LUCKNOW TRANSGOMTI">LUCKNOW TRANSGOMTI</option>
                                                        <option value="LUDHIANA">LUDHIANA</option>
                                                        <option value="LUMDING">LUMDING</option>
                                                        <option value="LUNGLEI">LUNGLEI</option>
                                                        <option value="MACHERLA">MACHERLA</option>
                                                        <option value="MACHILIPATNAM">MACHILIPATNAM</option>
                                                        <option value="MADANAPALLE">MADANAPALLE</option>
                                                        <option value="MADEKERI">MADEKERI</option>
                                                        <option value="MADHEPURA">MADHEPURA</option>
                                                        <option value="MADHIRA">MADHIRA</option>
                                                        <option value="MADHUPUR">MADHUPUR</option>
                                                        <option value="MADHURANTHAGAM">MADHURANTHAGAM</option>
                                                        <option value="MADHYAMGRAM">MADHYAMGRAM</option>
                                                        <option value="MADRAS CENTRAL">MADRAS CENTRAL</option>
                                                        <option value="MADRAS NORTH">MADRAS NORTH</option>
                                                        <option value="MADRAS SOUTH">MADRAS SOUTH</option>
                                                        <option value="MADRAS WEST">MADRAS WEST</option>
                                                        <option value="MADURAI EAST">MADURAI EAST</option>
                                                        <option value="MADURAI NORTH">MADURAI NORTH</option>
                                                        <option value="MADURAI SOUTH">MADURAI SOUTH</option>
                                                        <option value="MAHASAMUND">MAHASAMUND</option>
                                                        <option value="MAHBUBABAD">MAHBUBABAD</option>
                                                        <option value="MAHBUBNAGAR">MAHBUBNAGAR</option>
                                                        <option value="MAJIRI">MAJIRI</option>
                                                        <option value="MALAJKHAND">MALAJKHAND</option>
                                                        <option value="MALAYINKEEZHU">MALAYINKEEZHU</option>
                                                        <option value="MALBAZAR">MALBAZAR</option>
                                                        <option value="MALKANGIRI">MALKANGIRI</option>
                                                        <option value="MALLAPALLY">MALLAPALLY</option>
                                                        <option value="MANALI">MANALI</option>
                                                        <option value="MANANTHAVADY">MANANTHAVADY</option>
                                                        <option value="MANAPARAI">MANAPARAI</option>
                                                        <option value="MANCHERIAL">MANCHERIAL</option>
                                                        <option value="MANDLA">MANDLA</option>
                                                        <option value="MANDYA">MANDYA</option>
                                                        <option value="MANENDRAGARH">MANENDRAGARH</option>
                                                        <option value="MANGALAGIRI">MANGALAGIRI</option>
                                                        <option value="MANGALORE">MANGALORE</option>
                                                        <option value="MANGO">MANGO</option>
                                                        <option value="MANMAD">MANMAD</option>
                                                        <option value="MANNARGUDI">MANNARGUDI</option>
                                                        <option value="MANNUTHY">MANNUTHY</option>
                                                        <option value="MANOHARPUR">MANOHARPUR</option>
                                                        <option value="MANSA">MANSA</option>
                                                        <option value="MANTHANI">MANTHANI</option>
                                                        <option value="MANUGURU">MANUGURU</option>
                                                        <option value="MARKAPUR">MARKAPUR</option>
                                                        <option value="MARTHANDAM">MARTHANDAM</option>
                                                        <option value="MARTUR">MARTUR</option>
                                                        <option value="MATHURA">MATHURA</option>
                                                        <option value="MATTAMPALLI">MATTAMPALLI</option>
                                                        <option value="MAU">MAU</option>
                                                        <option value="MAVELIKARA">MAVELIKARA</option>
                                                        <option value="MAWKYRWAT">MAWKYRWAT</option>
                                                        <option value="MAYILADUTHURAI">MAYILADUTHURAI</option>
                                                        <option value="MEDAK">MEDAK</option>
                                                        <option value="MEENANGADI">MEENANGADI</option>
                                                        <option value="MEERPET">MEERPET</option>
                                                        <option value="MEERUT">MEERUT</option>
                                                        <option value="MEHDIPATNAM">MEHDIPATNAM</option>
                                                        <option value="MEHSANA">MEHSANA</option>
                                                        <option value="METPALLY">METPALLY</option>
                                                        <option value="METTUPALAYAM">METTUPALAYAM</option>
                                                        <option value="METTUR DAM">METTUR DAM</option>
                                                        <option value="MHOW">MHOW</option>
                                                        <option value="MIAO">MIAO</option>
                                                        <option value="MIRA-BHAYANDER">MIRA-BHAYANDER</option>
                                                        <option value="MIRAJ">MIRAJ</option>
                                                        <option value="MIRIK">MIRIK</option>
                                                        <option value="MIRYALAGUDA">MIRYALAGUDA</option>
                                                        <option value="MIRZAPUR">MIRZAPUR</option>
                                                        <option value="MODINAGAR">MODINAGAR</option>
                                                        <option value="MOGA">MOGA</option>
                                                        <option value="MOHALI">MOHALI</option>
                                                        <option value="MOKOKCHUNG">MOKOKCHUNG</option>
                                                        <option value="MON">MON</option>
                                                        <option value="MORADABAD">MORADABAD</option>
                                                        <option value="MOTIHARI">MOTIHARI</option>
                                                        <option value="MUDALGI">MUDALGI</option>
                                                        <option value="MUKTSAR">MUKTSAR</option>
                                                        <option value="MUL">MUL</option>
                                                        <option value="MULANTHURUTHY">MULANTHURUTHY</option>
                                                        <option value="MUMBAI BANDRA">MUMBAI BANDRA</option>
                                                        <option value="MUMBAI CENTRAL">MUMBAI CENTRAL</option>
                                                        <option value="MUNDAKKAYAM">MUNDAKKAYAM</option>
                                                        <option value="MUNGELI">MUNGELI</option>
                                                        <option value="MUNGER JAMALPUR">MUNGER JAMALPUR</option>
                                                        <option value="MUNIGUDA">MUNIGUDA</option>
                                                        <option value="MUNNAR">MUNNAR</option>
                                                        <option value="MURI">MURI</option>
                                                        <option value="MUSSOORIE">MUSSOORIE</option>
                                                        <option value="MUVATTUPUZHA">MUVATTUPUZHA</option>
                                                        <option value="MUZAFFARPUR">MUZAFFARPUR</option>
                                                        <option value="MYSORE">MYSORE</option>
                                                        <option value="NABARANGPUR">NABARANGPUR</option>
                                                        <option value="NABHA">NABHA</option>
                                                        <option value="NAGAPATTINAM">NAGAPATTINAM</option>
                                                        <option value="NAGARJUNASAGAR">NAGARJUNASAGAR</option>
                                                        <option value="NAGARKURNOOL">NAGARKURNOOL</option>
                                                        <option value="NAGAUR">NAGAUR</option>
                                                        <option value="NAGERCOIL EAST">NAGERCOIL EAST</option>
                                                        <option value="NAGERCOIL NORTH">NAGERCOIL NORTH</option>
                                                        <option value="NAGERCOIL SOUTH">NAGERCOIL SOUTH</option>
                                                        <option value="NAGERCOIL WEST">NAGERCOIL WEST</option>
                                                        <option value="NAGPUR AJANI">NAGPUR AJANI</option>
                                                        <option value="NAGPUR KAMPTEE">NAGPUR KAMPTEE</option>
                                                        <option value="NAGPUR MANKAPUR">NAGPUR MANKAPUR</option>
                                                        <option value="NAGPUR WADI">NAGPUR WADI</option>
                                                        <option value="NAHARLAGUN">NAHARLAGUN</option>
                                                        <option value="NAIDUPETA">NAIDUPETA</option>
                                                        <option value="NAIGAON">NAIGAON</option>
                                                        <option value="NAINI">NAINI</option>
                                                        <option value="NAINITAL">NAINITAL</option>
                                                        <option value="NAINPUR">NAINPUR</option>
                                                        <option value="NAKREKAL">NAKREKAL</option>
                                                        <option value="NALAGARH">NALAGARH</option>
                                                        <option value="NALANDA">NALANDA</option>
                                                        <option value="NALGONDA">NALGONDA</option>
                                                        <option value="NALGONDA SOUTH">NALGONDA SOUTH</option>
                                                        <option value="NALLASOPARA">NALLASOPARA</option>
                                                        <option value="NAMAKKAL">NAMAKKAL</option>
                                                        <option value="NAMCHI">NAMCHI</option>
                                                        <option value="NAMKUM">NAMKUM</option>
                                                        <option value="NANDED">NANDED</option>
                                                        <option value="NANDIGAMA">NANDIGAMA</option>
                                                        <option value="NANDURBAR">NANDURBAR</option>
                                                        <option value="NANDYAL">NANDYAL</option>
                                                        <option value="NARASARAOPET">NARASARAOPET</option>
                                                        <option value="NARAYANPUR">NARAYANPUR</option>
                                                        <option value="NARSAPUR MEDAK">NARSAPUR MEDAK</option>
                                                        <option value="NARSAPURAM">NARSAPURAM</option>
                                                        <option value="NARSINGPUR">NARSINGPUR</option>
                                                        <option value="NARSIPATNAM">NARSIPATNAM</option>
                                                        <option value="NASHIK">NASHIK</option>
                                                        <option value="NAVAPUR">NAVAPUR</option>
                                                        <option value="NAWADA">NAWADA</option>
                                                        <option value="NAWAN SHAHR">NAWAN SHAHR</option>
                                                        <option value="NAXALBARI">NAXALBARI</option>
                                                        <option value="NAZARETH">NAZARETH</option>
                                                        <option value="NEDUMANGADU">NEDUMANGADU</option>
                                                        <option value="NEEMUCH">NEEMUCH</option>
                                                        <option value="NELLIMOODU">NELLIMOODU</option>
                                                        <option value="NELLORE">NELLORE</option>
                                                        <option value="NELYADI">NELYADI</option>
                                                        <option value="NERUL">NERUL</option>
                                                        <option value="NEW DELHI">NEW DELHI</option>
                                                        <option value="NEYATTINKARA">NEYATTINKARA</option>
                                                        <option value="NEYVELI">NEYVELI</option>
                                                        <option value="NIDADAVOLU">NIDADAVOLU</option>
                                                        <option value="NIDUBROLU">NIDUBROLU</option>
                                                        <option value="NIGDI">NIGDI</option>
                                                        <option value="NIRMAL">NIRMAL</option>
                                                        <option value="NIULAND">NIULAND</option>
                                                        <option value="NIZAMABAD">NIZAMABAD</option>
                                                        <option value="NOIDA">NOIDA</option>
                                                        <option value="NONGPOH">NONGPOH</option>
                                                        <option value="NONGSTOIN">NONGSTOIN</option>
                                                        <option value="NORTH VANLAIPHAI">NORTH VANLAIPHAI</option>
                                                        <option value="NOWROZABAD">NOWROZABAD</option>
                                                        <option value="NUZVID">NUZVID</option>
                                                        <option value="ODDANCHATRAM">ODDANCHATRAM</option>
                                                        <option value="OLAVAKKOD">OLAVAKKOD</option>
                                                        <option value="ONGOLE">ONGOLE</option>
                                                        <option value="PADERU">PADERU</option>
                                                        <option value="PADHAR">PADHAR</option>
                                                        <option value="PAKUR - HIRANPUR">PAKUR - HIRANPUR</option>
                                                        <option value="PALAKONDA">PALAKONDA</option>
                                                        <option value="PALAMPUR">PALAMPUR</option>
                                                        <option value="PALGHAT">PALGHAT</option>
                                                        <option value="PALI MARWAR">PALI MARWAR</option>
                                                        <option value="PALLEL">PALLEL</option>
                                                        <option value="PALONCHA">PALONCHA</option>
                                                        <option value="PANCHKULA">PANCHKULA</option>
                                                        <option value="PANDALAM">PANDALAM</option>
                                                        <option value="PANIPAT">PANIPAT</option>
                                                        <option value="PANVEL">PANVEL</option>
                                                        <option value="PARALAKHEMUNDI">PARALAKHEMUNDI</option>
                                                        <option value="PARAMAKUDI">PARAMAKUDI</option>
                                                        <option value="PARASSALA">PARASSALA</option>
                                                        <option value="PARBHANI">PARBHANI</option>
                                                        <option value="PARVATHIPURAM">PARVATHIPURAM</option>
                                                        <option value="PASIGHAT">PASIGHAT</option>
                                                        <option value="PATHALGAON">PATHALGAON</option>
                                                        <option value="PATHANAMTHITTA">PATHANAMTHITTA</option>
                                                        <option value="PATHANAPURAM">PATHANAPURAM</option>
                                                        <option value="PATHANKOT">PATHANKOT</option>
                                                        <option value="PATHAPATNAM">PATHAPATNAM</option>
                                                        <option value="PATIALA">PATIALA</option>
                                                        <option value="PATNA">PATNA</option>
                                                        <option value="PATNA WEST">PATNA WEST</option>
                                                        <option value="PAURI GARWHAL">PAURI GARWHAL</option>
                                                        <option value="PAVATHIYANVILA">PAVATHIYANVILA</option>
                                                        <option value="PAYANNUR">PAYANNUR</option>
                                                        <option value="PAYYAPADY">PAYYAPADY</option>
                                                        <option value="PEDDAPALLI">PEDDAPALLI</option>
                                                        <option value="PEHOWA">PEHOWA</option>
                                                        <option value="PENDRA ROAD">PENDRA ROAD</option>
                                                        <option value="PENNAGARAM">PENNAGARAM</option>
                                                        <option value="PERAMBALUR">PERAMBALUR</option>
                                                        <option value="PEREN">PEREN</option>
                                                        <option value="PERUMBAVOOR">PERUMBAVOOR</option>
                                                        <option value="PFIITSERO">PFIITSERO</option>
                                                        <option value="PHEK">PHEK</option>
                                                        <option value="PHILLAUR">PHILLAUR</option>
                                                        <option value="PHULBANI">PHULBANI</option>
                                                        <option value="PIDUGURALLA">PIDUGURALLA</option>
                                                        <option value="PILER">PILER</option>
                                                        <option value="PILIBHIT">PILIBHIT</option>
                                                        <option value="PIMPRI">PIMPRI</option>
                                                        <option value="PINJOR - KALKA">PINJOR - KALKA</option>
                                                        <option value="PIPARIA">PIPARIA</option>
                                                        <option value="PIRAVAM">PIRAVAM</option>
                                                        <option value="PISKA NAGRI ITKI">PISKA NAGRI ITKI</option>
                                                        <option value="PITHAPURAM">PITHAPURAM</option>
                                                        <option value="PITHORAGARH">PITHORAGARH</option>
                                                        <option value="PODILI">PODILI</option>
                                                        <option value="POLLACHI">POLLACHI</option>
                                                        <option value="PONDICHERRY">PONDICHERRY</option>
                                                        <option value="PONKUNNAM">PONKUNNAM</option>
                                                        <option value="POONA CENTRAL">POONA CENTRAL</option>
                                                        <option value="POONTHURA">POONTHURA</option>
                                                        <option value="PORBANDAR">PORBANDAR</option>
                                                        <option value="PORT BLAIR">PORT BLAIR</option>
                                                        <option value="POWAI">POWAI</option>
                                                        <option value="PRATAPGARH">PRATAPGARH</option>
                                                        <option value="PRODDATUR">PRODDATUR</option>
                                                        <option value="PUDUKOTTAI">PUDUKOTTAI</option>
                                                        <option value="PULIVENDLA">PULIVENDLA</option>
                                                        <option value="PUNALUR">PUNALUR</option>
                                                        <option value="PUNGANUR">PUNGANUR</option>
                                                        <option value="PURI">PURI</option>
                                                        <option value="PURNIA">PURNIA</option>
                                                        <option value="PUTHUPPADY">PUTHUPPADY</option>
                                                        <option value="PUTTUR">PUTTUR</option>
                                                        <option value="PUTTUR DK">PUTTUR DK</option>
                                                        <option value="QUILON">QUILON</option>
                                                        <option value="RAEBARELI">RAEBARELI</option>
                                                        <option value="RAHATA-RAHURI">RAHATA-RAHURI</option>
                                                        <option value="RAICHUR">RAICHUR</option>
                                                        <option value="RAIGARH">RAIGARH</option>
                                                        <option value="RAIKIA">RAIKIA</option>
                                                        <option value="RAIPUR">RAIPUR</option>
                                                        <option value="RAJAMUNDRY">RAJAMUNDRY</option>
                                                        <option value="RAJAPALAYAM">RAJAPALAYAM</option>
                                                        <option value="RAJGANGPUR">RAJGANGPUR</option>
                                                        <option value="RAJKOT">RAJKOT</option>
                                                        <option value="RAJNANDGAON">RAJNANDGAON</option>
                                                        <option value="RAJPURA">RAJPURA</option>
                                                        <option value="RAJSAMAND">RAJSAMAND</option>
                                                        <option value="RAMACHANDRAPURAM">RAMACHANDRAPURAM</option>
                                                        <option value="RAMANATHAPURAM">RAMANATHAPURAM</option>
                                                        <option value="RAMAYAMPET">RAMAYAMPET</option>
                                                        <option value="RAMESWARAM">RAMESWARAM</option>
                                                        <option value="RAMGARH-BARKHAKANA">RAMGARH-BARKHAKANA</option>
                                                        <option value="RAMPACHODAVARAM">RAMPACHODAVARAM</option>
                                                        <option value="RAMPUR">RAMPUR</option>
                                                        <option value="RAMPUR BUSHAHR">RAMPUR BUSHAHR</option>
                                                        <option value="RANCHI">RANCHI</option>
                                                        <option value="RANCHI SOUTH">RANCHI SOUTH</option>
                                                        <option value="RANGAPARA">RANGAPARA</option>
                                                        <option value="RANIPET">RANIPET</option>
                                                        <option value="RANNI">RANNI</option>
                                                        <option value="RANNI NORTH WEST">RANNI NORTH WEST</option>
                                                        <option value="RASIPURAM">RASIPURAM</option>
                                                        <option value="RATIA CITY">RATIA CITY</option>
                                                        <option value="RATLAM">RATLAM</option>
                                                        <option value="RATNAGIRI">RATNAGIRI</option>
                                                        <option value="RAVULAPALEM">RAVULAPALEM</option>
                                                        <option value="RAXAUL">RAXAUL</option>
                                                        <option value="RAYACHOTI">RAYACHOTI</option>
                                                        <option value="RAYAGADA">RAYAGADA</option>
                                                        <option value="RAZOLE">RAZOLE</option>
                                                        <option value="RENUKOOT ANPARA">RENUKOOT ANPARA</option>
                                                        <option value="REPALLE">REPALLE</option>
                                                        <option value="RESUBELPARA">RESUBELPARA</option>
                                                        <option value="REWA">REWA</option>
                                                        <option value="ROHTAK">ROHTAK</option>
                                                        <option value="ROING">ROING</option>
                                                        <option value="ROORKEE">ROORKEE</option>
                                                        <option value="ROPAR">ROPAR</option>
                                                        <option value="RORHU">RORHU</option>
                                                        <option value="ROURKELA">ROURKELA</option>
                                                        <option value="RUDRAPRAYAG">RUDRAPRAYAG</option>
                                                        <option value="RUDRAPUR">RUDRAPUR</option>
                                                        <option value="RUPAIDIHA">RUPAIDIHA</option>
                                                        <option value="SABROOM">SABROOM</option>
                                                        <option value="SAGAR C">SAGAR C</option>
                                                        <option value="SAGAR K">SAGAR K</option>
                                                        <option value="SAHARANPUR">SAHARANPUR</option>
                                                        <option value="SAIDABAD">SAIDABAD</option>
                                                        <option value="SALEM">SALEM</option>
                                                        <option value="SALUR">SALUR</option>
                                                        <option value="SAMALKOT">SAMALKOT</option>
                                                        <option value="SAMBA">SAMBA</option>
                                                        <option value="SAMBALPUR">SAMBALPUR</option>
                                                        <option value="SAMSI">SAMSI</option>
                                                        <option value="SANATHNAGAR">SANATHNAGAR</option>
                                                        <option value="SANGAMNER">SANGAMNER</option>
                                                        <option value="SANGAREDDY">SANGAREDDY</option>
                                                        <option value="SANGLI">SANGLI</option>
                                                        <option value="SANGRUR">SANGRUR</option>
                                                        <option value="SANKARANKOVIL">SANKARANKOVIL</option>
                                                        <option value="SANKESHWAR">SANKESHWAR</option>
                                                        <option value="SANTIR BAZAR">SANTIR BAZAR</option>
                                                        <option value="SARNI">SARNI</option>
                                                        <option value="SATARA">SATARA</option>
                                                        <option value="SATHUPALLI">SATHUPALLI</option>
                                                        <option value="SATHUR">SATHUR</option>
                                                        <option value="SATNA">SATNA</option>
                                                        <option value="SATTENAPALLI">SATTENAPALLI</option>
                                                        <option value="SAWAI MADHOPUR">SAWAI MADHOPUR</option>
                                                        <option value="SECUNDERABAD">SECUNDERABAD</option>
                                                        <option value="SENAPATI">SENAPATI</option>
                                                        <option value="SEONI">SEONI</option>
                                                        <option value="SERCHHIP">SERCHHIP</option>
                                                        <option value="SHADNAGAR">SHADNAGAR</option>
                                                        <option value="SHAHDOL">SHAHDOL</option>
                                                        <option value="SHAHJAHANPUR">SHAHJAHANPUR</option>
                                                        <option value="SHAMIRPET">SHAMIRPET</option>
                                                        <option value="SHAMSHABAD">SHAMSHABAD</option>
                                                        <option value="SHILLONG EAST">SHILLONG EAST</option>
                                                        <option value="SHILLONG NORTH">SHILLONG NORTH</option>
                                                        <option value="SHILLONG SOUTH">SHILLONG SOUTH</option>
                                                        <option value="SHIMLA">SHIMLA</option>
                                                        <option value="SHIMOGA">SHIMOGA</option>
                                                        <option value="SHORNUR">SHORNUR</option>
                                                        <option value="SHREERAMPUR">SHREERAMPUR</option>
                                                        <option value="SIAHA">SIAHA</option>
                                                        <option value="SIBSAGAR">SIBSAGAR</option>
                                                        <option value="SIDDIPETA">SIDDIPETA</option>
                                                        <option value="SIKAR">SIKAR</option>
                                                        <option value="SILCHAR">SILCHAR</option>
                                                        <option value="SILIGURI">SILIGURI</option>
                                                        <option value="SIMDEGA">SIMDEGA</option>
                                                        <option value="SINDHUDURG">SINDHUDURG</option>
                                                        <option value="SINGRAULI">SINGRAULI</option>
                                                        <option value="SINGTAM">SINGTAM</option>
                                                        <option value="SIROHI">SIROHI</option>
                                                        <option value="SITAPUR (CHATTISGARH)">SITAPUR (CHATTISGARH)</option>
                                                        <option value="SITAPUR (UTTAR PRADESH)">SITAPUR (UTTAR PRADESH)</option>
                                                        <option value="SIVAGANGAI">SIVAGANGAI</option>
                                                        <option value="SIVAKASI">SIVAKASI</option>
                                                        <option value="SIWAN">SIWAN</option>
                                                        <option value="SOLAN">SOLAN</option>
                                                        <option value="SOLAPUR">SOLAPUR</option>
                                                        <option value="SONARI">SONARI</option>
                                                        <option value="SONBHADRA">SONBHADRA</option>
                                                        <option value="SONEPAT">SONEPAT</option>
                                                        <option value="SONGADH">SONGADH</option>
                                                        <option value="SRIGANGANAGAR">SRIGANGANAGAR</option>
                                                        <option value="SRIKAKULAM">SRIKAKULAM</option>
                                                        <option value="SRIKALAHASTI">SRIKALAHASTI</option>
                                                        <option value="SRINAGAR">SRINAGAR</option>
                                                        <option value="SUKMA">SUKMA</option>
                                                        <option value="SUKUMA">SUKUMA</option>
                                                        <option value="SULLURUPET">SULLURUPET</option>
                                                        <option value="SULTAN BATHERY">SULTAN BATHERY</option>
                                                        <option value="SUNABEDA">SUNABEDA</option>
                                                        <option value="SUNDARGARH">SUNDARGARH</option>
                                                        <option value="SUNDERNAGAR">SUNDERNAGAR</option>
                                                        <option value="SURANDAI">SURANDAI</option>
                                                        <option value="SURAT">SURAT</option>
                                                        <option value="SURENDRANAGAR">SURENDRANAGAR</option>
                                                        <option value="SURYAPET">SURYAPET</option>
                                                        <option value="SURYAPET NORTH">SURYAPET NORTH</option>
                                                        <option value="SURYAPET SOUTH">SURYAPET SOUTH</option>
                                                        <option value="TADEPALLEGUDEM">TADEPALLEGUDEM</option>
                                                        <option value="TADPATRI">TADPATRI</option>
                                                        <option value="TAMBARAM">TAMBARAM</option>
                                                        <option value="TAMENGLONG">TAMENGLONG</option>
                                                        <option value="TANAKPUR">TANAKPUR</option>
                                                        <option value="TANDA">TANDA</option>
                                                        <option value="TANUKU">TANUKU</option>
                                                        <option value="TARAN-TARAN">TARAN-TARAN</option>
                                                        <option value="TENALI">TENALI</option>
                                                        <option value="TENKASI">TENKASI</option>
                                                        <option value="TEZPUR">TEZPUR</option>
                                                        <option value="TEZU">TEZU</option>
                                                        <option value="THANE">THANE</option>
                                                        <option value="THANJAVUR">THANJAVUR</option>
                                                        <option value="THENI">THENI</option>
                                                        <option value="THENZAWL">THENZAWL</option>
                                                        <option value="THIDANADU">THIDANADU</option>
                                                        <option value="THIRUKOILUR">THIRUKOILUR</option>
                                                        <option value="THIRUMALA">THIRUMALA</option>
                                                        <option value="THIRUVALLUR">THIRUVALLUR</option>
                                                        <option value="THIRUVARUR">THIRUVARUR</option>
                                                        <option value="THODUPUZHA">THODUPUZHA</option>
                                                        <option value="THUNGATHURTHY">THUNGATHURTHY</option>
                                                        <option value="TILDA">TILDA</option>
                                                        <option value="TINDIVANAM">TINDIVANAM</option>
                                                        <option value="TINSUKIA">TINSUKIA</option>
                                                        <option value="TIRUCHENDUR">TIRUCHENDUR</option>
                                                        <option value="TIRUCHENGODU">TIRUCHENGODU</option>
                                                        <option value="TIRUCHIRAPALLY">TIRUCHIRAPALLY</option>
                                                        <option value="TIRUNELVELI NORTH">TIRUNELVELI NORTH</option>
                                                        <option value="TIRUNELVELI SOUTH">TIRUNELVELI SOUTH</option>
                                                        <option value="TIRUPATHI">TIRUPATHI</option>
                                                        <option value="TIRUPATTUR">TIRUPATTUR</option>
                                                        <option value="TIRUPUR">TIRUPUR</option>
                                                        <option value="TIRUVALLA">TIRUVALLA</option>
                                                        <option value="TIRUVANNAMALAI">TIRUVANNAMALAI</option>
                                                        <option value="TIRUVURU">TIRUVURU</option>
                                                        <option value="TITLAGARH">TITLAGARH</option>
                                                        <option value="TONK">TONK</option>
                                                        <option value="TRANQUEBAR">TRANQUEBAR</option>
                                                        <option value="TRICHUR">TRICHUR</option>
                                                        <option value="TRICHUR CENTRAL">TRICHUR CENTRAL</option>
                                                        <option value="TRIPUNITHURA">TRIPUNITHURA</option>
                                                        <option value="TRIVANDRUM EAST">TRIVANDRUM EAST</option>
                                                        <option value="TRIVANDRUM NORTH">TRIVANDRUM NORTH</option>
                                                        <option value="TRIVANDRUM SECRETARIAT">TRIVANDRUM SECRETARIAT</option>
                                                        <option value="TRIVANDRUM SOUTH">TRIVANDRUM SOUTH</option>
                                                        <option value="TRIVANDRUM TECHNO">TRIVANDRUM TECHNO</option>
                                                        <option value="TRIVANDRUM WEST">TRIVANDRUM WEST</option>
                                                        <option value="TSEMINYU">TSEMINYU</option>
                                                        <option value="TUENSANG">TUENSANG</option>
                                                        <option value="TUMKUR">TUMKUR</option>
                                                        <option value="TUNI">TUNI</option>
                                                        <option value="TURA">TURA</option>
                                                        <option value="TUTICORIN">TUTICORIN</option>
                                                        <option value="UDAIPUR">UDAIPUR</option>
                                                        <option value="UDAIPUR-T">UDAIPUR-T</option>
                                                        <option value="UDALGURI">UDALGURI</option>
                                                        <option value="UDAYAGIRI">UDAYAGIRI</option>
                                                        <option value="UDGIR">UDGIR</option>
                                                        <option value="UDHAMPUR">UDHAMPUR</option>
                                                        <option value="UDUMALPET">UDUMALPET</option>
                                                        <option value="UDUPI">UDUPI</option>
                                                        <option value="UJJAIN">UJJAIN</option>
                                                        <option value="UKHRUL">UKHRUL</option>
                                                        <option value="ULHAS NAGAR">ULHAS NAGAR</option>
                                                        <option value="UNA - NANGAL">UNA - NANGAL</option>
                                                        <option value="UNNAO">UNNAO</option>
                                                        <option value="UPPAL">UPPAL</option>
                                                        <option value="URIACODE">URIACODE</option>
                                                        <option value="UTHANGARAI">UTHANGARAI</option>
                                                        <option value="UTRAULA">UTRAULA</option>
                                                        <option value="VADALA">VADALA</option>
                                                        <option value="VADASERIKARA">VADASERIKARA</option>
                                                        <option value="VALAKAM">VALAKAM</option>
                                                        <option value="VALLIYOOR">VALLIYOOR</option>
                                                        <option value="VALPARAI">VALPARAI</option>
                                                        <option value="VALSAD">VALSAD</option>
                                                        <option value="VANASTHALIPURAM">VANASTHALIPURAM</option>
                                                        <option value="VANNIYACODE">VANNIYACODE</option>
                                                        <option value="VAPI">VAPI</option>
                                                        <option value="VARANASI">VARANASI</option>
                                                        <option value="VASAI">VASAI</option>
                                                        <option value="VASHI">VASHI</option>
                                                        <option value="VATTAPPARA">VATTAPPARA</option>
                                                        <option value="VATTIYOORKAVU">VATTIYOORKAVU</option>
                                                        <option value="VECHOOCHIRA">VECHOOCHIRA</option>
                                                        <option value="VELLARADA">VELLARADA</option>
                                                        <option value="VELLORE">VELLORE</option>
                                                        <option value="VERAVAL">VERAVAL</option>
                                                        <option value="VIJAYAWADA">VIJAYAWADA</option>
                                                        <option value="VIJAYAWADA EAST">VIJAYAWADA EAST</option>
                                                        <option value="VILLUPURAM">VILLUPURAM</option>
                                                        <option value="VINUKONDA">VINUKONDA</option>
                                                        <option value="VIRAR">VIRAR</option>
                                                        <option value="VIRUDHNAGAR">VIRUDHNAGAR</option>
                                                        <option value="VISHAKHAPATNAM NORTH">VISHAKHAPATNAM NORTH</option>
                                                        <option value="VISHAKHAPATNAM SOUTH">VISHAKHAPATNAM SOUTH</option>
                                                        <option value="VISHRANTWADI">VISHRANTWADI</option>
                                                        <option value="VISSANNAPETA">VISSANNAPETA</option>
                                                        <option value="VITHURA">VITHURA</option>
                                                        <option value="VIZHINJAM">VIZHINJAM</option>
                                                        <option value="VIZIANAGARAM">VIZIANAGARAM</option>
                                                        <option value="VUYYURU">VUYYURU</option>
                                                        <option value="WANAPARTHY">WANAPARTHY</option>
                                                        <option value="WANOWRIE">WANOWRIE</option>
                                                        <option value="WARANGAL">WARANGAL</option>
                                                        <option value="WARDHA">WARDHA</option>
                                                        <option value="WASHIM">WASHIM</option>
                                                        <option value="WILLIAMNAGAR">WILLIAMNAGAR</option>
                                                        <option value="WOKHA">WOKHA</option>
                                                        <option value="YADGIR">YADGIR</option>
                                                        <option value="YAMUNANAGAR">YAMUNANAGAR</option>
                                                        <option value="YAVATMAL">YAVATMAL</option>
                                                        <option value="YELLANDU">YELLANDU</option>
                                                        <option value="YEMMIGANUR">YEMMIGANUR</option>
                                                        <option value="YERCAUD">YERCAUD</option>
                                                        <option value="ZAHEERABAD">ZAHEERABAD</option>
                                                        <option value="ZIRAKPUR">ZIRAKPUR</option>
                                                        <option value="ZIRO">ZIRO</option>
                                                        <option value="ZUNHEBOTO">ZUNHEBOTO</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="paymentinfo" style="background-color: rgb(246, 248, 224);">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; height: 30px;">Membership Fee Information</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-3">
                                                <label for="lmemplan">Mode of Payment ? *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-list"></span>
                                                    </span>
                                                    <select name="paymethod" id="paymethod" class="form-control" style="font-size: 12px;" onchange="PaymentMethod()" required>
                                                        <option value="0">- Select -</option>
                                                        <option value="Payment Gateway"> Online Payment - want to Pay now </option>
                                                        <option value="Already Paid"> Already Paid - shall provide Info </option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group col-md-2" id="trid">
                                                <label for="trno">CHQ No / DD No / Tr ID *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="trno" id="trno" style="font-size: 12px;" maxlength="20" placeholder="..CHQ / DD / Tr No" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-3" id="tdate">
                                                <label for="trno">CHQ / DD / Date of Tr *</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="trdate" id="trdate" style="font-size: 12px;" maxlength="10" placeholder="..DD/MM/YYYY" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="form-group col-md-4" id="tbank">
                                                <label for="trno">Bank Name</label>
                                                <div class='input-group'>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-edit"></span>
                                                    </span>
                                                    <input type='text' class="form-control" name="trbank" id="trbank" style="font-size: 12px;" placeholder="..Bank name" autocomplete="off" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="testimony" style="background-color: #f5f5f5;">
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; height: 30px;">Personal Testimony</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group col-md-12">
                                                <label for="remarks">Type your Testimony in a short way (maximum of 500 characters)</label>
                                                <textarea rows="6" class="form-control" name="remarks" id="remarks" placeholder="..type your Testimony here " style="font-size: 12px;" maxlength="600"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>

                                <fieldset class="form-group" id="declaration" hidden>
                                    <legend class="col-md-12 col-form-label pt-0" style="font-size: 13px; font-weight: bold; color: brown">Declaration</legend>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-check col-md-12" style="text-align: justify;">
                                                <input type="checkbox" class="largerCheckbox" name="declarationCheck" id="declarationCheck" checked> &nbsp; I have prayerfully considered all the preceding questions. I now apply for membership in The Gideons International
                                                in India. I also understand that the Membership committee must examine this application and the references, as it has the responsibility of guarding the membership standards of the Association. If accepted,
                                                I agree to do the work of the ministry according to the guidelines and policies as determined by the International Cabinet of The Gideons International. If my membership be terminated for any reason, I will
                                                return my membership card and the Gideon emblem.
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <br>
                                <fieldset class="form-group" id="theSubmit">
                                    <center>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class='input-group'>
                                                    <input type="button" class="btn btn-primary" id="final-submit" value="Click here to Update Form"><div id="response" style="background-color: yellow; font-size: 12px; font-weight: bold; color: navy; letter-spacing: 3px;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </center>
                                </fieldset>

                                <div class="form-group" hidden>
                                    <label for="memno">Membership No</label>
                                    <input type='text' class="form-control" name="memno" id="memno" style="font-size: 12px;" maxlength="20" placeholder="..Membership No" autocomplete="off" />
                                </div>
                                <div class="form-group" hidden>
                                    <label for="mobile">Mobile No</label>
                                    <input type='text' class="form-control" name="mobile" id="mobile" style="font-size: 12px;" maxlength="10" placeholder="..Mobile No" autocomplete="off" />
                                </div>

                                <div class="form-group" hidden>
                                    <label for="email">Email ID</label>
                                    <input type='text' class="form-control" name="email" id="email" style="font-size: 12px;" placeholder="..Email Address" autocomplete="off" />
                                </div>

                                <div class="form-group" hidden>
                                    <label for="contactperson">Reference Person</label>
                                    <input type='text' class="form-control" name="contactperson" id="contactperson" style="font-size: 12px;" placeholder="..Search information" />
                                </div>
                            </div>
                        </div>
                        <div id="snackbar"></div>
                        <div id="res"></div>
                    </div>
                </form>
                <div style="font-weight: bold; letter-spacing:3px; text-align: center;" id="pdfdiv" hidden>
                    <button class="btn btn-success" onclick="download()">Click here to Download Filled-in Application</button>
                </div>
            </div>
        </section>

        <script type="text/javascript" language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.6/dist/loadingoverlay.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous"></script>

        <script>
                        $(function () {
                            $('#gdob').datepicker({
                                format: "dd/mm/yyyy",
                                language: "es",
                                autoclose: true,
                                todayHighlight: true
                            });
                        });
                        $('#gdob').datepicker({
                            format: "dd/mm/yyyy",
                            language: "es",
                            autoclose: true,
                            todayHighlight: true
                        });
                        $(function () {
                            $('#adob').datepicker({
                                format: "dd/mm/yyyy",
                                language: "es",
                                autoclose: true,
                                todayHighlight: true
                            });
                        });
                        $('#adob').datepicker({
                            format: "dd/mm/yyyy",
                            language: "es",
                            autoclose: true,
                            todayHighlight: true
                        });
                        $(function () {
                            $('#trdate').datepicker({
                                format: "dd/mm/yyyy",
                                language: "es",
                                autoclose: true,
                                todayHighlight: true
                            });
                        });
                        $('#trdate').datepicker({
                            format: "dd/mm/yyyy",
                            language: "es",
                            autoclose: true,
                            todayHighlight: true
                        });
        </script>
        <script>
            function memtypechange() {
                if (document.frm_apply.memtype.value === "Life Opted") {
                    document.getElementById("amemplan").value = "0";
                    document.getElementById("lmemplan1").hidden = false;
                    document.getElementById("amemplan1").hidden = true;
                    document.getElementById("Upload").hidden = true;
                } else if (document.frm_apply.memtype.value === "Annual") {
                    document.getElementById("lmemplan").value = "0";
                    document.getElementById("amemplan1").hidden = false;
                    document.getElementById("lmemplan1").hidden = true;
                    document.getElementById("Upload").hidden = true;
                }
            }
        </script>
        <script>
            function previousmembershipchange() {
                if (document.frm_apply.previousmembership.value === "Yes") {
                    swal("Since you already held Gideon membership, you need not fill this form; submit renew request online. Redirecting you to Online renewal page.");
                    window.location.assign("https://pg.gideons.org.in");
                } else {
                    document.getElementById("secv98div").hidden = false;
                }
            }
        </script>
        <script>
            function annualplanchange() {
                if (document.frm_apply.amemplan.value === "Annual Both") {
                    document.getElementById("lmemplan1").hidden = true;
                    document.getElementById("marital_status").hidden = true;
                    document.getElementById("references").hidden = false;
                    document.getElementById("gname").hidden = false;
                    document.getElementById("aname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("ginfo").hidden = false;
                    document.getElementById("ainfo").hidden = false;
                    document.getElementById("gidid").hidden = true;
                    document.getElementById("addinfo").hidden = false;
                    document.getElementById("chinfo").hidden = false;
                    document.getElementById("remark").hidden = false;
                    document.getElementById("theTable").hidden = false;
                    document.getElementById("theSubmit").hidden = false;
                    document.getElementById("filledby").hidden = false;
                    document.getElementById("paymentinfo").hidden = false;
                    document.getElementById("declaration").hidden = false;

                    document.getElementById("mfee").value = "1800";
                    document.getElementById("gfee").value = "1300";
                    document.getElementById("gfeeamount").value = "1300";
                    document.getElementById("afee").value = "500";
                    document.getElementById("afeeamount").value = "500";
                    document.getElementById("amount").value = "1800";
                    document.getElementById("lmemplan").value = "0";
                } else if (document.frm_apply.amemplan.value === "Annual Gideon") {
                    document.getElementById("lmemplan1").hidden = true;
                    document.getElementById("marital_status").hidden = false;
                    document.getElementById("references").hidden = false;
                    document.getElementById("aname").hidden = true;
                    document.getElementById("gname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("ginfo").hidden = false;
                    document.getElementById("ainfo").hidden = true;
                    document.getElementById("gidid").hidden = true;
                    document.getElementById("addinfo").hidden = false;
                    document.getElementById("chinfo").hidden = false;
                    document.getElementById("remark").hidden = false;
                    document.getElementById("theTable").hidden = false;
                    document.getElementById("theSubmit").hidden = false;
                    document.getElementById("filledby").hidden = false;
                    document.getElementById("paymentinfo").hidden = false;
                    document.getElementById("declaration").hidden = false;

                    document.getElementById("mfee").value = "1300";
                    document.getElementById("gfee").value = "1300";
                    document.getElementById("gfeeamount").value = "1300";
                    document.getElementById("afee").value = "0";
                    document.getElementById("afeeamount").value = "0";
                    document.getElementById("amount").value = "1300";
                    document.getElementById("lmemplan").value = "0";
                } else if (document.frm_apply.amemplan.value === "Annual Auxiliary") {
                    document.getElementById("lmemplan1").hidden = true;
                    document.getElementById("marital_status").hidden = true;
                    document.getElementById("references").hidden = false;
                    document.getElementById("gname").hidden = true;
                    document.getElementById("aname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("ginfo").hidden = true;
                    document.getElementById("ainfo").hidden = false;
                    document.getElementById("gidid").hidden = false;
                    document.getElementById("addinfo").hidden = false;
                    document.getElementById("chinfo").hidden = false;
                    document.getElementById("remark").hidden = false;
                    document.getElementById("theTable").hidden = false;
                    document.getElementById("theSubmit").hidden = false;
                    document.getElementById("filledby").hidden = false;
                    document.getElementById("paymentinfo").hidden = false;
                    document.getElementById("declaration").hidden = false;

                    document.getElementById("mfee").value = "500";
                    document.getElementById("gfee").value = "0";
                    document.getElementById("afee").value = "500";
                    document.getElementById("gfeeamount").value = "0";
                    document.getElementById("afeeamount").value = "500";
                    document.getElementById("amount").value = "500";
                    document.getElementById("lmemplan").value = "0";
                } else {
                    document.getElementById("lmemplan1").hidden = true;
                    document.getElementById("gname").hidden = true;
                    document.getElementById("aname").hidden = true;
                    document.getElementById("tcol").hidden = true;
                    document.getElementById("ginfo").hidden = true;
                    document.getElementById("ainfo").hidden = true;
                    document.getElementById("gidid").hidden = true;
                    document.getElementById("addinfo").hidden = true;
                    document.getElementById("chinfo").hidden = true;
                    document.getElementById("remark").hidden = true;
                    document.getElementById("theTable").hidden = true;
                    document.getElementById("theSubmit").hidden = true;
                    document.getElementById("filledby").hidden = true;
                    document.getElementById("paymentinfo").hidden = true;
                    document.getElementById("declaration").hidden = true;
                    document.getElementById("references").hidden = true;
                    document.getElementById("marital_status").hidden = true;
                }
            }
        </script>

        <script>
            function lifeplanchange() {
                if (document.frm_apply.lmemplan.value === "Life Both") {
                    document.getElementById("amemplan1").hidden = true;
                    document.getElementById("marital_status").hidden = true;
                    document.getElementById("references").hidden = false;
                    document.getElementById("gname").hidden = false;
                    document.getElementById("aname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("ginfo").hidden = false;
                    document.getElementById("ainfo").hidden = false;
                    document.getElementById("gidid").hidden = true;
                    document.getElementById("addinfo").hidden = false;
                    document.getElementById("chinfo").hidden = false;
                    document.getElementById("remark").hidden = false;
                    document.getElementById("theTable").hidden = false;
                    document.getElementById("theSubmit").hidden = false;
                    document.getElementById("filledby").hidden = false;
                    document.getElementById("paymentinfo").hidden = false;
                    document.getElementById("declaration").hidden = false;

                    document.getElementById("mfee").value = "25000";
                    document.getElementById("gfee").value = "20000";
                    document.getElementById("afee").value = "5000";
                    document.getElementById("gfeeamount").value = "20000";
                    document.getElementById("afeeamount").value = "5000";
                    document.getElementById("amount").value = "25000";
                    document.getElementById("amemplan").value = "0";
                } else if (document.frm_apply.lmemplan.value === "Life Gideon") {
                    document.getElementById("amemplan1").hidden = true;
                    document.getElementById("references").hidden = false;
                    document.getElementById("aname").hidden = true;
                    document.getElementById("gname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("ginfo").hidden = false;
                    document.getElementById("ainfo").hidden = true;
                    document.getElementById("gidid").hidden = true;
                    document.getElementById("addinfo").hidden = false;
                    document.getElementById("chinfo").hidden = false;
                    document.getElementById("remark").hidden = false;
                    document.getElementById("theTable").hidden = false;
                    document.getElementById("theSubmit").hidden = false;
                    document.getElementById("filledby").hidden = false;
                    document.getElementById("paymentinfo").hidden = false;
                    document.getElementById("declaration").hidden = false;
                    document.getElementById("marital_status").hidden = false;

                    document.getElementById("mfee").value = "20000";
                    document.getElementById("gfee").value = "20000";
                    document.getElementById("afee").value = "0";
                    document.getElementById("gfeeamount").value = "20000";
                    document.getElementById("afeeamount").value = "0";
                    document.getElementById("amount").value = "20000";
                    document.getElementById("amemplan").value = "0";
                } else if (document.frm_apply.lmemplan.value === "Life Auxiliary") {
                    document.getElementById("amemplan1").hidden = true;
                    document.getElementById("marital_status").hidden = true;
                    document.getElementById("references").hidden = false;
                    document.getElementById("gname").hidden = true;
                    document.getElementById("aname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("ginfo").hidden = true;
                    document.getElementById("ainfo").hidden = false;
                    document.getElementById("gidid").hidden = false;
                    document.getElementById("addinfo").hidden = false;
                    document.getElementById("chinfo").hidden = false;
                    document.getElementById("remark").hidden = false;
                    document.getElementById("theTable").hidden = false;
                    document.getElementById("theSubmit").hidden = false;
                    document.getElementById("filledby").hidden = false;
                    document.getElementById("paymentinfo").hidden = false;
                    document.getElementById("declaration").hidden = false;

                    document.getElementById("mfee").value = "5000";
                    document.getElementById("gfee").value = "0";
                    document.getElementById("afee").value = "5000";
                    document.getElementById("gfeeamount").value = "0";
                    document.getElementById("afeeamount").value = "5000";
                    document.getElementById("amount").value = "5000";
                    document.getElementById("amemplan").value = "0";
                } else {
                    document.getElementById("amemplan1").hidden = true;
                    document.getElementById("references").hidden = true;
                    document.getElementById("gname").hidden = true;
                    document.getElementById("aname").hidden = true;
                    document.getElementById("tcol").hidden = true;
                    document.getElementById("ginfo").hidden = true;
                    document.getElementById("ainfo").hidden = true;
                    document.getElementById("gidid").hidden = true;
                    document.getElementById("addinfo").hidden = true;
                    document.getElementById("chinfo").hidden = true;
                    document.getElementById("remark").hidden = true;
                    document.getElementById("theTable").hidden = true;
                    document.getElementById("theSubmit").hidden = true;
                    document.getElementById("filledby").hidden = true;
                    document.getElementById("paymentinfo").hidden = true;
                    document.getElementById("declaration").hidden = true;
                    document.getElementById("marital_status").hidden = true;
                }
            }
        </script>

        <script>
            function PaymentMethod() {
                if (document.frm_apply.paymethod.value === "PG") {
                    document.getElementById("trid").hidden = true;
                    document.getElementById("tdate").hidden = true;
                    document.getElementById("tbank").hidden = true;
                } else if (document.frm_apply.paymethod.value === "AP") {
                    document.getElementById("trid").hidden = false;
                    document.getElementById("tdate").hidden = false;
                    document.getElementById("tbank").hidden = false;
                } else {
                    document.getElementById("trid").hidden = true;
                    document.getElementById("tdate").hidden = true;
                    document.getElementById("tbank").hidden = true;
                }
            }
        </script>

        <script>
            function FormFilledBy() {
                if (document.frm_apply.formfilledby.value === "Field Staff") {
                    document.getElementById("ffbmembername").hidden = true;
                    document.getElementById("testimony").hidden = true;
                    document.getElementById("ffbmid").hidden = false;
                    document.getElementById("ffbname").hidden = false;
                    document.getElementById("ffbcamp").hidden = false;
                    document.getElementById("sourceofappln").value = "0";
                    document.getElementById("formfilledbymid").value = "";
                    document.getElementById("formfilledbyfoname").value = "";
                    document.getElementById("formfilledbygideonname").value = "";
                    document.getElementById("formfilledbycamp").value = "0";
                } else if (document.frm_apply.formfilledby.value === "Member") {
                    document.getElementById("ffbname").hidden = true;
                    document.getElementById("testimony").hidden = true;
                    document.getElementById("ffbmid").hidden = false;
                    document.getElementById("ffbmembername").hidden = false;
                    document.getElementById("ffbcamp").hidden = false;
                    document.getElementById("sourceofappln").value = "0";
                    document.getElementById("formfilledbymid").value = "";
                    document.getElementById("formfilledbyfoname").value = "";
                    document.getElementById("formfilledbygideonname").value = "";
                    document.getElementById("formfilledbycamp").value = "0";
                } else if (document.frm_apply.formfilledby.value === "Non Member") {
                    document.getElementById("ffbmid").hidden = true;
                    document.getElementById("ffbname").hidden = true;
                    document.getElementById("ffbmembername").hidden = true;
                    document.getElementById("ffbcamp").hidden = false;
                    document.getElementById("testimony").hidden = false;
                    document.getElementById("formfilledbymid").value = "";
                    document.getElementById("sourceofappln").value = "Personal Sign-up";
                    document.getElementById("formfilledbyfoname").value = "";
                    document.getElementById("formfilledbygideonname").value = "";
                    document.getElementById("formfilledbycamp").value = "0";
                } else {
                    document.getElementById("ffbmid").hidden = true;
                    document.getElementById("ffbname").hidden = true;
                    document.getElementById("ffbmembername").hidden = true;
                    document.getElementById("ffbcamp").hidden = true;
                    document.getElementById("testimony").hidden = true;
                }
            }
        </script>

        <script>
            function OccupationSelect() {
                if (document.frm_apply.gideonprofession.value === "Employed") {
                    document.getElementById("businessmanq1div").hidden = true;
                    document.getElementById("businessnamediv").hidden = true;
                    document.getElementById("businessnaturediv").hidden = true;
                    document.getElementById("businesstitlediv").hidden = true;
                    document.getElementById("educationdiv").hidden = false;
                    document.getElementById("worknaturediv").hidden = false;
                    document.getElementById("workplacediv").hidden = false;
                    document.getElementById("jobtitlediv").hidden = false;
                } else if (document.frm_apply.gideonprofession.value === "Businessman") {
                    document.getElementById("educationdiv").hidden = true;
                    document.getElementById("worknaturediv").hidden = true;
                    document.getElementById("workplacediv").hidden = true;
                    document.getElementById("jobtitlediv").hidden = true;
                    document.getElementById("businessmanq1div").hidden = false;
                    document.getElementById("businessnamediv").hidden = false;
                    document.getElementById("businessnaturediv").hidden = false;
                    document.getElementById("businesstitlediv").hidden = false;
                } else {
                    document.getElementById("educationdiv").hidden = true;
                    document.getElementById("worknaturediv").hidden = true;
                    document.getElementById("workplacediv").hidden = true;
                    document.getElementById("jobtitlediv").hidden = true;
                    document.getElementById("businessmanq1div").hidden = true;
                    document.getElementById("businessnamediv").hidden = true;
                    document.getElementById("businessnaturediv").hidden = true;
                    document.getElementById("businesstitlediv").hidden = true;
                }
            }
        </script>

        <script>
            function maritalStatus() {
                if (document.frm_apply.maritalstatus.value === "Married") {
                    alert("Please enter your spouse name");
                    document.getElementById("spousenamediv").hidden = false;
                    document.getElementById("spousename").focus();
                } else {
                    document.getElementById("spousenamediv").hidden = true;
                }
            }
        </script>

        <script>
            function secv987() {
                if (document.frm_apply.secv98.value === "Yes") {
                    swal({
                        title: "Sorry!",
                        text: "You are NOT eligible for The Gideons Membership",
                        icon: "error",
                        dangerMode: true,
                        buttons: ["Wronly selected.. will change and proceed", "Okay"],
                    })
                            .then((willDelete) => {
                                if (willDelete) {
                                    swal("Thank you for your Interest in The Gideons ministry", {
                                        icon: "warning",
                                    });
                                    window.location.reload();
                                } else {
                                    swal("Okay! Change your Option to proceed further");
                                    document.getElementById("secv98").value = "0";
                                    document.getElementById("secv98").focus();
                                }
                            });
                } else {
                    // document.getElementById("campdiv").hidden = false;
                    document.getElementById("completeform").hidden = false;
                }
            }
        </script>

        <script>
            $("#final-submit").click(function () {

                if ($("#previousmembership").val() === null || $("#previousmembership").val() === "" || $("#previousmembership").val() === "0") {
                    swal("Have you held previous Gideon / Auxiliary membership? Please select option..");
                    $("#previousmembership").focus();
                    return false;
                }

                if ($("#secv98").val() === null || $("#secv98").val() === "" || $("#secv98").val() === "0") {
                    swal("Does your business/profession involve manufacture or sale of tobacco or alcohol ? Please select option..");
                    $("#secv98").focus();
                    return false;
                }

                if ($("#memtype").val() === "0") {
                    swal("Please select Membership Type..");
                    $("#memtype").focus();
                    return false;
                } else if ($("#memtype").val() === "Annual") {
                    if ($("#amemplan").val() === null || $("#amemplan").val() === "0" || $("#amemplan").val() === "") {
                        swal("Please Choose the Plan..");
                        $("#amemplan").focus();
                        return false;
                    } else if ($("#amemplan").val() === "Annual Both") {
                        if ($("#gideonname").val() === null || $("#gideonname").val() === "0" || $("#gideonname").val() === "") {
                            swal("Please enter the name of the prospective Gideon");
                            $("#gideonname").focus();
                            return false;
                        } else if ($("#auxname").val() === null || $("#auxname").val() === "0" || $("#auxname").val() === "") {
                            swal("Please enter the name of the prospective Auxiliary");
                            $("#auxname").focus();
                            return false;
                        } else if ($("#fathername").val() === null || $("#fathername").val() === "0" || $("#fathername").val() === "") {
                            swal("Please enter the name of the Father of prospective Gideon");
                            $("#fathername").focus();
                            return false;
                        } else if ($("#gdob").val() === null || $("#gdob").val() === "0" || $("#gdob").val() === "") {
                            swal("Please enter the Date of Birth of prospective Gideon");
                            $("#gdob").focus();
                            return false;
                        } else if ($("#gmobile").val() === null || $("#gmobile").val() === "0" || $("#gmobile").val() === "") {
                            swal("Please enter the Mobile No of prospective Gideon");
                            $("#gmobile").focus();
                            return false;
                        } else if ($("#gemail").val() === null || $("#gemail").val() === "0" || $("#gemail").val() === "") {
                            swal("Please enter the Email ID of prospective Gideon");
                            $("#gemail").focus();
                            return false;
                        } else if ($("#gideonprofession").val() === null || $("#gideonprofession").val() === "0" || $("#gideonprofession").val() === "") {
                            swal("Please select the Occupation/Profession of prospective Gideon");
                            $("#gideonprofession").focus();
                            return false;
                        } else if ($("#gideonprofession").val() === "Employed") {
                            if ($("#education").val() === null || $("#education").val() === "0" || $("#education").val() === "") {
                                swal("Please select Educational Qualification");
                                $("#education").focus();
                                return false;
                            } else if ($("#worknature").val() === null || $("#worknature").val() === "0" || $("#worknature").val() === "") {
                                swal("Please select the Work Nature of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            } else if ($("#workplace").val() === null || $("#workplace").val() === "0" || $("#workplace").val() === "") {
                                swal("Please enter the Place of Work of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            } else if ($("#jobtitle").val() === null || $("#jobtitle").val() === "0" || $("#jobtitle").val() === "") {
                                swal("Please enter the Job Title of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            }
                        } else if ($("#gideonprofession").val() === "Businessman") {
                            if ($("#businessmanq1").val() === null || $("#businessmanq1").val() === "0" || $("#businessmanq1").val() === "") {
                                swal("Do you have more than 2 employees reporting to you ?.. please select option..");
                                $("#businessmanq1").focus();
                                return false;
                            } else if ($("#businessname").val() === null || $("#businessname").val() === "0" || $("#businessname").val() === "") {
                                swal("Please enter the Name of Business");
                                $("#businessname").focus();
                                return false;
                            } else if ($("#businessnature").val() === null || $("#businessnature").val() === "0" || $("#businessnature").val() === "") {
                                swal("Please enter the Nature of Business");
                                $("#businessnature").focus();
                                return false;
                            } else if ($("#businesstitle").val() === null || $("#businesstitle").val() === "0" || $("#businesstitle").val() === "") {
                                swal("Please enter your Business Title");
                                $("#businesstitle").focus();
                                return false;
                            }
                        } else if ($("#adob").val() === null || $("#adob").val() === "0" || $("#adob").val() === "") {
                            swal("Please enter the Date of Birth of prospective Auxiliary");
                            $("#adob").focus();
                            return false;
                        } else if ($("#amobile").val() === null || $("#amobile").val() === "0" || $("#amobile").val() === "") {
                            swal("Please enter the Mobile Number of prospective Auxiliary");
                            $("#amobile").focus();
                            return false;
                        }
                    } else if ($("#amemplan").val() === "Annual Gideon") {
                        if ($("#gideonname").val() === null || $("#gideonname").val() === "0" || $("#gideonname").val() === "") {
                            swal("Please enter the name of the prospective Gideon");
                            $("#gideonname").focus();
                            return false;
                        } else if ($("#fathername").val() === null || $("#fathername").val() === "0" || $("#fathername").val() === "") {
                            swal("Please enter the name of the Father of prospective Gideon");
                            $("#fathername").focus();
                            return false;
                        } else if ($("#gdob").val() === null || $("#gdob").val() === "0" || $("#gdob").val() === "") {
                            swal("Please enter the Date of Birth of prospective Gideon");
                            $("#gdob").focus();
                            return false;
                        } else if ($("#gmobile").val() === null || $("#gmobile").val() === "0" || $("#gmobile").val() === "") {
                            swal("Please enter the Mobile No of prospective Gideon");
                            $("#gmobile").focus();
                            return false;
                        } else if ($("#gemail").val() === null || $("#gemail").val() === "0" || $("#gemail").val() === "") {
                            swal("Please enter the Email ID of prospective Gideon");
                            $("#gemail").focus();
                            return false;
                        } else if ($("#gideonprofession").val() === null || $("#gideonprofession").val() === "0" || $("#gideonprofession").val() === "") {
                            swal("Please select the Occupation/Profession of prospective Gideon");
                            $("#gideonprofession").focus();
                            return false;
                        } else if ($("#gideonprofession").val() === "Employed") {
                            if ($("#education").val() === null || $("#education").val() === "0" || $("#education").val() === "") {
                                swal("Please select Educational Qualification");
                                $("#education").focus();
                                return false;
                            } else if ($("#worknature").val() === null || $("#worknature").val() === "0" || $("#worknature").val() === "") {
                                swal("Please select the Work Nature of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            } else if ($("#workplace").val() === null || $("#workplace").val() === "0" || $("#workplace").val() === "") {
                                swal("Please enter the Place of Work of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            } else if ($("#jobtitle").val() === null || $("#jobtitle").val() === "0" || $("#jobtitle").val() === "") {
                                swal("Please enter the Job Title of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            }
                        } else if ($("#gideonprofession").val() === "Businessman") {
                            if ($("#businessmanq1").val() === null || $("#businessmanq1").val() === "0" || $("#businessmanq1").val() === "") {
                                swal("Do you have more than 2 employees reporting to you ?.. please select option..");
                                $("#businessmanq1").focus();
                                return false;
                            } else if ($("#businessname").val() === null || $("#businessname").val() === "0" || $("#businessname").val() === "") {
                                swal("Please enter the Name of Business");
                                $("#businessname").focus();
                                return false;
                            } else if ($("#businessnature").val() === null || $("#businessnature").val() === "0" || $("#businessnature").val() === "") {
                                swal("Please enter the Nature of Business");
                                $("#businessnature").focus();
                                return false;
                            } else if ($("#businesstitle").val() === null || $("#businesstitle").val() === "0" || $("#businesstitle").val() === "") {
                                swal("Please enter your Business Title");
                                $("#businesstitle").focus();
                                return false;
                            }
                        } else if ($("#maritalstatus").val() === null || $("#maritalstatus").val() === "0" || $("#maritalstatus").val() === "") {
                            swal("Please select Marital Status");
                            $("#maritalstatus").focus();
                            return false;
                        } else if ($("#maritalstatus").val() === "Married") {
                            swal("Please enter the Name of the Spouse");
                            $("#spousename").focus();
                            return false;
                        }
                    } else if ($("#amemplan").val() === "Annual Auxiliary") {
                        if ($("#auxname").val() === null || $("#auxname").val() === "0" || $("#auxname").val() === "") {
                            swal("Please enter the Name of Prospective Auxiliary");
                            $("#auxname").focus();
                            return false;
                        } else if ($("#gid").val() === null || $("#gid").val() === "0" || $("#gid").val() === "") {
                            swal("Please enter the Gideon Membership ID");
                            $("#gid").focus();
                            return false;
                        } else if ($("#adob").val() === null || $("#adob").val() === "0" || $("#adob").val() === "") {
                            swal("Please enter the Date of Birth of Prospective Auxiliary");
                            $("#adob").focus();
                            return false;
                        } else if ($("#amobile").val() === null || $("#amobile").val() === "0" || $("#amobile").val() === "") {
                            swal("Please enter the Mobile Number of Prospective Auxiliary");
                            $("#amobile").focus();
                            return false;
                        }
                    }
                } else if ($("#memtype").val() === "Life Opted") {
                    if ($("#lmemplan").val() === null || $("#lmemplan").val() === "0" || $("#lmemplan").val() === "") {
                        swal("Please Choose the Plan..");
                        $("#lmemplan").focus();
                        return false;
                    } else if ($("#lmemplan").val() === "Life Both") {
                        if ($("#gideonname").val() === null || $("#gideonname").val() === "0" || $("#gideonname").val() === "") {
                            swal("Please enter the name of the prospective Gideon");
                            $("#gideonname").focus();
                            return false;
                        } else if ($("#auxname").val() === null || $("#auxname").val() === "0" || $("#auxname").val() === "") {
                            swal("Please enter the name of the prospective Auxiliary");
                            $("#auxname").focus();
                            return false;
                        } else if ($("#fathername").val() === null || $("#fathername").val() === "0" || $("#fathername").val() === "") {
                            swal("Please enter the name of the Father of prospective Gideon");
                            $("#fathername").focus();
                            return false;
                        } else if ($("#gdob").val() === null || $("#gdob").val() === "0" || $("#gdob").val() === "") {
                            swal("Please enter the Date of Birth of prospective Gideon");
                            $("#gdob").focus();
                            return false;
                        } else if ($("#gmobile").val() === null || $("#gmobile").val() === "0" || $("#gmobile").val() === "") {
                            swal("Please enter the Mobile No of prospective Gideon");
                            $("#gmobile").focus();
                            return false;
                        } else if ($("#gemail").val() === null || $("#gemail").val() === "0" || $("#gemail").val() === "") {
                            swal("Please enter the Email ID of prospective Gideon");
                            $("#gemail").focus();
                            return false;
                        } else if ($("#gideonprofession").val() === null || $("#gideonprofession").val() === "0" || $("#gideonprofession").val() === "") {
                            swal("Please select the Occupation/Profession of prospective Gideon");
                            $("#gideonprofession").focus();
                            return false;
                        } else if ($("#gideonprofession").val() === "Employed") {
                            if ($("#education").val() === null || $("#education").val() === "0" || $("#education").val() === "") {
                                swal("Please select Educational Qualification");
                                $("#education").focus();
                                return false;
                            } else if ($("#worknature").val() === null || $("#worknature").val() === "0" || $("#worknature").val() === "") {
                                swal("Please select the Work Nature of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            } else if ($("#workplace").val() === null || $("#workplace").val() === "0" || $("#workplace").val() === "") {
                                swal("Please enter the Place of Work of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            } else if ($("#jobtitle").val() === null || $("#jobtitle").val() === "0" || $("#jobtitle").val() === "") {
                                swal("Please enter the Job Title of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            }
                        } else if ($("#gideonprofession").val() === "Businessman") {
                            if ($("#businessmanq1").val() === null || $("#businessmanq1").val() === "0" || $("#businessmanq1").val() === "") {
                                swal("Do you have more than 2 employees reporting to you ?.. please select option..");
                                $("#businessmanq1").focus();
                                return false;
                            } else if ($("#businessname").val() === null || $("#businessname").val() === "0" || $("#businessname").val() === "") {
                                swal("Please enter the Name of Business");
                                $("#businessname").focus();
                                return false;
                            } else if ($("#businessnature").val() === null || $("#businessnature").val() === "0" || $("#businessnature").val() === "") {
                                swal("Please enter the Nature of Business");
                                $("#businessnature").focus();
                                return false;
                            } else if ($("#businesstitle").val() === null || $("#businesstitle").val() === "0" || $("#businesstitle").val() === "") {
                                swal("Please enter your Business Title");
                                $("#businesstitle").focus();
                                return false;
                            }
                        }
                        if ($("#adob").val() === null || $("#adob").val() === "0" || $("#adob").val() === "") {
                            swal("Please enter the Date of Birth of prospective Auxiliary");
                            $("#adob").focus();
                            return false;
                        }
                        if ($("#amobile").val() === null || $("#amobile").val() === "0" || $("#amobile").val() === "") {
                            swal("Please enter the Mobile Number of prospective Auxiliary");
                            $("#amobile").focus();
                            return false;
                        }
                    } else if ($("#lmemplan").val() === "Life Gideon") {
                        if ($("#gideonname").val() === null || $("#gideonname").val() === "0" || $("#gideonname").val() === "") {
                            swal("Please enter the name of the prospective Gideon");
                            $("#gideonname").focus();
                            return false;
                        } else if ($("#fathername").val() === null || $("#fathername").val() === "0" || $("#fathername").val() === "") {
                            swal("Please enter the name of the Father of prospective Gideon");
                            $("#fathername").focus();
                            return false;
                        } else if ($("#gdob").val() === null || $("#gdob").val() === "0" || $("#gdob").val() === "") {
                            swal("Please enter the Date of Birth of prospective Gideon");
                            $("#gdob").focus();
                            return false;
                        } else if ($("#gmobile").val() === null || $("#gmobile").val() === "0" || $("#gmobile").val() === "") {
                            swal("Please enter the Mobile No of prospective Gideon");
                            $("#gmobile").focus();
                            return false;
                        } else if ($("#gemail").val() === null || $("#gemail").val() === "0" || $("#gemail").val() === "") {
                            swal("Please enter the Email ID of prospective Gideon");
                            $("#gemail").focus();
                            return false;
                        } else if ($("#gideonprofession").val() === null || $("#gideonprofession").val() === "0" || $("#gideonprofession").val() === "") {
                            swal("Please select the Occupation/Profession of prospective Gideon");
                            $("#gideonprofession").focus();
                            return false;
                        } else if ($("#gideonprofession").val() === "Employed") {
                            if ($("#education").val() === null || $("#education").val() === "0" || $("#education").val() === "") {
                                swal("Please select Educational Qualification");
                                $("#education").focus();
                                return false;
                            } else if ($("#worknature").val() === null || $("#worknature").val() === "0" || $("#worknature").val() === "") {
                                swal("Please select the Work Nature of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            } else if ($("#workplace").val() === null || $("#workplace").val() === "0" || $("#workplace").val() === "") {
                                swal("Please enter the Place of Work of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            } else if ($("#jobtitle").val() === null || $("#jobtitle").val() === "0" || $("#jobtitle").val() === "") {
                                swal("Please enter the Job Title of prospective Gideon");
                                $("#worknature").focus();
                                return false;
                            }
                        } else if ($("#gideonprofession").val() === "Businessman") {
                            if ($("#businessmanq1").val() === null || $("#businessmanq1").val() === "0" || $("#businessmanq1").val() === "") {
                                swal("Do you have more than 2 employees reporting to you ?.. please select option..");
                                $("#businessmanq1").focus();
                                return false;
                            } else if ($("#businessname").val() === null || $("#businessname").val() === "0" || $("#businessname").val() === "") {
                                swal("Please enter the Name of Business");
                                $("#businessname").focus();
                                return false;
                            } else if ($("#businessnature").val() === null || $("#businessnature").val() === "0" || $("#businessnature").val() === "") {
                                swal("Please enter the Nature of Business");
                                $("#businessnature").focus();
                                return false;
                            } else if ($("#businesstitle").val() === null || $("#businesstitle").val() === "0" || $("#businesstitle").val() === "") {
                                swal("Please enter your Business Title");
                                $("#businesstitle").focus();
                                return false;
                            }
                        } else if ($("#maritalstatus").val() === null || $("#maritalstatus").val() === "0" || $("#maritalstatus").val() === "") {
                            swal("Please select Marital Status");
                            $("#maritalstatus").focus();
                            return false;
                        } else if ($("#maritalstatus").val() === "Married") {
                            swal("Please enter the Name of the Spouse");
                            $("#spousename").focus();
                            return false;
                        }
                        if ($("#gideonphotofileuploadstatus").val() === null || $("#gideonphotofileuploadstatus").val() === "" || $("#gideonphotofileuploadstatus").val() === "0") {
                            swal("Please upload prospective Gideon Photograph..");
                            $("#gideonphotofileuploadstatus").focus();
                            return false;
                        }
                        if ($("#gideonsignfileuploadstatus").val() === null || $("#gideonsignfileuploadstatus").val() === "" || $("#gideonsignfileuploadstatus").val() === "0") {
                            swal("Please upload prospective Gideon Signature..");
                            $("#gideonsignfileuploadstatus").focus();
                            return false;
                        }
                    } else if ($("#lmemplan").val() === "Life Auxiliary") {
                        if ($("#auxname").val() === null || $("#auxname").val() === "0" || $("#auxname").val() === "") {
                            swal("Please enter the Name of Prospective Auxiliary");
                            $("#auxname").focus();
                            return false;
                        } else if ($("#gid").val() === null || $("#gid").val() === "0" || $("#gid").val() === "") {
                            swal("Please enter the Gideon Membership ID");
                            $("#gid").focus();
                            return false;
                        } else if ($("#adob").val() === null || $("#adob").val() === "0" || $("#adob").val() === "") {
                            swal("Please enter the Date of Birth of Prospective Auxiliary");
                            $("#adob").focus();
                            return false;
                        } else if ($("#amobile").val() === null || $("#amobile").val() === "0" || $("#amobile").val() === "") {
                            swal("Please enter the Mobile Number of Prospective Auxiliary");
                            $("#amobile").focus();
                            return false;
                        }
                        if ($("#auxphotofileuploadstatus").val() === null || $("#auxphotofileuploadstatus").val() === "" || $("#auxphotofileuploadstatus").val() === "0") {
                            swal("Please upload prospective Auxiliary Photograph..");
                            $("#auxphotofileuploadstatus").focus();
                            return false;
                        }
                        if ($("#auxsignfileuploadstatus").val() === null || $("#auxsignfileuploadstatus").val() === "" || $("#auxsignfileuploadstatus").val() === "0") {
                            swal("Please upload prospective Auxiliary Signature..");
                            $("#auxsignfileuploadstatus").focus();
                            return false;
                        }
                    }
                }

                if ($("#addr1").val() === null || $("#addr1").val() === "" || $("#addr1").val() === "0") {
                    swal("Please enter address..");
                    $("#addr1").focus();
                    return false;
                }

                if ($("#city").val() === null || $("#city").val() === "" || $("#city").val() === "0") {
                    swal("Please enter City name..");
                    $("#city").focus();
                    return false;
                }

                if ($("#state").val() === null || $("#state").val() === "" || $("#state").val() === "0") {
                    swal("Please select state name..");
                    $("#state").focus();
                    return false;
                }

                if ($("#pincode").val() === null || $("#pincode").val() === "" || $("#pincode").val() === "0") {
                    swal("Please enter pincode..");
                    $("#pincode").focus();
                    return false;
                }

                var checkbox = document.forms['frm_apply']['s2q1'];
                if (!checkbox.checked) {
                    swal('A. Do you believe the Bible is the inspired, infallible and inerrant Word of God? (II Timothy 3:16)\n\nPlease select Option to proceed..');
                    $("#s2q1").focus();
                    return false;
                }

                var checkbox = document.forms['frm_apply']['s2q2'];
                if (!checkbox.checked) {
                    swal('Do you believe in the Lord Jesus Christ as the eternal Son of God? (John 3:16)\n\nPlease select Option to proceed..');
                    $("#s2q2").focus();
                    return false;
                }

                var checkbox = document.forms['frm_apply']['s2q3'];
                if (!checkbox.checked) {
                    swal('Have you received Him as a personal Saviour? (Romans 10:9)\n\nPlease select Option to proceed..');
                    $("#s2q3").focus();
                    return false;
                }

                var checkbox = document.forms['frm_apply']['s2q4'];
                if (!checkbox.checked) {
                    swal('Do you endeavor to follow Him in your daily life? (Romans 12:1-2)\n\nPlease select Option to proceed..');
                    $("#s2q4").focus();
                    return false;
                }

                var checkbox = document.forms['frm_apply']['s2q5'];
                if (!checkbox.checked) {
                    swal('Do you believe in the endless lake of fire for the unsaved? (Rev 20:10-15)\n\nPlease select Option to proceed..');
                    $("#s2q5").focus();
                    return false;
                }

                var checkbox = document.forms['frm_apply']['s2q6'];
                if (!checkbox.checked) {
                    swal('Do you believe in the Biblical way of marriage between one man and one woman? (Genesis 2:24)\n\nPlease select Option to proceed..');
                    $("#s2q6").focus();
                    return false;
                }

                var checkbox = document.forms['frm_apply']['s2q7'];
                if (!checkbox.checked) {
                    swal('B. Are you a layman, NOT a clergyman? (Note: clergyman means one who is generally accepted and recognized as a practicing clergyman, a pastor or a minister of a church, an evangelist, or a missionary) \n\nPlease select Option to proceed..');
                    $("#s2q7").focus();
                    return false;
                }

                var checkbox = document.forms['frm_apply']['s2q8'];
                if (!checkbox.checked) {
                    swal('C. Are you a member in good standing of a church, as your church defines membership?\n\nPlease select Option to proceed..');
                    $("#s2q8").focus();
                    return false;
                }

                if ($("#churchname").val() === null || $("#churchname").val() === "" || $("#churchname").val() === "0") {
                    swal("Please enter Church Name..");
                    $("#churchname").focus();
                    return false;
                }

                if ($("#churchcity").val() === null || $("#churchcity").val() === "" || $("#churchcity").val() === "0") {
                    swal("Please enter City name where the Church is located..");
                    $("#churchcity").focus();
                    return false;
                }

                if ($("#churchdenomination").val() === null || $("#churchdenomination").val() === "" || $("#churchdenomination").val() === "0") {
                    swal("Please select Denomination..");
                    $("#churchdenomination").focus();
                    return false;
                }

                if ($("#pastorname").val() === null || $("#pastorname").val() === "" || $("#pastorname").val() === "0") {
                    swal("Please enter Pastor Name..");
                    $("#pastorname").focus();
                    return false;
                }

                if ($("#pastormobile").val() === null || $("#pastormobile").val() === "" || $("#pastormobile").val() === "0") {
                    swal("Please enter Pastor's Mobile Number..");
                    $("#pastormobile").focus();
                    return false;
                }

                if ($("#formfilledby").val() === "0") {
                    swal("Please select Who filled this form..");
                    $("#formfilledby").focus();
                    return false;
                } else if ($("#formfilledby").val() === "Field Staff") {
                    if ($("#sourceofappln").val() === null || $("#sourceofappln").val() === "0" || $("#sourceofappln").val() === "") {
                        swal("Please select Source of Application..");
                        $("#sourceofappln").focus();
                        return false;
                    } else if ($("#formfilledbyfoname").val() === null || $("#formfilledbyfoname").val() === "0" || $("#formfilledbyfoname").val() === "") {
                        swal("Please enter the name of the field staff/officer who filled this form");
                        $("#formfilledbyfoname").focus();
                        return false;
                    } else if ($("#formfilledbycamp").val() === null || $("#formfilledbycamp").val() === "0" || $("#formfilledbycamp").val() === "") {
                        swal("Please select the Camp (of the prospective member)..");
                        $("#formfilledbycamp").focus();
                        return false;
                    }
                } else if ($("#formfilledby").val() === "Member") {
                    if ($("#sourceofappln").val() === null || $("#sourceofappln").val() === "0" || $("#sourceofappln").val() === "") {
                        swal("Please select Source of Application..");
                        $("#sourceofappln").focus();
                        return false;
                    } else if ($("#formfilledbygideonname").val() === null || $("#formfilledbygideonname").val() === "0" || $("#formfilledbygideonname").val() === "") {
                        swal("Please enter the name of the member/Camp Officer who filled this form");
                        $("#formfilledbygideonname").focus();
                        return false;
                    } else if ($("#formfilledbycamp").val() === null || $("#formfilledbycamp").val() === "0" || $("#formfilledbycamp").val() === "") {
                        swal("Please select the Camp (of the prospective member)..");
                        $("#formfilledbycamp").focus();
                        return false;
                    }
                } else if ($("#formfilledby").val() === "Non Member") {
                    if ($("#sourceofappln").val() === null || $("#sourceofappln").val() === "0" || $("#sourceofappln").val() === "") {
                        swal("Please select Source of Application..");
                        $("#sourceofappln").focus();
                        return false;
                    }
                }

                if ($("#ref1name").val() === null || $("#ref1name").val() === "" || $("#ref1name").val() === "0") {
                    swal("Please enter Reference 1 Name..");
                    $("#ref1name").focus();
                    return false;
                }

                if ($("#ref1phone").val() === null || $("#ref1phone").val() === "" || $("#ref1phone").val() === "0") {
                    swal("Please enter Reference 1 Phone..");
                    $("#ref1phone").focus();
                    return false;
                }

                if ($("#ref2name").val() === null || $("#ref2name").val() === "" || $("#ref2name").val() === "0") {
                    swal("Please enter Reference 1 Name..");
                    $("#ref2name").focus();
                    return false;
                }

                if ($("#ref2phone").val() === null || $("#ref2phone").val() === "" || $("#ref2phone").val() === "0") {
                    swal("Please enter Reference 1 Phone..");
                    $("#ref2phone").focus();
                    return false;
                }

                if ($("#paymethod").val() === "0") {
                    swal("Please select Payment Method..");
                    $("#paymethod").focus();
                    return false;
                } else if ($("#paymethod").val() === "AP") {
                    if ($("#trno").val() === null || $("#trno").val() === "0" || $("#trno").val() === "") {
                        swal("Please enter Transaction Number..");
                        $("#trno").focus();
                        return false;
                    } else if ($("#trdate").val() === null || $("#trdate").val() === "0" || $("#trdate").val() === "") {
                        swal("Please select Transaction Date");
                        $("#trdate").focus();
                        return false;
                    }
                }

                var checkbox = document.forms['frm_apply']['declarationCheck'];
                if (!checkbox.checked) {
                    swal('Please read and agree the terms and conditions mentioned in the Declaration Section');
                    $("#declarationCheck").focus();
                    return false;
                }

                event.preventDefault();
                if (confirm) {
                    $("#final-submit").hide();
                    $.ajax({
                        url: "updateForm.jsp",
                        method: "POST",
                        data: $('#frm_apply').serialize(),
                        beforeSend: function () {
                            $('#response').html('<span class="text-info">Processing...</span>');
                        },
                        success: function (data) {
                            swal(data);
                            $('#response').hide();
                            $("#final-submit").show();
                        }
                    });
                } else {
                    swal({
                        title: "Okay!",
                        text: "You missed something? Please go through the form and Submit"
                    });
                }
            });
        </script>
        <script>
            $('#gmobile, #gwmobile, #amobile, #awmobile, #pincode, #pastormobile, #ref1phone, #ref2phone').keypress(function (e) {
                if (e.which !== 8 && e.which !== 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
        </script>
    </body>
</html>
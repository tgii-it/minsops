<%-- 
    Document   : renewonline
    Created on : 16-Nov-2020, 4:36:16 pm
    Author     : TGII_WORKSTATION
--%>

<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String v_camp = request.getParameter("camp");
    if (v_camp == null) {
        v_camp = "";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | Membership Renewals</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/js/select2.min.js"></script>

        <script>
            $(document).ready(function () {
                load_json_data('camp');
                function load_json_data(id, parent_id)
                {
                    var html_code = '';
                    $.getJSON('/CampsListJson.jsp', function (data) {
                        html_code += '<option value="">- Select Camp-</option>';
                        $.each(data, function (key, value) {
                            html_code += '<option value="' + value.camp + '">' + value.camp + '</option>';
                        });
                        $('#' + id).html(html_code);
                    });
                }

                $(document).on('change', '#camp', function () {
                    var country_id = $(this).val();
                    if (country_id !== '')
                    {
                        load_json_data1('gideonname', country_id);
                        load_json_data2('auxname', country_id);

                        function load_json_data1(id, parent_id)
                        {
                            var html_code = '';
                            $.getJSON('/CampGmembersJson.jsp?camp=' + country_id, function (data) {
                                html_code += '<option value="0">- Select Gideon Name -</option>';
                                $.each(data, function (key, value) {
                                    html_code += '<option value="' + value.name + '">' + value.name + '</option>';
                                });
                                $('#' + id).html(html_code);
                            });
                        }

                        function load_json_data2(id, parent_id)
                        {
                            var html_code = '';
                            $.getJSON('/CampAmembersJson.jsp?camp=' + country_id, function (data) {
                                html_code += '<option value="0">- Select Auxiliary Name -</option>';
                                $.each(data, function (key, value) {
                                    html_code += '<option value="' + value.name + '">' + value.name + '</option>';
                                });
                                $('#' + id).html(html_code);
                            });
                        }
                    } else
                    {
                        $('#gideonname').html('<option value="">Select Gideon</option>');
                        $('#auxname').html('<option value="">Select Auxiliary</option>');
                    }
                });

            });
        </script>
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

            @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 14px;}
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
                cursor:pointer; 
                vertical-align: middle;
            }
            .navbar li a, .navbar .navbar-brand {
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

            .Banner  {	
                padding-bottom:2%;
                background-color:#1765b4;
                position: relative;
            }

            .BannerImage  {		
                background-repeat: no-repeat; 		 	
                position: absolute;
                display: block;
                width: 100%;
                overflow:hidden;	
            }
            .ImageBanner .BannerImage  {		
                background-position: 25% 0; 
                background-size: 175%;	
                padding-bottom: 70%;
            }

            .VideoBanner .BannerImage  {		
                background-position: center top; 
                background-size: 128%;	
                padding-bottom: 100%;
            }
            .GCPBanner {background-image: url(../images/banner-video-gcp.jpg);}

            .BannerText {
                padding:88% 0 5% 0;
                text-align: center;
            }	
            .VideoBanner .BannerText { padding-top:92%; }

            .Banner h1 { 
                color: #fff;
            }	

            .Banner h3 { color: #d2ab67; }

            .Banner h3.Title {
                color: #fff;
                padding-top: 0;
            }		
            .Banner .Title:hover { color: #ffe114; }

            .Banner .More {
                font-size:1.125em;
                color: #d2ab67;
                padding:0;
            }		
            .Banner .More:hover { color: #ffe114; }

            .Banner .More:before { display: none; }

            .Banner .PlayButton {
                position: relative;
                margin: 0.375em auto 1em auto;
                width: 5em;
                height: 0;
                padding-bottom: 5em;
                display: block;
                text-align:center;
                text-decoration: none;
            }

            .Banner .PlayButton:after { 
                position: absolute;
                top: .075em;
                left: 50%;
                margin-left:-.5em;
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
                -webkit-transform:scale(1.25);
                -moz-transform:scale(1.25);
                -o-transform:scale(1.5);
                transform:scale(1.25);
            }	


            @media (max-width:40em) and (min-width:0) {

                .Banner .Button { 
                    margin: 0.25em auto 1em auto;
                    background: #d2ab67;
                    color: #193f66;
                }
                .Banner .Button:hover, .Banner .Button:focus  { background: #ffe114; outline: none; }	

            }	

            @media only screen and (min-width: 40em) {		

                .Banner  {	
                    height: 25em;
                    padding-bottom: 0;
                }

                .BannerImage, .ImageBanner .BannerImage, .VideoBanner .BannerImage  {	
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
                    top:0;
                    left: 0;
                    width: 100%; 
                    height: 100%;
                    /* IE9 SVG, needs conditional override of 'filter' to 'none' */
                    background: -moz-linear-gradient(left,  rgba(17,17,17,0) 0%, rgba(17,17,17,0) 25%, rgba(17,17,17,0.8) 100%); /* FF3.6+ */
                    background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(17,17,17,0)), color-stop(25%,rgba(17,17,17,0)), color-stop(100%,rgba(17,17,17,0.8))); /* Chrome,Safari4+ */
                    background: -webkit-linear-gradient(left,  rgba(17,17,17,0) 0%,rgba(17,17,17,0) 25%,rgba(17,17,17,0.8) 100%); /* Chrome10+,Safari5.1+ */
                    background: -o-linear-gradient(left,  rgba(17,17,17,0) 0%,rgba(17,17,17,0) 25%,rgba(17,17,17,0.8) 100%); /* Opera 11.10+ */
                    background: -ms-linear-gradient(left,  rgba(17,17,17,0) 0%,rgba(17,17,17,0) 25%,rgba(17,17,17,0.8) 100%); /* IE10+ */
                    background: linear-gradient(to right,  rgba(17,17,17,0) 0%,rgba(17,17,17,0) 25%,rgba(17,17,17,0.8) 100%); /* W3C */
                    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00111111', endColorstr='#cc111111',GradientType=1 ); /* IE6-8 */
                }

                .Banner .Wrapper {/* http://css-tricks.com/centering-in-the-unknown/ */
                    padding-top: 0;
                    height: 100%; 
                    position: relative;
                } 

                .Banner .Wrapper:before {
                    content: '';
                    display: inline-block;
                    height: 100%; 
                    vertical-align: middle;
                    margin-right: -0.25em; /* Adjusts for spacing */
                }

                .BannerText {/* pseudo element to help vertically center text */
                    display: inline-block;
                    vertical-align: middle;
                    width: 99.25%;
                    padding:0;
                }
                .ImageBanner .BannerText { 
                    width:65.5%;
                    margin-top: -17%;
                    margin-left: 34%;
                    text-align:right;
                    font-size: 1.25em;
                }
                .VideoBanner .BannerText { padding-top:0; }

                .French	.ImageBanner .BannerText { font-size: 0.875em; }

                .Banner h3 { color: #ffe114; }				
                .Banner h3.Title { padding-bottom:.75em; }

                .Banner .More {
                    font-size:1.25em;
                    position: relative;
                    padding-right: 1.5em;

                    -webkit-transition: padding-right 0.3s;
                    -moz-transition: padding-right 0.3s;
                    -o-transition: padding-right 0.3s;
                    transition: padding-right 0.3s;
                }		

                .Banner .More:after  {
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

                .Banner .More:hover {padding-right: 1.75em; }
                .Banner .More:hover:after {color: #ffe114; }

                .Banner .Button { 
                    float:right;
                    margin: .75em 0 0 0;
                }


                .Banner .PlayButton {
                    margin:  1em auto 0 auto;	
                    width: 7.5em;
                    padding-bottom: 7.5em;
                }

                .Banner .PlayButton:after { 		
                    color: #2185eb;
                    font-size: 120px /*7.5em*/;
                    opacity: .8;
                }	

            }

            @media only screen and (min-width: 60em) {	

                .ImageBanner.Banner {height: 35.25em; }
                .ImageBanner .BannerImage  { height: 35.25em; }

                .VideoBanner.Banner {height: 45em; }		
                .VideoBanner .BannerImage  { height: 45em;  }

                .ImageBanner .BannerImage:before { 
                    /* IE9 SVG, needs conditional override of 'filter' to 'none' */
                    background: url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIxMDAlIiB5Mj0iMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzExMTExMSIgc3RvcC1vcGFjaXR5PSIwIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjUwJSIgc3RvcC1jb2xvcj0iIzExMTExMSIgc3RvcC1vcGFjaXR5PSIwIi8+CiAgICA8c3RvcCBvZmZzZXQ9IjEwMCUiIHN0b3AtY29sb3I9IiMxMTExMTEiIHN0b3Atb3BhY2l0eT0iMC44Ii8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
                    background: -moz-linear-gradient(left,  rgba(17,17,17,0) 0%, rgba(17,17,17,0) 50%, rgba(17,17,17,0.8) 100%); /* FF3.6+ */
                    background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(17,17,17,0)), color-stop(50%,rgba(17,17,17,0)), color-stop(100%,rgba(17,17,17,0.8))); /* Chrome,Safari4+ */
                    background: -webkit-linear-gradient(left,  rgba(17,17,17,0) 0%,rgba(17,17,17,0) 50%,rgba(17,17,17,0.8) 100%); /* Chrome10+,Safari5.1+ */
                    background: -o-linear-gradient(left,  rgba(17,17,17,0) 0%,rgba(17,17,17,0) 50%,rgba(17,17,17,0.8) 100%); /* Opera 11.10+ */
                    background: -ms-linear-gradient(left,  rgba(17,17,17,0) 0%,rgba(17,17,17,0) 50%,rgba(17,17,17,0.8) 100%); /* IE10+ */
                    background: linear-gradient(to right,  rgba(17,17,17,0) 0%,rgba(17,17,17,0) 50%,rgba(17,17,17,0.8) 100%); /* W3C */
                    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#00111111', endColorstr='#cc111111',GradientType=1 ); /* IE6-8 */
                }

                .French	.ImageBanner .BannerText { font-size: 2em; }

                .Banner .More { font-size:1em;/*24px*/ }
                .Banner .More:after  { top: 0.2em;}

                .French .Banner .More { font-size:1.25em;/*24px*/ }
                .French .Banner .More:after  { top: 0.3em; }

                .Banner .PlayButton {
                    margin-top:  3em ;		
                    width: 8.5em;
                    padding-bottom: 8.5em;
                }

                .Banner .PlayButton:after {font-size: 128px /*8em*/; }

            }
            .Spotlight {color: #1765b4; }

            .Listing, .LargeListing { text-align: center; }
            .Listing .Wrapper .CF {margin-bottom: 1em ; }
            .CF:before, .CF:after { 
                content: ""; 
                display: table; 
            }
            .CF:after { clear: both; }
            .CF { *zoom: 1;}

            .Clear { clear: both; }
            .Button {
                color: #fff;
                text-transform: uppercase;
                text-decoration:none;
                text-align:center;
                font: normal 1.25em/1.4 'oswaldlight', Arial, Helvetica, sans-serif; 

                display:inline-block;
                zoom: 1;
                *display:inline;	
                border:none;
                background: #1765b4;
                height: auto;
                width:auto;
                margin: .5em 0;
                padding: 0.5em 1.5em;
                border-radius: 0.25em; 
                cursor: pointer;

                -webkit-transition: all 0.5s;
                -moz-transition: all 0.5s;
                -o-transition: all 0.5s;
                transition: all 0.5s;
            }

            .Button:hover, .Button:focus  { color: #fff; background: #2185eb; outline: none; }

            .ButtonGroup .Button, .ButtonGroup .More { margin: .5em 1.5em ; }	

            .Button.CompletedCampaign {
                background: #222;
                cursor: auto;
            }	

            .Button.Gold { 
                background: #d2ab67; 
                color: #1765b4;
            }
            .Button.Gold:hover, .Button.Gold:focus  { color: #1765b4; background: #e0b874; outline: none; }

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
                font-size: 13px;
                color: navy;
                padding: 3px;
            }

            .select2-selection__rendered {
                font-size: 13px;
                color: navy;
                white-space: normal;
                word-break: break-all;
            }
        </style>
        <script>
            $(function () {
                $("#dialog").dialog();
            });
        </script>
        <script>
            function submitForm() {
                document.forms["frm_apply"].submit();
            }
        </script>
        <script type='text/javascript' src='js/loadImg.js'></script>
        <script type='text/javascript'>
            $(function () {
                $('img').imgPreload()
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
            .no-js #loader { display: none;  }
            .js #loader { display: block; position: absolute; left: 100px; top: 0; }
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
    <body style="background-color: #fff; width: 100%;" onload="memtypechange();">
        <!--<body style="background-color: #fff; width: 100%;" onload="noBack(); memtypechange();" onpageshow="if (event.persisted) noBack();">
            <div id="loader" class="se-pre-con"></div>
            <div id="dialog" title="Grace Period Extended" style="padding: 30px 50px;">
                Dear Gideon,<br>The Grace period to<br>Renew your Membership<br>has been Extended<br>till 10<sup>th</sup> April, 2019<br><br><b>Renew today</b>
            </div>
            <div id="mySidenav" class="sidenav">
                <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>            
            </div>-->
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">                            
                <a href="#"><img alt="The Gideons International" src="https://pg.gideons.org.in/images/GideonsLogo2.png" align="left"  height="50" width="170"  style="padding: 5px;"/></a>
            </div>
        </nav>
        <section id="main" style="padding: 60px 0px;">
            <div class="container">
                <form role="form" name="frm_apply" id="frm_apply" class="registration-form" action="renewalUpdate.jsp" onsubmit="return submitForm();">
                    <div class='panel panel-default panel-accent-gold'>
                        <div class="panel-heading" style="background-color: #fff;">
                            <h3 class="panel-title" style="vertical-align: middle; font-size: 13px; font-weight: bold; color: #14599f;">
                                <i class="fa fa-fw fa-share"></i>&nbsp; MEMBERSHIP : &nbsp; O N L I N E &nbsp;&nbsp; R E N E W A L
                            </h3>
                        </div>

                        <div class="panel-body" style="padding-top: 20px; font-size: 13px; width: 100%"> 
                            <div class="form-group">
                                <label for="camp">Camp Name *</label>
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-list"></span>
                                    </span>
                                    <select name="camp" id="camp" class="form-control input-md" style="font-size: 13px; color: navy;" required>
                                        <option value="0">Select Camp</option>
                                    </select>
                                </div>                                            
                            </div> 
                            <div class="form-group">
                                <label for="memtype">Member Type *</label>
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-list"></span>
                                    </span>
                                    <select name="memtype" id="memtype" class="form-control input-md" onchange="memtypechange()" style="font-size: 13px; color: navy;" required>
                                        <option value="Annual" selected> Annual Membership </option>
                                        <option value="Life Opted"> Opt Life Membership </option>
                                    </select>
                                </div>                                            
                            </div>
                            <div class="form-group" id="amemplan1" hidden>
                                <label for="amemplan">Annual Plan *</label>
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-list"></span>
                                    </span>
                                    <select name="amemplan" id="amemplan" class="form-control input-md" onchange="annualplanchange()" style="font-size: 13px; color: navy;" required>
                                        <option value="0">- Select -</option>
                                        <option value="Annual Both"> Annual Gideon &amp; Auxiliary </option>
                                        <option value="Annual Gideon"> Annual Gideon </option>
                                        <option value="Annual Auxiliary"> Annual Auxiliary </option>
                                    </select>
                                </div>                                            
                            </div>
                            <div class="form-group" id="lmemplan1" hidden>
                                <label for="lmemplan">Life Plan *</label>
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-list"></span>
                                    </span>
                                    <select name="lmemplan" id="lmemplan" class="form-control input-md" onchange="lifeplanchange()" style="font-size: 13px;" required>
                                        <option value="0">- Select -</option>
                                        <option value="Life Both"> Life Gideon &amp; Auxiliary </option>
                                        <option value="Life Gideon"> Life Gideon </option>
                                        <option value="Life Auxiliary"> Life Auxiliary </option>
                                    </select>
                                </div>                                            
                            </div> 
                            <table class="table table-bordered table-responsive table-hover" style="width: 100%; font-size: 13px;" id="tcol" hidden>
                                <thead style="background-color: #01354a; color: #ffe114;">
                                    <tr>
                                        <th style="text-align: left;" nowrap>&nbsp; Member Name *</th>
                                        <th style="text-align: center;" nowrap>&nbsp; Fee &nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="gname" hidden>
                                        <td>
                                            <input type="hidden" name="campname" id="campname" value="<%=v_camp%>" >
                                            <select name="gideonname" id="gideonname" class="form-control input-md">
                                                <option value="">Select Gideon</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control input-md" name="gfee" id="gfee" style="text-align: center; background-color: #fff; padding: 0px;" readonly>
                                            <input type="hidden" name="gfeeamount" id="gfeeamount">
                                        </td>
                                    </tr>
                                    <tr id="aname" hidden>
                                        <td>
                                            <select name="auxname" id="auxname" class="form-control input-md">
                                                <option value="">Select Auxiliary</option>
                                            </select>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control input-md" name="afee" id="afee" style="text-align: center; background-color: #fff; padding: 0px;" readonly>
                                            <input type="hidden" name="afeeamount" id="afeeamount" >
                                        </td>
                                    </tr>
                                    <tr style="background-color: yellow; color: navy; font-weight: bold; font-size: 14px;">
                                        <td style="width: 75%; text-align: right;">Total Amount&nbsp;</td>
                                        <td style="width: 25%;">
                                            <input type="text" class="form-control input-md" name="mfee" id="mfee" readonly style="text-align: center; background-color: #fff; padding: 0px;">
                                            <input type="hidden" name="amount" id="amount">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>   
                            <div class="form-group" hidden>
                                <label for="memno">Membership No</label>
                                <input type='text' class="form-control input-md" name="memno" id="memno" style="font-size: 13px;" maxlength="20" placeholder="..Membership No" autocomplete="off"/>
                            </div>   
                            <div class="form-group" hidden>
                                <label for="mobile">Mobile No</label>
                                <input type='text' class="form-control input-md" name="mobile" id="mobile" style="font-size: 13px;" maxlength="10" placeholder="..Mobile No" autocomplete="off"/>
                            </div>   

                            <div class="form-group" hidden>
                                <label for="email">Email ID</label>
                                <input type='text' class="form-control input-md" name="email" id="email" style="font-size: 13px;" placeholder="..Email Address" autocomplete="off"/>
                            </div>

                            <div class="form-group" hidden>
                                <label for="contactperson">Reference Person</label>
                                <input type='text' class="form-control input-md" name="contactperson" id="contactperson" style="font-size: 13px;" placeholder="..Search information"/>
                            </div>

                            <div class="form-group" id="tremarks" hidden>
                                <label for="remarks">Remarks, if any</label>
                                <input type='text' class="form-control input-md" name="remarks" id="remarks" placeholder="..type your comments here "  style="font-size: 13px;" autocomplete="off"/>
                            </div>   

                            <div class="form-group" id="fsubmit" hidden>
                                <div class='input-group pull-right' style="padding-top: 15px;">
                                    <input type="submit" class="btn btn-primary" id="final-submit" value="Submit Form">
                                </div>                                            
                            </div>
                        </div>
                        <div id="snackbar"></div>
                        <div id="res"></div>
                    </div>
                </form>
            </div>
        </section>
        <footer class="footer">
            <span class="text-muted">&nbsp;</span>
        </footer>
        <script type="text/javascript" language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script>
                                        function memtypechange() {
                                            if (document.frm_apply.memtype.value === "Life Opted") {
                                                document.getElementById("lmemplan1").hidden = false;
                                                document.getElementById("amemplan1").hidden = true;

                                                document.getElementById("gideonname").value = "";
                                                document.getElementById("auxname").value = "";
                                                document.getElementById("mfee").value = "";
                                                document.getElementById("gfee").value = "";
                                                document.getElementById("afee").value = "";
                                                document.getElementById("gfeeamount").value = "";
                                                document.getElementById("afeeamount").value = "";
                                                document.getElementById("amount").value = "";
                                                document.getElementById("amemplan").value = "0";

                                            } else if (document.frm_apply.memtype.value === "Annual") {
                                                document.getElementById("amemplan1").hidden = false;
                                                document.getElementById("lmemplan1").hidden = true;

                                                document.getElementById("lmemplan").value = "0";
                                                document.getElementById("gideonname").value = "";
                                                document.getElementById("auxname").value = "";
                                                document.getElementById("mfee").value = "";
                                                document.getElementById("gfee").value = "";
                                                document.getElementById("afee").value = "";
                                                document.getElementById("gfeeamount").value = "";
                                                document.getElementById("afeeamount").value = "";
                                                document.getElementById("amount").value = "";

                                            } else {
                                                document.getElementById("lmemplan1").hidden = true;
                                                document.getElementById("amemplan1").hidden = true;

                                                document.getElementById("lmemplan").value = "0";
                                                document.getElementById("amemplan").value = "0";
                                                document.getElementById("gideonname").value = "";
                                                document.getElementById("auxname").value = "";
                                                document.getElementById("mfee").value = "";
                                                document.getElementById("gfee").value = "";
                                                document.getElementById("afee").value = "";
                                                document.getElementById("gfeeamount").value = "";
                                                document.getElementById("afeeamount").value = "";
                                                document.getElementById("amount").value = "";
                                            }
                                        }
        </script>
        <script>
            function annualplanchange() {
                if (document.frm_apply.amemplan.value === "Annual Both") {
                    document.getElementById("lmemplan1").hidden = true;
                    document.getElementById("gname").hidden = false;
                    document.getElementById("aname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("tremarks").hidden = false;
                    document.getElementById("fsubmit").hidden = false;

                    document.getElementById("gideonname").value = "";
                    document.getElementById("auxname").value = "";
                    document.getElementById("mfee").value = "1800";
                    document.getElementById("gfee").value = "1300";
                    document.getElementById("gfeeamount").value = "1300";
                    document.getElementById("afee").value = "500";
                    document.getElementById("afeeamount").value = "500";
                    document.getElementById("amount").value = "1800";
                    document.getElementById("lmemplan").value = "0";

                } else if (document.frm_apply.amemplan.value === "Annual Gideon") {
                    document.getElementById("lmemplan1").hidden = true;
                    document.getElementById("aname").hidden = true;
                    document.getElementById("gname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("tremarks").hidden = false;
                    document.getElementById("fsubmit").hidden = false;

                    document.getElementById("gideonname").value = "";
                    document.getElementById("auxname").value = "";
                    document.getElementById("mfee").value = "1300";
                    document.getElementById("gfee").value = "1300";
                    document.getElementById("gfeeamount").value = "1300";
                    document.getElementById("afee").value = "0";
                    document.getElementById("afeeamount").value = "0";
                    document.getElementById("amount").value = "1300";
                    document.getElementById("lmemplan").value = "0";

                } else if (document.frm_apply.amemplan.value === "Annual Auxiliary") {
                    document.getElementById("lmemplan1").hidden = true;
                    document.getElementById("gname").hidden = true;
                    document.getElementById("aname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("tremarks").hidden = false;
                    document.getElementById("fsubmit").hidden = false;

                    document.getElementById("gideonname").value = "";
                    document.getElementById("auxname").value = "";
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
                    document.getElementById("tremarks").hidden = true;
                    document.getElementById("fsubmit").hidden = true;
                    document.getElementById("gideonname").value = "";
                    document.getElementById("auxname").value = "";
                    document.getElementById("mfee").value = "";
                    document.getElementById("gfee").value = "";
                    document.getElementById("afee").value = "";
                    document.getElementById("gfeeamount").value = "";
                    document.getElementById("afeeamount").value = "";
                    document.getElementById("amount").value = "";
                    document.getElementById("lmemplan").value = "0";
                }
            }
        </script>

        <script>
            function lifeplanchange() {
                if (document.frm_apply.lmemplan.value === "Life Both") {
                    document.getElementById("amemplan1").hidden = true;
                    document.getElementById("gname").hidden = false;
                    document.getElementById("aname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("tremarks").hidden = false;
                    document.getElementById("fsubmit").hidden = false;

                    document.getElementById("gideonname").value = "";
                    document.getElementById("auxname").value = "";
                    document.getElementById("mfee").value = "25000";
                    document.getElementById("gfee").value = "20000";
                    document.getElementById("afee").value = "5000";
                    document.getElementById("gfeeamount").value = "20000";
                    document.getElementById("afeeamount").value = "5000";
                    document.getElementById("amount").value = "25000";
                    document.getElementById("amemplan").value = "0";

                } else if (document.frm_apply.lmemplan.value === "Life Gideon") {
                    document.getElementById("amemplan1").hidden = true;
                    document.getElementById("aname").hidden = true;
                    document.getElementById("gname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("tremarks").hidden = false;
                    document.getElementById("fsubmit").hidden = false;

                    document.getElementById("gideonname").value = "";
                    document.getElementById("auxname").value = "";
                    document.getElementById("mfee").value = "20000";
                    document.getElementById("gfee").value = "20000";
                    document.getElementById("afee").value = "0";
                    document.getElementById("gfeeamount").value = "20000";
                    document.getElementById("afeeamount").value = "0";
                    document.getElementById("amount").value = "20000";
                    document.getElementById("amemplan").value = "0";

                } else if (document.frm_apply.lmemplan.value === "Life Auxiliary") {
                    document.getElementById("amemplan1").hidden = true;
                    document.getElementById("gname").hidden = true;
                    document.getElementById("aname").hidden = false;
                    document.getElementById("tcol").hidden = false;
                    document.getElementById("tremarks").hidden = false;
                    document.getElementById("fsubmit").hidden = false;

                    document.getElementById("gideonname").value = "";
                    document.getElementById("auxname").value = "";
                    document.getElementById("mfee").value = "5000";
                    document.getElementById("gfee").value = "0";
                    document.getElementById("afee").value = "5000";
                    document.getElementById("gfeeamount").value = "0";
                    document.getElementById("afeeamount").value = "5000";
                    document.getElementById("amount").value = "5000";
                    document.getElementById("amemplan").value = "0";

                } else {
                    document.getElementById("amemplan1").hidden = true;
                    document.getElementById("gname").hidden = true;
                    document.getElementById("aname").hidden = true;
                    document.getElementById("tcol").hidden = true;
                    document.getElementById("tremarks").hidden = true;
                    document.getElementById("fsubmit").hidden = true;

                    document.getElementById("gideonname").value = "";
                    document.getElementById("auxname").value = "";
                    document.getElementById("mfee").value = "";
                    document.getElementById("gfee").value = "";
                    document.getElementById("afee").value = "";
                    document.getElementById("gfeeamount").value = "";
                    document.getElementById("afeeamount").value = "";
                    document.getElementById("amount").value = "";
                    document.getElementById("amemplan").value = "0";
                }
            }
        </script>

        <script>
            $("#final-submit").click(function () {
                var camp = $("#camp").val();
                camp = camp.trim();
                var memtype = $("#memtype").val();
                memtype = memtype.trim();

                var mobile = $("#mobile").val();
                mobile = mobile.trim();
                var email = $("#email").val();
                email = email.trim();

                var amemplan = $("#amemplan").val();
                amemplan = amemplan.trim();
                var lmemplan = $("#lmemplan").val();
                lmemplan = lmemplan.trim();

                var gideonname = $("#gideonname").val();
                gideonname = gideonname.trim();
                var auxname = $("#auxname").val();
                auxname = auxname.trim();

                var gfee = $("#gfee").val();
                gfee = gfee.trim();
                var afee = $("#afee").val();
                afee = afee.trim();

                var mfee = $("#mfee").val();
                mfee = mfee.trim();

                var contactperson = $("#contactperson").val();
                contactperson = contactperson.trim();
                var remarks = $("#remarks").val();
                remarks = remarks.trim();

                var v_gfee = isNaN(parseInt(gfee)) ? 0 : parseInt(gfee);
                var v_afee = isNaN(parseInt(afee)) ? 0 : parseInt(afee);
                var v_mfee = isNaN(parseInt(mfee)) ? 0 : parseInt(mfee);

                if (camp === null || camp === "0" || camp === "") {
                    alert("Please select Camp Name");
                    $("#camp").focus();
                    return false;
                }

                if (memtype === null || memtype === "0" || memtype === "") {
                    alert("Please select Membership Type");
                    $("#memtype").focus();
                    return false;
                }

                if (memtype === "Annual") {
                    if (amemplan === null || amemplan === "0" || amemplan === "") {
                        alert("Please select the Plan");
                        $("#amemplan").focus();
                        return false;
                    } else if (amemplan === "Annual Both") {
                        if (gideonname === null || gideonname === "0" || gideonname === "") {
                            alert("Search & select Gideon name.." + gideonname);
                            $("#gideonname").focus();
                            return false;
                        } else if (auxname === null || auxname === "0" || auxname === "") {
                            alert("Search & select Auxiliary name..");
                            $("#auxname").focus();
                            return false;
                        }
                    } else if (amemplan === "Annual Gideon") {
                        if (gideonname === null || gideonname === "0" || gideonname === "") {
                            alert("Search & select Gideon name..");
                            $("#gideonname").focus();
                            return false;
                        }
                    } else if (amemplan === "Annual Auxiliary") {
                        if (auxname === null || auxname === "0" || auxname === "") {
                            alert("Search & select Auxiliary name..");
                            $("#auxname").focus();
                            return false;
                        }
                    }
                }

                if (memtype === "Life Opted") {
                    if (lmemplan === null || lmemplan === "0" || lmemplan === "") {
                        alert("Please select the Plan");
                        $("#lmemplan").focus();
                        return false;
                    } else if (lmemplan === "Life Both") {
                        if (gideonname === null || gideonname === "0" || gideonname === "") {
                            alert("Search & select Gideon name..");
                            $("#gideonname").focus();
                            return false;
                        } else if (auxname === null || auxname === "0" || auxname === "") {
                            alert("Search & select Auxiliary name..");
                            $("#auxname").focus();
                            return false;
                        }
                    } else if (lmemplan === "Life Gideon") {
                        if (gideonname === null || gideonname === "0" || gideonname === "") {
                            alert("Search & select Gideon name..");
                            $("#gideonname").focus();
                            return false;
                        }
                    } else if (lmemplan === "Life Auxiliary") {
                        if (auxname === null || auxname === "0" || auxname === "") {
                            alert("Search & select Auxiliary name..");
                            $("#auxname").focus();
                            return false;
                        }
                    }
                }

                var r = confirm("Are you Sure? Do you want to Submit ?");
                if (r === true) {
                    $(this).hide();
                    //$("#snackbar").html('<p style="width:100%; font-size:14px; font-weight: bold; text-align: center; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                    $("#final-submit").val('<p style="width:100%; font-size:14px; font-weight: bold; text-align: center; background-color: yellow; color: navy;"><i class="fa fa-spinner fa-spin" style="font-size:24px"></i>&nbsp; Please wait a moment..</p>');
                    var xhttp;
                    xhttp = new XMLHttpRequest();
                    xhttp.onreadystatechange = function () {
                        if (this.readyState === 4 && this.status === 200) {
                            var rs = this.responseText;
                            alert(rs);
                            $("#res").html('<p style="width:100%; font-size:14px; font-weight: bold;">' + rs + '</p>');
                            location.reload();
                        }
                    };
                } else {
                    return false;
                }

            });
        </script>
        <script>
            $('#gideonname, #auxname, #camp').select2(
                    {width: '100%'}
            );
        </script>
    </body>
</html>
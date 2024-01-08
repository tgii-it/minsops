<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String designation = "";
    String useraccessname = "";
    String userName = "";
    String useraccessno = "";
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("index.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
        userName = session.getAttribute("useraccessname").toString();
        designation = session.getAttribute("designation").toString();
        useraccessno = session.getAttribute("useraccessno").toString();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | Membership Renewals MIS</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap.min.css" rel="stylesheet">
        <link href="https://editor.datatables.net/extensions/Editor/css/editor.bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link type="text/css" href="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
        <script type="text/javascript" src="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
        <script src="https://code.jquery.com/jquery-1.10.2.js"></script>  
        <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script> 
        <style>
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
        </style>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="js/camps.js"></script>
        <script src="js/contactperson.js"></script>
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

                .Banner .Wrapper {/* https://css-tricks.com/centering-in-the-unknown/ */
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

            .btn-cust {
                position: relative;
                float: right;
                background-color: transparent;
                background-image: none;
                border: 1px solid #333;
                border-radius: 4px;
                color: #ffe114;
                margin-bottom: 8px;
                margin-right: 15px;
                margin-top: 8px;
                padding: 9px 10px;
            }

            .btn-cust:hover {
                color:white;
                background-color: #01354a;
            }
        </style>

        <script>
            function show_confirm()
            {
                var r = confirm("Are you sure 'Do you want to process the selected record(s)' ?");
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
                var payStatus = $("#payStatus").val();
                payStatus = payStatus.trim();
                var paymentdate = $("#paymentdate").val();
                paymentdate = paymentdate.trim();
                var paytype = $("#paytype").val();
                paytype = paytype.trim();
                var paymode = $("#paymode").val();
                paymode = paymode.trim();
                var remarks = $("#remarks").val();
                remarks = remarks.trim();

                var checked = false, e, i = 0;
                while (e = f.elements[i++]) {
                    if (e.type === 'checkbox' && e.checked)
                        checked = true;
                }

                if (!checked) {
                    $("#snackbar").hide();
                    $("#final-submit").show();
                    alert("Please Select a Record To Process!");
                } else if (payStatus === '0') {
                    alert("Select Payment Status ");
                    $("#payStatus").focus();
                    return false;
                } else if (paymentdate === '') {
                    alert("Select Payment Date ");
                    $("#paymentdate").focus();
                    return false;
                } else if (paytype === '0') {
                    alert("Select Payment Type ");
                    $("#paytype").focus();
                    return false;
                } else if (paymode === '0') {
                    alert("Select Pay Mode ");
                    $("#paymode").focus();
                    return false;
                } else if (remarks === '' || remarks === null) {
                    alert("Enter Remarks ");
                    $("#remarks").focus();
                    return false;
                } else {
                    checked = show_confirm();
                }
                return checked;

            }

            function selectToggle(toggle, form) {
                var myForm = document.forms[form];
                for (var i = 0; i < myForm.length; i++) {
                    if (toggle) {
                        myForm.elements[i].checked = "checked";
                    } else {
                        myForm.elements[i].checked = "";
                    }
                }
            }
            function genPDF() {
                document.frm1.btnSubmit.disabled = 'false';
            }
        </script>
    </head>
    <body style="background-color: #fff; width: 100%;">
        <%@ include file="menu.jsp" %>
        <section id="main" style="padding: 60px 0px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <form name="frm_apply" method="post" action="https://mis.gideons.org.in/ProcessDispatchRequest" onsubmit="return validateCheckbox(this)">
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; P E N D I N G 

                                        <a type='button' class="pull-right" href="renewalRequestList_processed.jsp" title='Show Pending Records'><i class='fa fa-comments-o' aria-hidden='true'>&nbsp; <b>Show Processed</b></i></a>
                                    </h3>
                                </div>

                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <table id="gideon" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <th style="text-align: center;"></th>
                                                <th style="text-align: center;"><a href="javascript:selectToggle(true, 'frm_apply');" style="color: #fff;"><b>All</b></a> | <a href="javascript:selectToggle(false, 'frm_apply');" style="color: #fff;"><b>None</b></a></th>
                                                <th style="text-align: left;" nowrap>Member Name</th>
                                                <th style="text-align: left;" nowrap>Camp</th>
                                                <th style="text-align: center;" nowrap>Phone</th>
                                                <th style="text-align: left;" nowrap>Mem Type</th>
                                                <th style="text-align: left;" nowrap>Mem Status</th>
                                                <th style="text-align: center;" nowrap>Tr Status</th>
                                                <th style="text-align: left;" nowrap>Pay Mode</th>
                                                <th style="text-align: right;" nowrap>INR</th>
                                                <th style="text-align: left;" nowrap>DD/Ch/Tr No</th>
                                                <th style="text-align: center;" nowrap>Paid on</th>
                                                <th style="text-align: center;" nowrap>Bank Name</th>
                                                <th style="text-align: center;" nowrap>Contact Person</th>
                                                <th style="text-align: center;" nowrap>Record Status</th>
                                                <th style="text-align: center;" nowrap>Tally Receipt No</th>
                                                <th style="text-align: left;" nowrap>Member Remarks</th>
                                                <th style="text-align: left;" nowrap>Finance Remarks</th>
                                                <th style="text-align: left;" nowrap>Finance Processed by</th>
                                                <th style="text-align: left;" nowrap>Finance Processed on</th>
                                                <th style="text-align: left;" nowrap>Renewal Remarks</th>
                                                <th style="text-align: left;" nowrap>Renewal Processed by</th>
                                                <th style="text-align: left;" nowrap>Renewal Processed on</th>
                                                <th style="text-align: left;" nowrap>Card Printing Remarks</th>
                                                <th style="text-align: left;" nowrap>Card Printing Processed by</th>
                                                <th style="text-align: left;" nowrap>Card Printing Processed on</th>
                                                <th style="text-align: left;" nowrap>Courier / Post</th>
                                                <th style="text-align: left;" nowrap>Docket No</th>
                                                <th style="text-align: left;" nowrap>Dispatch Date</th>
                                                <th style="text-align: left;" nowrap>Dispatch Processed by</th>
                                                <th style="text-align: left;" nowrap>Dispatch Remarks</th>
                                            </tr>
                                        </thead>

                                        <tbody id='mytab' class="table-search"> 
                                            <%                                                String camp = "";
                                                String mid = "";
                                                String name = "";
                                                String mtype = "";
                                                String mplan = "";
                                                String status = "";
                                                String phone = "";
                                                String remarks = "";
                                                String paytype = "";
                                                String paymode = "";
                                                int amount = 0;
                                                int v_amount = 0;
                                                String trno = "";
                                                String paydate = "";
                                                String bank = "";
                                                String contactPerson = "";
                                                String record_status = "";
                                                String payment_updated_by = "";
                                                String tally_receipt_no = "";
                                                String submitted_on = "";
                                                String courier = "";
                                                String dispatch_date = "";
                                                String dispatch_updated_by = "";
                                                String docketno = "";
                                                String fin_remarks = "";
                                                String re_remarks = "";
                                                String cp_remarks = "";
                                                String dispatch_remarks = "";
                                                String fin_updated_by = "";
                                                String re_updated_by = "";
                                                String cp_updated_by = "";
                                                String fin_updated_on = "";
                                                String re_updated_on = "";
                                                String cp_updated_on = "";
                                                String dispatch_updated_on = "";
                                                String orbitid = "";

                                                DataSource ds = null;
                                                Connection con = null;
                                                Context context = new InitialContext();
                                                Context envCtx = (Context) context.lookup("java:comp/env");
                                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                try {
                                                    con = ds.getConnection();
                                                    String query1 = "Select * from san_process1 where record_status is not null and tally_receipt_no='-' order by camp,mid";

                                                    Statement st1 = con.createStatement();
                                                    ResultSet rs1 = st1.executeQuery(query1);
                                                    while (rs1.next()) {
                                                        camp = rs1.getString("camp");
                                                        name = rs1.getString("name");
                                                        mid = rs1.getString("mid");
                                                        mtype = rs1.getString("mtype");
                                                        mplan = rs1.getString("memplan");
                                                        status = rs1.getString("memstatus");
                                                        phone = rs1.getString("phone");
                                                        paytype = rs1.getString("trstatus");
                                                        paymode = rs1.getString("trpaymode");
                                                        amount = rs1.getInt("tramount");
                                                        trno = rs1.getString("trno");
                                                        paydate = rs1.getString("trpaydate");
                                                        record_status = rs1.getString("record_status");
                                                        submitted_on = rs1.getString("submitted_on");
                                                        tally_receipt_no = rs1.getString("tally_receipt_no");

                                                        if (mtype.equalsIgnoreCase("Auxiliary(TGII) Annual Member")) {
                                                            mtype = "Aux Annual";
                                                        }

                                                        if (mtype.equalsIgnoreCase("Gideon(TGII) Annual Member")) {
                                                            mtype = "Gid Annual";
                                                        }

                                                        if (payment_updated_by == null) {
                                                            payment_updated_by = "";
                                                        }
                                                        if (record_status == null) {
                                                            record_status = "";
                                                        }
                                                        if (paydate == null) {
                                                            paydate = "";
                                                        }
                                                        if (paytype == null) {
                                                            paytype = "";
                                                        }
                                                        if (paymode == null) {
                                                            paymode = "";
                                                        }
                                                        if (trno == null) {
                                                            trno = "";
                                                        }
                                                        if (bank == null || bank.equalsIgnoreCase("0")) {
                                                            bank = "";
                                                        }
                                                        if (phone == null) {
                                                            phone = "";
                                                        }

                                                        if (tally_receipt_no == null) {
                                                            tally_receipt_no = "";
                                                        }

                                                        if (contactPerson == null) {
                                                            contactPerson = "";
                                                        }

                                                        if (record_status.equalsIgnoreCase("Grace")) {
                                                            record_status = "";
                                                        }

                                                        if (remarks == null || remarks == "" || remarks.isEmpty()) {
                                                            remarks = "";
                                                        }

                                            %> 
                                            <tr>
                                                <td style="text-align: center;"></td>  
                                                <%                                                    if (record_status == null || record_status == "" || record_status.isEmpty()) {
                                                %>
                                                <td style="text-align: left;" nowrap><input type="checkbox" name="chkApprove" id="chkApprove" value="<%= orbitid%>" />&nbsp;&nbsp;&nbsp;<%= mid%></td>
                                                    <%
                                                    } else if (record_status.equalsIgnoreCase("Pending")) {
                                                    %>
                                                <td style="text-align: left;" nowrap>&nbsp;<%= mid%></td>                                           
                                                <%
                                                    }
                                                %>
                                                <td nowrap><%= name%></td>
                                                <td nowrap><%= camp%></td>
                                                <td><%= phone%></td>
                                                <td nowrap><%= mtype%><br>Retd : <%=mplan%></td>
                                                <td><%= status%></td>
                                                <td><%= paytype%></td>
                                                <td><%= paymode%></td>
                                                <%
                                                    if (mid.contains("A")) {
                                                        if (amount < 1000) {
                                                            v_amount = 500;
                                                        } else {
                                                            v_amount = amount;
                                                        }
                                                %>
                                                <td style="text-align: right;"><%= v_amount%></td>                                                        
                                                <%
                                                } else {
                                                    if (amount < 2000) {
                                                        v_amount = 1300;
                                                    } else {
                                                        v_amount = amount;
                                                    }
                                                %>
                                                <td  style = "text-align: right;" > <%= v_amount%></td>
                                                <%
                                                    }
                                                %>
                                                <td><%= trno%></td>
                                                <td nowrap><%= paydate%></td>
                                                <td><%= bank%></td>
                                                <td><%= contactPerson%></td>
                                                <%
                                                    if (record_status.equalsIgnoreCase("Pending")) {
                                                %>
                                                <td><span class="label label-warning" style="font-size: 11px;"><%= record_status%></span></td> 
                                                    <%
                                                    } else if (record_status.equalsIgnoreCase("Payment-Received")) {
                                                    %> 
                                                <td><span class="label label-success" style="font-size: 11px;"><%= record_status%></span></td>  
                                                    <%
                                                    } else {
                                                    %> 
                                                <td><%= record_status%></td> 
                                                <%
                                                    }
                                                %>
                                                <td><%= tally_receipt_no%></td>
                                                <td><%= remarks%></td>                                           
                                                <td><%= fin_remarks%></td> 
                                                <td><%= fin_updated_by%></td>
                                                <td><%= fin_updated_on%></td>  
                                                <td><%= re_remarks%></td> 
                                                <td><%= re_updated_by%></td> 
                                                <td><%= re_updated_on%></td> 
                                                <td><%= cp_remarks%></td>   
                                                <td><%= cp_updated_by%></td> 
                                                <td><%= cp_updated_on%></td> 
                                                <td><%= courier%></td>
                                                <td><%= docketno%></td>
                                                <td><%= dispatch_date%></td>
                                                <td><%= dispatch_updated_by%></td>
                                                <td><%= dispatch_remarks%></td>  
                                                <%
                                                        }

                                                        rs1.close();
                                                        st1.close();
                                                        con.close();

                                                    } catch (Exception e1) {
                                                    }
                                                %>                                                  
                                            </tr>
                                        </tbody>
                                        <tfoot style="background-color: yellow; color: navy;">
                                            <tr>
                                                <th colspan="9" style="text-align: right;">Page Total<br>(Overall Total)</th>
                                                <th style="text-align: right;"></th>
                                                <th colspan="21"></th> 
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; S T E P &nbsp;2&nbsp;:&nbsp;&nbsp; O T H E R &nbsp; D E T A I L S 
                                    </h3>
                                </div>

                                <div class="panel-body" style="padding-top: 20px; width: 100%"> 
                                    <div class="form-group col-lg-12">                   
                                        <div class="form-group col-lg-4" hidden>
                                            <label for="payStatus">Record Status</label>
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-filter"></span>
                                                </span> 
                                                <select name="payStatus" id="payStatus" class="form-control" required>
                                                    <option value="0">- Select -</option>
                                                    <option value="Pending" selected>- Pending -</option>
                                                </select>
                                            </div>
                                        </div>  
                                        <div class="form-group col-lg-3">
                                            <label for="paymentdate">Request Process Date</label>
                                            <div class='input-group date' id='dispatch_date'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type='text' class="form-control" name="paymentdate" id="paymentdate" required/>
                                            </div>
                                        </div>
                                        <div class="form-group col-lg-4" hidden>
                                            <label for="paytype">Payment Type</label>
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-shopping-cart"></span>
                                                </span> 
                                                <select name="paytype" id="paytype" class="form-control" required>
                                                    <option value="0">- Select -</option>
                                                    <option value="Full Amount" selected>- Full Amount -</option>
                                                    <option value="Instalment">- Instalment -</option>
                                                </select> 
                                                <input type="hidden" class="form-control" name="requestType" id="requestType" value="AccountsSan">  
                                            </div>
                                        </div>      
                                        <div class="form-group col-lg-3" hidden>
                                            <label for="paymode">Payment Mode</label>
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-credit-card"></span>
                                                </span> 
                                                <select name="paymode" id="paymode" class="form-control" required>
                                                    <option value="0">- Select -</option>
                                                    <option value="Cash">- Cash -</option>
                                                    <option value="Cheque">- Cheque -</option>
                                                    <option value="Easy Pay Portal">- Easy Pay Portal -</option>
                                                    <option value="Payment Gateway" selected>- Payment Gateway -</option>
                                                    <option value="Direct Deposit">- Direct Deposit -</option>
                                                    <option value="NEFT">- NEFT -</option>
                                                    <option value="RTGS">- RTGS -</option>
                                                    <option value="UPI">- UPI -</option>
                                                    <option value="NACH">- NACH -</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label for="trno">Tally Receipt No</label>
                                            <input type='text' class="form-control" name="tallyno" id="tallyno"/>
                                        </div> 
                                        <div class="form-group col-md-6">
                                            <label for="trno">Remarks</label>
                                            <input type='text' class="form-control" name="remarks" id="remarks"/>
                                        </div>                                    
                                    </div>
                                    <div class="form-group col-md-12">
                                        <div class='input-group pull-right'>
                                            <input type="submit" class="btn btn-primary" id="final-submit" value="Submit Form">
                                        </div>                                            
                                    </div>

                                </div>
                                <div id="snackbar"></div>
                            </div>
                        </form>
                    </div> 
                </div>
            </div>
        </section>
        <br><br>
        <footer class="footer">
            <span class="text-muted">&nbsp;</span>
        </footer>
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
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="js/jquery.progressTimer.js" type="text/javascript"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script >
                            $(function () {
                                $('#dispatch_date').datepicker({
                                    format: "dd/mm/yyyy",
                                    language: "es",
                                    autoclose: true,
                                    todayHighlight: true
                                });
                            });

                            $('#paymentdate').datepicker({
                                format: "dd/mm/yyyy",
                                language: "es",
                                autoclose: true,
                                todayHighlight: true
                            });
                            $("#paymentdate").datepicker().datepicker("setDate", new Date());
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
                        total9 = api
                                .column(9)
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        // Total over this page
                        pageTotal9 = api
                                .column(9, {page: 'current'})
                                .data()
                                .reduce(function (a, b) {
                                    return intVal(a) + intVal(b);
                                }, 0);
                        // Update footer
                        $(api.column(9).footer()).html(
                                '' + pageTotal9 + '<br>(' + total9 + ')'
                                );
                    }
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



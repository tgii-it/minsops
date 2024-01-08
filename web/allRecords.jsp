<%@page import="java.util.Date"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%  String sa_no = request.getParameter("sa_no");
    String useraccessname = "";
    String camp = "";
    if (sa_no == null) {
        sa_no = "";
    }
    Object OBJ = session.getAttribute("useraccessname");
    if (OBJ == null) {
        request.getSession(true).invalidate();
        response.sendRedirect("/login.html");
    } else {
        useraccessname = session.getAttribute("useraccessname").toString();
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>NC 2021 | All Records</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap.min.css" rel="stylesheet">
        <link href="https://editor.datatables.net/extensions/Editor/css/editor.bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link type="text/css" href="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
        <script type="text/javascript" src="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 

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
                background: #fdfdfd;
                line-height: 25px;
                border: 1px solid #ddd;
                border-top:4px solid #ffe114;
                border-bottom:4px solid #ffe114;
                padding: 3px;
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
            @media screen and (max-width: 768px) {
                .center-block {
                    margin: auto;
                    display: block;               
                    margin-left: 10px;
                }

                .col-sm-4 {
                    text-align: center;
                    margin: 25px 0;
                }
                .col-md-4 {
                    text-align: center;
                    margin: 25px 0;
                }
                .btn-lg {
                    width: 100%;
                    margin-bottom: 35px;
                }
                .btn-success{
                    margin-left: 30px;                   
                    border: #01354a;
                    text-align: center;
                    font-family: 'Roboto', sans-serif;
                }
                .responsive{
                    padding-top: 3px;
                    top:3px;
                }
            }
            @media screen and (max-width: 480px) {
                .center-block {
                    margin: auto;
                    display: block;               
                    margin-left: 15px;
                }

                .logo {
                    font-size: 150px;
                }
                .col-md-4 {
                    text-align: center;
                    margin: 25px 0;
                }
                .btn-success{
                    margin-left: 30px;                   
                    border: #01354a;
                    text-align: center;
                    font-family: 'Roboto', sans-serif;
                }
                .responsive{
                    padding-top: 3px;
                    top:3px;
                }
            }
            /* ------------------------------------------------------------------------ Banners */	
            .responsive{
                padding-top: -5px;
                top:-5px;
                margin-top: -5px;
            }
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
                .center-block {
                    margin: auto;
                    display: block;               
                    margin-left: 50px;
                }

                .Banner .Button { 
                    margin: 0.25em auto 1em auto;
                    background: #d2ab67;
                    color: #193f66;
                }
                .Banner .Button:hover, .Banner .Button:focus  { background: #ffe114; outline: none; }	
                .responsive{
                    padding-top: 3px;
                    top:3px;
                }
            }	

            @media only screen and (min-width: 40em) {	
                .center-block {
                    margin: auto;
                    display: block;               
                    margin-left: 200px;
                }
                .btn-success{
                    margin-left: 45px;                  
                    border: #01354a;
                    text-align: center;
                    font-family: 'Roboto', sans-serif;
                }
                .Banner  {	
                    height: 25em;
                    padding-bottom: 0;
                }
                .responsive{
                    padding-top: 3px;
                    top:3px;
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
                .center-block {
                    margin: auto;
                    display: block;               
                    margin-left: 100px;
                }
                .btn-success{
                    margin-left: 45px;

                    border: #01354a;
                    text-align: center;
                    font-family: 'Roboto', sans-serif;
                }
                .responsive{
                    padding-top: 3px;
                    top:3px;
                }
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

            .btn-primary{
                border: #01354a;
                background-color: #01354a;
                font-family: 'Roboto', sans-serif;
                text-align: center;
            }
            .btn-primary :hover {
                background-color: white;
                font-family: 'Roboto', sans-serif;
            }

            #h6{
                background-color: #01354a;
                color:white;
            }
            #h61{
                background-color: #01354a;
                color:white;
            }
            [type="checkbox"]
            {
                vertical-align:middle;
            }
            .rem{
                margin-left: 35px;
                margin-top: -20px;
            }
            #checkid{
                margin-left:10px;
            }
            .modal{
                margin-top: 0px;
                padding-top: 0px;
                top:0px;
            }
            .modal-dialog{
                margin-top: 0px;
                padding-top: 0px;
                top:0px;
                width:96%;
            }
            .btn1 {
                background-color: #ffe114;
                border: none;
                border-radius: 4px;
                color: white;
                width:180px;                
                font-size: 16px;
                cursor: pointer;
                height: 27px;
            }
            .center-block {
                margin: auto;
                display: block;               
                margin-left: 520px;
            }

        </style>
        <style>
            .form-group input[type="checkbox"] {
                display: none;
            }

            .form-group input[type="checkbox"] + .btn-group > label span {
                width: 20px;
            }

            .form-group input[type="checkbox"] + .btn-group > label span:first-child {
                display: none;
            }
            .form-group input[type="checkbox"] + .btn-group > label span:last-child {
                display: inline-block;   
            }

            .form-group input[type="checkbox"]:checked + .btn-group > label span:first-child {
                display: inline-block;
            }
            .form-group input[type="checkbox"]:checked + .btn-group > label span:last-child {
                display: none;   
            }


        </style>
        <style>
            @media only screen and (min-width: 400px) {
                .frm1{
                    width: 50%;

                }
                .cont{
                    margin-left:-1px;

                }
            }
            /* Medium devices (landscape tablets, 768px and up) */
            @media only screen and (min-width: 768px) {
                .frm1{
                    width: 25%;
                }
                .cont{
                    margin-left: -35px;      
                }
            }
            /* Large devices (laptops/desktops, 992px and up) */
            @media only screen and (min-width: 1024px) {
                .frm1{
                    width: 20%;
                }
                .cont{
                    margin-left: -28px;      
                }
            }
            @media only screen and (min-width: 1200px) {
                .frm1{
                    width: 20%;
                    margin-left:70px;
                }
                .cont{
                    margin-left: 126px;      
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
        </style>
        <style>
            .navbar{
                top:0;
                width:100%; 
                z-index: 9999;
                position: fixed;
                background-color: #01354a;
            }

        </style>
        <style>
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
                var renewalStatus = $("#renewalStatus").val();
                renewalStatus = renewalStatus.trim();
                var memtype = $("#memtype").val();
                memtype = memtype.trim();
                var startdate = $("#startdate").val();
                startdate = startdate.trim();
                var enddate = $("#enddate").val();
                enddate = enddate.trim();
                var contactperson = $("#contactperson").val();
                contactperson = contactperson.trim();
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
                } else if (renewalStatus === '0') {
                    alert("Select Renewal Status ");
                    $("#renewalStatus").focus();
                    return false;
                } else if (contactperson === '' || contactperson === null) {
                    alert("Enter contactperson details ");
                    $("#contactperson").focus();
                    return false;
                } else if (enddate === '' || enddate === null) {
                    alert("Select End Date ");
                    $("#enddate").focus();
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
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class='panel panel-default panel-accent-gold'>
                            <div class="panel-heading" style="background-color: #fff;">
                                <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                    <i class="fa fa-fw fa-share"></i>&nbsp; NC 2021 : All Records
                                </h3>
                            </div>
                            <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; color: black; height: auto;">
                                <table id="gideon" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                    <thead style="background-color: #01354a; color: #ffe114;">
                                        <tr>
                                            <th nowrap>Record_ID</th>
                                            <th nowrap>Camp</th>
                                            <th nowrap>Status</th>
                                            <th nowrap>Attending_People</th>
                                            <th style="text-align: center;" nowrap>Total_count</th>
                                            <th style="text-align: right;" nowrap>Total_Amount</th>
                                            <th style="text-align: center;" nowrap>Gid_MID</th>
                                            <th nowrap>Gid_Name</th>
                                            <th style="text-align: center;" nowrap>Aux_MID</th>   
                                            <th nowrap>Aux_Name</th>    
                                            <th style="text-align: right;" nowrap>Gid_Amount</th>   
                                            <th style="text-align: right;" nowrap>Aux_Amount</th>
                                            <th nowrap>Payment Method</th>
                                            <th nowrap>Tr_Refno</th>
                                            <th nowrap>Tr_Status</th>
                                            <th nowrap>Tr_Date_time</th>
                                            <th nowrap>Tr_Paymode</th>
                                            <th style="text-align: right;" nowrap>Tr_Amount</th>
                                            <th nowrap>Gid_Mobile</th>
                                            <th nowrap>Aux_Mobile</th>
                                            <th nowrap>Submitted_on</th>
                                            <th nowrap>State Association</th>
                                            <th style="text-align: center;" nowrap>Region</th>
                                            <th style="text-align: center;" nowrap>Area</th>
                                            <th nowrap>Remarks</th>
                                        </tr>
                                    </thead>
                                    <tbody id='mytab' class="table-search"> 
                                        <%  String gid = "";
                                            String aid = "";
                                            String rid = "";
                                            String gname = "";
                                            String wname = "";
                                            String phone = "";
                                            String state_association = "";
                                            String region = "";
                                            String area = "";
                                            String gamount = "";
                                            String wamount = "";
                                            String total_count = "";
                                            String total_amount = "";
                                            String gmobile = "";
                                            String amobile = "";
                                            String gemail = "";
                                            String aemail = "";
                                            String food = "";
                                            String submitted_on = "";
                                            String g_a_b = "";
                                            String tr_amount = "";
                                            String tr_refno = "";
                                            String tr_paymode = "";
                                            String tr_date_time = "";
                                            String tr_status = "";
                                            String remarks = "";
                                            String paymethod = "";
                                            String status = "";

                                            DataSource ds = null;
                                            Connection con = null;
                                            Context context = new InitialContext();
                                            Context envCtx = (Context) context.lookup("java:comp/env");
                                            ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                            try {
                                                con = ds.getConnection();
                                                Statement statement = con.createStatement();
                                                String sql = "select (decode(g_a_b,'Yes','Both Gideon '||chr(38)||' Auxiliary','No','Gideon Alone','AAA','Auxiliary Alone',g_a_b)) g_a_b,"
                                                        + "(select state_asso from camps_master where camp = a.camp) state_association,"
                                                        + "(select region from camps_master where camp = a.camp) region,"
                                                        + "(select area from camps_master where camp = a.camp) area,"
                                                        + "a.camp,a.status,rid,gid,aid,wname,nvl(gmobile,'NA') gmobile,nvl(amobile,'NA') amobile,nvl(gemail,'NA') gemail,nvl(aemail,'NA') aemail,to_char(submitted_on,'dd-mm-yyyy') submitted_date,"
                                                        + "total_count,total_amount,food,wamount,cp,church_aff,arrival,paymethod,case when paymethod='PG' then (select to_char(urefno) from pg_response where substr(refno,6,20)=a.rid and status='Success') else trno end tr_refno,"
                                                        + "case when paymethod='PG' then (select status from pg_response where substr(refno,6,20)=a.rid and status='Success') else '-' end tr_status,case when paymethod='PG' then (select tr_date_time from pg_response where substr(refno,6,20)=a.rid and status='Success') else trdate end tr_date_time,case when paymethod='PG' then (select paymode from pg_response where substr(refno,6,20)=a.rid and status='Success') else 'Offline' end tr_paymode,case when paymethod='PG' then (select to_char(tr_amount) from pg_response where substr(refno,6,20)=a.rid and status='Success') else total_amount end tr_amount,"
                                                        + "a.* from NC2021 a order by a.rid";
                                                System.out.println("SQL " + sql);
                                                ResultSet resultSet = statement.executeQuery(sql);
                                                while (resultSet.next()) {
                                                    g_a_b = resultSet.getString("g_a_b");
                                                    rid = resultSet.getString("rid");
                                                    gid = resultSet.getString("gid");
                                                    aid = resultSet.getString("aid");
                                                    camp = resultSet.getString("camp");
                                                    gname = resultSet.getString("gname");
                                                    wname = resultSet.getString("wname");
                                                    gmobile = resultSet.getString("gmobile");
                                                    amobile = resultSet.getString("amobile");
                                                    gemail = resultSet.getString("gemail");
                                                    aemail = resultSet.getString("aemail");
                                                    gamount = resultSet.getString("gamount");
                                                    wamount = resultSet.getString("wamount");
                                                    total_count = resultSet.getString("total_count");
                                                    total_amount = resultSet.getString("total_amount");
                                                    food = resultSet.getString("food");
                                                    submitted_on = resultSet.getString("submitted_date");
                                                    state_association = resultSet.getString("state_association");
                                                    region = resultSet.getString("region");
                                                    area = resultSet.getString("area");
                                                    status = resultSet.getString("status");
                                                    tr_refno = resultSet.getString("tr_refno");
                                                    tr_status = resultSet.getString("tr_status");
                                                    tr_date_time = resultSet.getString("tr_date_time");
                                                    tr_paymode = resultSet.getString("tr_paymode");
                                                    tr_amount = resultSet.getString("tr_amount");
                                                    remarks = resultSet.getString("remarks");
                                                    paymethod = resultSet.getString("paymethod");
                                                    if (gname == null) {
                                                        gname = "";
                                                    }
                                                    if (wname == null) {
                                                        wname = "";
                                                    }
                                                    if (aid == null) {
                                                        aid = "";
                                                    } else if (aid == "0" || aid.equalsIgnoreCase("0")) {
                                                        aid = "";
                                                    }
                                                    if (wamount == null) {
                                                        wamount = "";
                                                    } else if (wamount == "0" || wamount.equalsIgnoreCase("0")) {
                                                        wamount = "";
                                                    }
                                                    if (gamount == null) {
                                                        gamount = "";
                                                    } else if (gamount == "0" || gamount.equalsIgnoreCase("0")) {
                                                        gamount = "";
                                                    }
                                                    if (gmobile == "0" || gmobile.equalsIgnoreCase("0")) {
                                                        gmobile = "";
                                                    }
                                                    if (amobile == "0" || amobile.equalsIgnoreCase("0") || amobile == null || amobile == "null") {
                                                        amobile = "";
                                                    }
                                                    if (state_association == null) {
                                                        state_association = "";
                                                    }
                                                    if (tr_amount == null) {
                                                        tr_amount = "NA";
                                                    }
                                                    if (tr_status == null) {
                                                        tr_status = "NA";
                                                    }
                                                    if (tr_date_time == null) {
                                                        tr_date_time = "NA";
                                                    }
                                                    if (tr_paymode == null) {
                                                        tr_paymode = "NA";
                                                    }
                                                    if (tr_refno == null) {
                                                        tr_refno = "NA";
                                                    }
                                                    if (remarks == null) {
                                                        remarks = "--";
                                                    }
                                                    if (paymethod == null) {
                                                        paymethod = "--";
                                                    } else if (paymethod.equalsIgnoreCase("PG")) {
                                                        paymethod = "ICICI Payment Gateway";
                                                    } else if (paymethod.equalsIgnoreCase("AP")) {
                                                        paymethod = "Already Paid with other modes";
                                                    } else {
                                                        paymethod = "--";
                                                    }
                                                    if (status.equalsIgnoreCase("Reconciled")) {
                                        %>
                                        <tr style="background-color: greenyellow;">                                                        
                                            <%
                                            } else if (status.equalsIgnoreCase("Processed")) {
                                            %>
                                        <tr style="background-color: #FED86D;">                                                        
                                            <%
                                            } else {
                                            %>
                                        <tr>
                                            <%
                                                }
                                            %>
                                            <td nowrap><%=rid%></td>
                                            <td nowrap><%=resultSet.getString("camp")%></td>
                                            <td nowrap><%=resultSet.getString("status")%></td>
                                            <td nowrap><%=g_a_b%></td>
                                            <td style="text-align: center;" nowrap><%=total_count%></td>
                                            <td style="text-align: right; padding-right: 15px;" nowrap><%=total_amount%></td>
                                            <td style="text-align: center;" nowrap><%=gid%></td>
                                            <td nowrap><%=gname%></td>
                                            <td style="text-align: center;" nowrap><%=aid%></td>
                                            <td nowrap><%=wname%></td>
                                            <td style="text-align: right; padding-right: 15px;" nowrap><%=gamount%></td>
                                            <td style="text-align: right; padding-right: 15px;" nowrap><%=wamount%></td>
                                            <td nowrap><%=paymethod%></td>
                                            <td nowrap><%=tr_refno%></td>
                                            <td nowrap><%=tr_status%></td>
                                            <td nowrap><%=tr_date_time%></td>
                                            <td nowrap><%=tr_paymode%></td>
                                            <td style="text-align: right; padding-right: 15px;" nowrap><%=tr_amount%></td>
                                            <td nowrap><%=gmobile%></td> 
                                            <td nowrap><%=amobile%></td>  
                                            <td nowrap><%=submitted_on%></td>
                                            <td nowrap><%=state_association%></td>
                                            <td style="text-align: center;" nowrap><%=region%></td>
                                            <td style="text-align: center;" nowrap><%=area%></td>
                                            <td nowrap><%=remarks%></td>
                                        </tr>
                                        <%
                                                }
                                                con.close();
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div> 
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
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>        
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
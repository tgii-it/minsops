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

    String v_sa = request.getParameter("stateasso");
    String v_area_region = request.getParameter("region");

    if (v_sa == null || v_sa.isEmpty()) {
        v_sa = "";
    }

    if (v_area_region == null || v_area_region.isEmpty()) {
        v_area_region = "";
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title><%=v_sa%> &nbsp; Region <%=v_area_region%> Performance</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/buttons/1.5.4/css/buttons.bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.datatables.net/select/1.2.7/css/select.bootstrap.min.css" rel="stylesheet">
        <link href="https://editor.datatables.net/extensions/Editor/css/editor.bootstrap.min.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.3/css/responsive.bootstrap.min.css">
        <link type="text/css" href="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/css/dataTables.checkboxes.css" rel="stylesheet" />
        <script type="text/javascript" src="https://gyrocode.github.io/jquery-datatables-checkboxes/1.2.11/js/dataTables.checkboxes.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

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
                border-top:5px solid #ffe114;
                border-bottom:5px solid #ffe114;
                padding:30px 25px;
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
        <script type="text/javascript">
            function getXMLHttpRequest() {
                var xmlHttpReq;
                if (window.XMLHttpRequest) {
                    xmlHttpReq = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    try {
                        xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (exp1) {
                        try {
                            xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (exp2) {
                            alert("Exception in getXMLHttpRequest()!");
                        }
                    }
                }
                return xmlHttpReq;
            }

            // function loadStateAsso() {
            //     var xmlHttpRequest = getXMLHttpRequest();
            //     xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
            //    xmlHttpRequest.open("POST", "LoadStateAssociationRegion", true);
            //     xmlHttpRequest.send();
            // }
            function getRegions(src) {
                var sele = document.getElementById("region");
                var item = src.options[src.selectedIndex];

                if (item.value !== "-State Association-")
                {
                    var xmlHttpRequest = getXMLHttpRequest();
                    xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);
                    xmlHttpRequest.open("POST", "LoadStateAssociationRegion?type=region&data=" + item.value, true);
                    xmlHttpRequest.send();
                    sele.options.length = 1;

                } else if (item.value === "-State Association-")
                {
                    sele.options.length = 1;
                }
            }
            function getReadyStateHandler(xmlHttpRequest) {
                return function () {
                    if (xmlHttpRequest.readyState === 4) {
                        if (xmlHttpRequest.status === 200) {
                            var a = xmlHttpRequest.responseText.split(",");

                            if (a[0] === "1") {

                                for (i = 1; i < a.length; i++) {
                                    var select = document.getElementById("stateasso");
                                    select.options[select.options.length] = new Option(a[i]);
                                }
                            }

                            if (a[0] === "2") {

                                for (i = 1; i < a.length; i++) {

                                    var select = document.getElementById("region");
                                    select.options[select.options.length] = new Option(a[i]);
                                }
                            }

                        }
                        // else {
                        //     alert("Http error " + xmlHttpRequest.status + ":" + xmlHttpRequest.statusText);
                        //  }
                    }
                };
            }
        </script>
        <script>
            function FrontPage_Form1_Validator(theForm)
            {
                if (theForm.stateasso.value === "0")
                {
                    alert("Please select State Association");
                    theForm.stateasso.focus();
                    return (false);
                }
                if (theForm.region.value === "0")
                {
                    alert("Please select Region");
                    theForm.region.focus();
                    return (false);
                }
                return (true);
            }
        </script>
    </head>
    <body style="background-color: #fff;">
        <%
            String sessionid = session.getId();
        %>
        <nav class="navbar navbar-default navbar-fixed-top">
            <div>   
                <span class="navbar-brand pull-left" onclick="openNav()">&#9776;</span>                
                <a href="#"><img alt="The Gideons International" src="./images/GideonsLogo2.png" align="left"  height="50" width="170"  style="padding: 5px;"/></a>
            </div>
            <div class="container-fluid">
                <div class="collapse navbar-collapse" id="myNavbar" style="background-color: #01354a;">
                    <ul class="nav navbar-nav navbar-left">
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Department Reports &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu" style="padding-right:8px;">
                                <li class="dropdown-submenu">
                                    <a href="#">
                                        Membership Dept
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="https://mis.gideons.org.in/membership_reports.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>" target="_blank"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Reports</a></li>
                                        <!--<li><a href="https://mis.gideons.org.in/campOfficersList.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>" target="_blank"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Camp Cabinet List</a></li>
                                        <li><a href="https://mis.gideons.org.in/StateWiseReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>" target="_blank"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; State wise Members List</a></li>-->                                        
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#">
                                        Scripture Dept
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Report 1</a></li>
                                        <li><a href="#"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Report 2</a></li>
                                        <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Report 3</a></li>
                                        <li><a href="#"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Report 4</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; Report 5</a></li>
                                        <li><a href="#"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; Report 6</a></li>
                                        <li><a href="#"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; Report 7</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="#">
                                        Accounts Dept
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Report 1</a></li>
                                        <li><a href="#"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Report 2</a></li>
                                        <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Report 3</a></li>
                                        <li><a href="#"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Report 4</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; Report 5</a></li>
                                        <li><a href="#"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; Report 6</a></li>
                                        <li><a href="#"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; Report 7</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #ffe114; color: #01354a; font-size: 12px; font-weight: bold;">Performance Reports &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li>
                                    <a href="NationalPerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>">
                                        National Performance Report
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=1">
                                        SA 1 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=1"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=1"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=1"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=1"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=1"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=2">
                                        SA 2 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=2"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=2"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=2"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=2"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=2"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=3">
                                        SA 3 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=3"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=3"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=3"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=3"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=3"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=4">
                                        SA 4 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=4"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=4"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=4"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=4"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=4"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=5">
                                        SA 5 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=5"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=5"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=5"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=5"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=5"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=6">
                                        SA 6 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=6"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=6"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=6"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=6"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=6"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=7">
                                        SA 7 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=7"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=7"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=7"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=7"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=7"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=8">
                                        SA 8 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=8"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=8"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=8"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=8"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=8"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=9">
                                        SA 9 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=9"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=9"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=9"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=9"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=9"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=10">
                                        SA 10 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=10"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=10"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=10"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=10"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=10"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=11">
                                        SA 11 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=11"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=11"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=11"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=11"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=11"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12">
                                        SA 12 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=13">
                                        SA 13 - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=13"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=13"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=13"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=13"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=13"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="dropdown-submenu">
                                    <a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=14">
                                        OS - Performance Report
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="StatePerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=14"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="StatePerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=14"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="StatePerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=14"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="StatePerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=14"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="StatePerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=14"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="divider"></li>
                                <li class="dropdown-submenu">
                                    <a href="RegionPerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12">
                                        Region wise Performance
                                    </a>
                                    <ul class="dropdown-menu">
                                        <li><a href="RegionPerformanceReportSF.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                        <li><a href="RegionPerformanceReportMem.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                        <li><a href="RegionPerformanceReportSD.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                        <li><a href="RegionPerformanceReportAux.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                        <li class="divider"></li>
                                        <li><a href="RegionPerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&StateAsso=12"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                                    </ul>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="AreaPerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>">
                                        Area wise Performance Report
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="CampPerformanceReport.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>">
                                        Camp Performance Report
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Camps Master &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Active Camps</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; In-Active Camps</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Merged Camps</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Closed Camps</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Report 1</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Report 2</a></li>
                                <li><a href="#"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Report 3</a></li>
                            </ul>
                        </li>
                        <li  class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Officers Directory &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li><a href="#"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; National Officers</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; State Officers</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; State Program Coordinators</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; Regional Directors</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; Program Leaders</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; Area Directors</a></li>
                                <li><a href="https://mis.gideons.org.in/campOfficersList.jsp?SiD=<%=sessionid%>&acT=<%=new Date(session.getLastAccessedTime())%>&level=camp" target="_blank"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; Camp Officers</a></li>
                                <li class="divider"></li>
                                <li><a href="#"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Field Officers</a></li>
                                <li><a href="#"><i class="fa fa-male" aria-hidden="true"></i> &nbsp; NHQ Staff Members</a></li>
                            </ul>
                        </li>
                    </ul> 
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Sign out &nbsp;
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu dmenu">
                                <li>
                                    <a href="#">
                                        Log Out
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <section class="container-fluid" style="padding: 60px 2px;" >
            <form name="frm2" method="post" action="RegionPerformanceReportSD.jsp" onsubmit="return FrontPage_Form1_Validator(this)">     
                <div class='panel panel-default panel-accent-gold'>
                    <div class="panel-body" style="padding-top: 20px;"> 
                        <div class="form-row">                                       
                            <div class="form-group col-md-4">
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </span>
                                    <select class="form-control" name="stateasso" id="stateasso" onchange="getRegions(this)" required>
                                        <option value="0">- Select State Association -</option>
                                        <option value="SA1 (Tamil Nadu)">SA1 (Tamil Nadu)</option>
                                        <option value="SA2 (Kerala)">SA2 (Kerala)</option>
                                        <option value="SA3 (Karnataka and Goa)">SA3 (Karnataka and Goa)</option>
                                        <option value="SA4 (Andhra Pradesh)">SA4 (Andhra Pradesh)</option>
                                        <option value="SA5 (Telangana)">SA5 (Telangana)</option>
                                        <option value="SA6 (Madhya Pradesh and Chattisgarh)">SA6 (Madhya Pradesh and Chattisgarh)</option> 
                                        <option value="SA7 (Maharashtra and Gujarat)">SA7 (Maharashtra and Gujarat)</option> 
                                        <option value="SA8 (Rajasthan Delhi Punjab and Haryana)">SA8 (Rajasthan Delhi Punjab and Haryana)</option> 
                                        <option value="SA9 (Uttar Pradesh and Uttarakhand)">SA9 (Uttar Pradesh and Uttarakhand)</option> 
                                        <option value="SA10 (Bihar and Jharkhand)">SA10 (Bihar and Jharkhand)</option> 
                                        <option value="SA11 (Orissa West Bengal and Sikkim)">SA11 (Orissa West Bengal and Sikkim)</option> 
                                        <option value="SA12 (Mizoram Tripura and Meghalaya)">SA12 (Mizoram Tripura and Meghalaya)</option>
                                        <option value="SA13 (Arunachal Pradesh Nagaland and Manipur)">SA13 (Arunachal Pradesh Nagaland and Manipur)</option>
                                        <option value="OS (Outreach States)">OS (Outreach States)</option>
                                    </select>
                                </div>                                            
                            </div>                                      
                            <div class="form-group col-md-4">
                                <div class='input-group'>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-edit"></span>
                                    </span>
                                    <select class="form-control" name="region" id="region" required="">
                                        <option value="0">- Select Region -</option>
                                    </select>

                                </div>                                            
                            </div>                                       
                            <div class="form-group col-md-4 pull-right">
                                <div class='input-group'>
                                    <input type="submit" class="btn btn-primary" id="submit-btn" value="Proceed">
                                </div>                                            
                            </div>                                         
                        </div>                                    
                        <div id="snackbar"></div>
                    </div>
                </div>
                <ul class="nav nav-tabs">
                    <li class="active"><a data-toggle="tab" href="#summary_tab" style="font-size: 12px; font-weight: bold;"><%= v_sa%> -:- Scripture Distribution - Summary Report</a></li>
                    <li><a data-toggle="tab" href="#detailed_tab" style="font-size: 12px; font-weight: bold;"><%= v_sa%> -:- Scripture Distribution - Detailed Report</a></li>
                </ul>
                <div class="tab-content" style=" padding: 3px;">
                    <div id="summary_tab" class="tab-pane fade in active">
                        <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 480px; background-color: #fff; overflow-y: scroll;">
                            <table id="summary" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">   
                                    <tr>
                                        <th colspan="4">&nbsp;</th>
                                        <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;">Total Scripture Distribution</th>
                                        <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;">Gideon PWT</th>
                                        <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;">Auxiliary PWT</th>
                                    </tr>                                                            
                                    <tr>                                               
                                        <th style="text-align: left;" nowrap>SA No</th>
                                        <th style="text-align: center;" >Region</th>                                        
                                        <th style="text-align: center;" >Area</th>                                        
                                        <th style="text-align: left;" nowrap>Area Director</th>  
                                        <th style="text-align: right;" nowrap>SD Goal</th> 
                                        <th style="text-align: right;" >SD Demand Placed</th>
                                        <th style="text-align: right;" >Total SD Actuals<br>(Shipped + In-Transit)</th>  
                                        <th style="text-align: right;" >SD %</th>
                                        <th style="text-align: right;" >PWT Goal</th>
                                        <th style="text-align: right;" >PWT Actual</th>  
                                        <th style="text-align: right;" >PWT %</th>
                                        <th style="text-align: right;" >Aux PWT Goal</th>
                                        <th style="text-align: right;" >Aux PWT Actual</th>
                                        <th style="text-align: right;" >Aux PWT Per</th> 
                                    </tr>
                                </thead> 
                                <%

                                    String display_sa = "";
                                    String sql = "";
                                    DataSource ds = null;
                                    Connection con = null;
                                    Context context = new InitialContext();
                                    Context envCtx = (Context) context.lookup("java:comp/env");
                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                    try {
                                        con = ds.getConnection();
                                        Statement statement = con.createStatement();
                                        sql = "select round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,Get_Area_Directors(to_number(decode(sa_no,'Zone_Total','0',sa_no)),to_number(decode(region,'SA_Total','0',region)),to_number(decode(area,'Region_Total','0',area))) Area_Director,round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,a.* from E503_STATE_Summary_Report a where sa_no=nvl(trim(substr('" + v_sa + "',3,2)),'14') and region='" + v_area_region + "'    order by sa_no,region,area";
                                        ResultSet resultSet = statement.executeQuery(sql);
                                        while (resultSet.next()) {
                                            display_sa = resultSet.getString("sa_no");

                                            if (display_sa.equalsIgnoreCase("1")) {
                                                display_sa = "SA1 (Tamil Nadu)";
                                            } else if (display_sa.equalsIgnoreCase("2")) {
                                                display_sa = "SA2 (Kerala)";
                                            } else if (display_sa.equalsIgnoreCase("3")) {
                                                display_sa = "SA3 (Karnataka and Goa)";
                                            } else if (display_sa.equalsIgnoreCase("4")) {
                                                display_sa = "SA4 (Andhra Pradesh)";
                                            } else if (display_sa.equalsIgnoreCase("5")) {
                                                display_sa = "SA5 (Telangana)";
                                            } else if (display_sa.equalsIgnoreCase("6")) {
                                                display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                            } else if (display_sa.equalsIgnoreCase("7")) {
                                                display_sa = "SA7 (Maharashtra and Gujarat)";
                                            } else if (display_sa.equalsIgnoreCase("8")) {
                                                display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                            } else if (display_sa.equalsIgnoreCase("9")) {
                                                display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                            } else if (display_sa.equalsIgnoreCase("10")) {
                                                display_sa = "SA10 (Bihar and Jharkhand)";
                                            } else if (display_sa.equalsIgnoreCase("11")) {
                                                display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                            } else if (display_sa.equalsIgnoreCase("12")) {
                                                display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                            } else if (display_sa.equalsIgnoreCase("13")) {
                                                display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                            } else if (display_sa.equalsIgnoreCase("14")) {
                                                display_sa = "OS (Outreach States)";
                                            }

                                            if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                %>
                                <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                    <td colspan="3" style="text-align: right;">State Overall Total&nbsp; </td>
                                    <%
                                    } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                    %>
                                <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                    <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                    <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                    <%
                                    } else {
                                    %>
                                <tr>
                                    <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                    <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                    <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                    <td style="text-align: left;" nowrap><%=resultSet.getString("Area_Director")%></td>
                                    <%
                                        }
                                    %>

                                    <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                    <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                    <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                </tr>
                                <%
                                        }
                                        con.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </table>                                
                        </div>
                    </div>
                    <div id="detailed_tab" class="tab-pane fade">
                        <div class="table-responsive" style="vertical-align: middle; font-size: 10px; height: 480px; background-color: #fff; overflow-y: scroll;">
                            <table id="detailed" class="table table-bordered table-responsive table-hover">
                                <thead style="background-color: #01354a; color: #ffe114;">   
                                    <tr>
                                        <th colspan="4">&nbsp;</th>
                                        <th colspan="4"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;">Total Scripture Distribution</th>
                                        <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;">Gideon PWT</th>
                                        <th colspan="3"  style="text-align: center; vertical-align: middle; font-weight: bold; font-size: 11px;">Auxiliary PWT</th>
                                    </tr>                                                            
                                    <tr>                                               
                                        <th style="text-align: left;" nowrap>SA No</th>
                                        <th style="text-align: center;" nowrap>Region</th>                                        
                                        <th style="text-align: center;" nowrap>Area</th>  
                                        <th style="text-align: left;" nowrap>Camp Name</th>
                                        <th style="text-align: right;" nowrap>SD Goal</th> 
                                        <th style="text-align: right;" >SD Demand Placed</th>
                                        <th style="text-align: right;" >Total SD Actuals<br>(Shipped + In-Transit)</th>  
                                        <th style="text-align: right;" >SD %</th>
                                        <th style="text-align: right;" >PWT Goal</th>
                                        <th style="text-align: right;" >PWT Actual</th>  
                                        <th style="text-align: right;" >PWT %</th>
                                        <th style="text-align: right;" >Aux PWT Goal</th>
                                        <th style="text-align: right;" >Aux PWT Actual</th>
                                        <th style="text-align: right;" >Aux PWT Per</th> 
                                    </tr>
                                </thead> 
                                <%
                                    String display_camp = "";
                                    display_sa = "";
                                    sql = "";
                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                    try {
                                        con = ds.getConnection();
                                        Statement statement = con.createStatement();
                                        sql = "select round(case when Memberships_Aux_Goal>0 then round(100*(Total_Auxiliary/Memberships_Aux_Goal),2) else 0 end,0) Memberships_Aux_per,round(case when Memberships_Aux_Op_Bal>0 then round(100*(Aux_Renewed/Memberships_Aux_Op_Bal),2) else 0 end,0) Aux_Renewal_per,round(case when aux_sd_goal>0 then round(100*(aux_sd_actual/aux_sd_goal),2) else 0 end,0) aux_sd_per,round(case when Memberships_Gideon_Goal>0 then round(100*(Total_Gideon/Memberships_Gideon_Goal),2) else 0 end,0) Memberships_Gideon_per,round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,round(case when (Gideon_Renewed>0 and Memberships_Gid_Op_Bal>0) then round(100*(Gideon_Renewed/Memberships_Gid_Op_Bal),2) else 0 end,0) gid_renewal_per,round(case when sd_goal>0 then round(100*(sd_actual/sd_goal),2) else 0 end,0) sd_per,round(case when total_sf_goal>0 then round(100*(total_sf_actual/total_sf_goal),2) else 0 end,0) sf_per,round(case when cp_goal>0 then round(100*(cp_actual/cp_goal),2) else 0 end,0) cp_per,round(case when Gideon_PWT_Goal>0 then round(100*(Gideon_PWT_Actual/Gideon_PWT_Goal),2) else 0 end,0) PWT_Gideon_per,round(case when cro_goal>0 then round(100*(cro_actual/cro_goal),2) else 0 end,0) cro_per,round(case when ffr_goal>0 then round(100*(ffr_actual/ffr_goal),2) else 0 end,0) ffr_per,round(case when pab_goal>0 then round(100*(pab_actual/pab_goal),2) else 0 end,0) pab_per,round(case when gcbp_goal>0 then round(100*(gcbp_actual/gcbp_goal),2) else 0 end,0) gcbp_per,round(case when ffg_goal>0 then round(100*(ffg_actual/ffg_goal),2) else 0 end,0) ffg_per,round(case when ffa_goal>0 then round(100*(ffa_actual/ffa_goal),2) else 0 end,0) ffa_per,round(case when aux_sf_goal>0 then round(100*(aux_sf_actual/aux_sf_goal),2) else 0 end,0) aux_sf_per,round(case when aux_pwt_goal>0 then round(100*(aux_pwt_actual/aux_pwt_goal),2) else 0 end,0) aux_pwt_per,(total_life+total_annual) total_memberships,a.* from E503_STATE_REPORT_TBL a where sa_no=nvl(trim(substr('" + v_sa + "',3,2)),'14') and region='" + v_area_region + "' order by sa_no,region,area,camp";
                                        ResultSet resultSet = statement.executeQuery(sql);
                                        while (resultSet.next()) {
                                            display_sa = resultSet.getString("sa_no");
                                            display_camp = resultSet.getString("camp");
                                            if (display_camp == null) {
                                                display_camp = "Area Total";
                                            }
                                            if (display_sa.equalsIgnoreCase("1")) {
                                                display_sa = "SA1 (Tamil Nadu)";
                                            } else if (display_sa.equalsIgnoreCase("2")) {
                                                display_sa = "SA2 (Kerala)";
                                            } else if (display_sa.equalsIgnoreCase("3")) {
                                                display_sa = "SA3 (Karnataka and Goa)";
                                            } else if (display_sa.equalsIgnoreCase("4")) {
                                                display_sa = "SA4 (Andhra Pradesh)";
                                            } else if (display_sa.equalsIgnoreCase("5")) {
                                                display_sa = "SA5 (Telangana)";
                                            } else if (display_sa.equalsIgnoreCase("6")) {
                                                display_sa = "SA6 (Madhya Pradesh and Chattisgarh)";
                                            } else if (display_sa.equalsIgnoreCase("7")) {
                                                display_sa = "SA7 (Maharashtra and Gujarat)";
                                            } else if (display_sa.equalsIgnoreCase("8")) {
                                                display_sa = "SA8 (Rajasthan Delhi Punjab and Haryana)";
                                            } else if (display_sa.equalsIgnoreCase("9")) {
                                                display_sa = "SA9 (Uttar Pradesh and Uttarakhand)";
                                            } else if (display_sa.equalsIgnoreCase("10")) {
                                                display_sa = "SA10 (Bihar and Jharkhand)";
                                            } else if (display_sa.equalsIgnoreCase("11")) {
                                                display_sa = "SA11 (Orissa West Bengal and Sikkim)";
                                            } else if (display_sa.equalsIgnoreCase("12")) {
                                                display_sa = "SA12 (Mizoram Tripura and Meghalaya)";
                                            } else if (display_sa.equalsIgnoreCase("13")) {
                                                display_sa = "SA13 (Arunachal Pradesh Nagaland and Manipur)";
                                            } else if (display_sa.equalsIgnoreCase("14")) {
                                                display_sa = "OS (Outreach States)";
                                            }

                                            if (resultSet.getString("region").equalsIgnoreCase("SA_Total")) {
                                %>
                                <tr style="background-color: #01354a; font-weight: bold; font-size: 12px; color: rgb(255, 225, 20);;">
                                    <td colspan="4" style="text-align: right;">State Overall Total&nbsp; </td>
                                    <%
                                    } else if (resultSet.getString("area").equalsIgnoreCase("Region_Total")) {
                                    %>
                                <tr style="background-color: #F0FFFF; font-weight: bold; font-size: 11px; color: navy;">
                                    <td style="text-align: center;" nowrap><%=resultSet.getString("sa_no")%></td>
                                    <td colspan="3" style="text-align: right;" nowrap>Region-<%=resultSet.getString("region")%> Total&nbsp; </td>
                                    <%
                                    } else if (display_camp.equalsIgnoreCase("Area Total")) {
                                    %>
                                <tr style="background-color: #FFFFF0; font-weight: bold; font-size: 11px; color: navy;">
                                    <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                    <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                    <td colspan="2" style="text-align: right;">Area Total&nbsp; </td>
                                    <%                    } else {
                                    %>
                                <tr>
                                    <td style="text-align: center;" nowrap>SA <%=resultSet.getString("sa_no")%></td>
                                    <td style="text-align: center;" nowrap>Region-<%=resultSet.getString("region")%></td>
                                    <td style="text-align: center;" nowrap>R-<%=resultSet.getString("region")%>/Area-<%=resultSet.getString("area")%></td>
                                    <td style="text-align: left;"><%=display_camp%></td>
                                    <%
                                        }
                                    %>

                                    <td style="text-align: right;" nowrap><%=resultSet.getString("sd_goal")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("sd_demand")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("sd_actual")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("sd_per")%>&nbsp;%</td>

                                    <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Goal")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("Gideon_PWT_Actual")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("PWT_Gideon_per")%>&nbsp;%</td>

                                    <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_goal")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_actual")%></td>
                                    <td style="text-align: right;" nowrap><%=resultSet.getString("aux_pwt_per")%>&nbsp;%</td>
                                </tr>
                                <%
                                        }
                                        con.close();
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                            </table>                                
                        </div>
                    </div>
                </div>
            </form>
        </section>

        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#summary').DataTable({
                    destroy: true,
                    responsive: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ],
                    "scrollY": "300px",
                    "scrollX": true,
                    "paging": false
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                var table = $('#detailed').DataTable({
                    destroy: true,
                    responsive: true,
                    "ordering": true,
                    'processing': true,
                    'language': {
                        'loadingRecords': '&nbsp;',
                        'processing': '<p style="background-color: yellow; width:100%; font-size:12px; text-align: left; vertical-align: middle; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;"><font style="font-size: 14px; font-weight: bold;">Processing</font><br>Please wait a moment &nbsp;&nbsp; <i class="fa fa-spinner fa-spin"></i></p>'
                    },
                    rowId: 'extn',
                    deferRender: true,
                    dom: 'Bfrtip',
                    buttons: [
                        {
                            extend: 'excel',
                            footer: true
                        }
                    ],
                    "scrollY": "300px",
                    "scrollX": true,
                    "paging": false
                });
            });
        </script>
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
        <!--<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>-->
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
    </body>
</html>
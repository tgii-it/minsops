<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String useraccessname = "";
    String userName = "";
    String designation = "";
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
        <title>2021_22 Digital Applications</title>
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
                var checked = false, e, i = 0;
                while (e = f.elements[i++]) {
                    if (e.type === 'checkbox' && e.checked)
                        checked = true;
                }

                if (!checked) {
                    $("#snackbar").hide();
                    $("#final-submit").show();
                    alert("Please Select a Record To Process!");
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

        </script>
        <script language="JavaScript">
            function Full_W_P(url) {
                params = 'width=' + screen.width;
                params += ', height=' + screen.height;
                params += ', top=0, left=0'
                params += ', fullscreen=yes';
                params += ', directories=no';
                params += ', location=no';
                params += ', menubar=no';
                params += ', resizable=no';
                params += ', scrollbars=no';
                params += ', status=no';
                params += ', toolbar=no';
                newwin = window.open(url, 'PrintCoU', params);
                if (window.focus) {
                    newwin.focus()
                }
                return false;
            }

            function closeWin() {
                PrintCoU.close();
            }
        </script>
    </head>
    <body style="background-color: #fff; width: 100%;">
        <%@ include file="menu.jsp" %>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <form name="frm_apply" method="post" action="SendforCommitteeApproval" onsubmit="return validateCheckbox(this)">
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 2px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; 2021_22 Digital Membership Forms
                                        <!--<i class='fa fa-comments-o pull-right' aria-hidden='true'>&nbsp; <b>Step 1 : Send for Committee Approval</b></i>&nbsp; &nbsp; &nbsp;-->
                                    </h3>
                                </div>
                                <div class="table-responsive" style="padding: 10px; vertical-align: middle; font-size: 11px; color: black; height: auto;">
                                    <table id="gideon" class="table table-bordered table-responsive table-hover" style="width: 100%;">
                                        <thead style="background-color: #01354a; color: #ffe114;">
                                            <tr>
                                                <!--<th style="text-align: left;"><a href="javascript:selectToggle(true, 'frm_apply');" style="color: #fff;"><b>All</b></a>&nbsp; | &nbsp;<a href="javascript:selectToggle(false, 'frm_apply');" style="color: #fff;"><b>None</b></a></th>-->
                                                <th nowrap>Appln_form</th>

                                                <th nowrap>Photograph | Signature</th>
                                                <th nowrap>Record_ID</th>
                                                <th nowrap>Mode</th>
                                                <th nowrap>Status</th>
                                                <th nowrap>Camp</th>
                                                <th nowrap>Mem_Plan</th>
                                                <th nowrap>Gideon_Name</th>
                                                <th nowrap>Auxiliary_Name</th>
                                                <th nowrap>Gideon_Mobile</th>
                                                <th nowrap>Auxiliary_Mobile</th>
                                                <th nowrap>Gideon_Email</th>
                                                <th nowrap>Auxiliary_Email</th>
                                                <th nowrap>Gid_Fee</th>
                                                <th nowrap>Aux_Fee</th>
                                                <th nowrap>Total</th>
                                                <th nowrap>Payment_Method</th>
                                                <th nowrap>Transaction_No</th>
                                                <th nowrap>Tr_Date_Time</th>
                                                <th nowrap>Mode/Bank</th>
                                                <th nowrap>Applied_on</th>
                                                <th nowrap>Form_Filled_by</th>
                                                <th nowrap>Form_Filled_by_Name</th>
                                                <th nowrap>Gideon_DoB</th>
                                                <th nowrap>Auxiliary_DoB</th>
                                                <th nowrap>Addr_line_1</th>
                                                <th nowrap>Addr_line_2</th>
                                                <th nowrap>City</th>
                                                <th nowrap>State</th>
                                                <th nowrap>Pincode</th>
                                                <th nowrap>Church_Name</th>
                                                <th nowrap>Church_Address</th>
                                                <th nowrap>Church_Located_City</th>
                                                <th nowrap>Denomination</th>
                                                <th nowrap>Pastor_Name</th>
                                                <th nowrap>Pastor_Phone_No</th>
                                                <th nowrap>Pastor_Email_ID</th>
                                                <th nowrap>Referene_1_Name</th>
                                                <th nowrap>Referene_1_Phone</th>
                                                <th nowrap>Referene_1_Camp</th>
                                                <th nowrap>Referene_2_Name</th>
                                                <th nowrap>Referene_2_Phone</th>
                                                <th nowrap>Referene_2_Camp</th>
                                                <th nowrap>State_Association</th>
                                                <th nowrap>Region</th>
                                                <th nowrap>Area</th>
                                                <th nowrap>Profession</th>
                                                <th nowrap>Education</th>
                                                <th nowrap>Workplace</th>
                                                <th nowrap>JobTitle</th>
                                            </tr>
                                        </thead>
                                        <tbody id='mytab' class="table-search"> 
                                            <%  String mplan = "";
                                                String trbank = "";
                                                String trno = "";
                                                String trdate = "";
                                                String trpaymode = "";
                                                String paymethod = "";
                                                String profession = "";
                                                String education = "";
                                                String workplace = "";
                                                String jobtitle = "";

                                                String photo = "";
                                                String sign = "";

                                                DataSource ds = null;
                                                Connection con = null;
                                                Context context = new InitialContext();
                                                Context envCtx = (Context) context.lookup("java:comp/env");
                                                ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                try {
                                                    con = ds.getConnection();
                                                    Statement statement = con.createStatement();
                                                    String sql = "select nvl(appln_mode,'NA') mode_of_application,nvl(gmobile,'0') gmobile,nvl(amobile,'0') amobile,"
                                                            + "nvl(icici_trdate,'NA') icici_trdate,nvl(icici_paymode,'NA') icici_paymode,nvl(trno,'NA') trno1,"
                                                            + "icici_refno icici_trno,nvl(trbank,'NA') trbank1,"
                                                            + "(case "
                                                            + "when formfilledby=trim('Member') then formfilledbygideonname "
                                                            + "when formfilledby=trim('Field Staff') then formfilledbyfoname||' (Filed Officer)' else 'Prospective Member' "
                                                            + "end) form_filled_by,"
                                                            + "case "
                                                            + "when mplan='Life Gideon' then 'https://pg.gideons.org.in/SupDoc/GP'||rid "
                                                            + "when mplan='Life Auxiliary' then 'https://pg.gideons.org.in/SupDoc/AP'||rid "
                                                            + "when mplan='Life Both' then 'https://pg.gideons.org.in/SupDoc/GP'||rid "
                                                            + "end photograph, "
                                                            + "case "
                                                            + "when mplan='Life Gideon' then 'https://pg.gideons.org.in/SupDoc/GS'||rid "
                                                            + "when mplan='Life Auxiliary' then 'https://pg.gideons.org.in/SupDoc/AS'||rid "
                                                            + "when mplan='Life Both' then 'https://pg.gideons.org.in/SupDoc/GS'||rid "
                                                            + "end Signature, "
                                                            + "a.* from V_MEMBERSHIP_EFORM_NEW_2021_22 a where a.status='Applied' and rid<>20241669 order by rid desc";
//                                                    System.out.println(sql);
                                                    ResultSet rs = statement.executeQuery(sql);
                                                    while (rs.next()) {
                                                        mplan = rs.getString("mplan");
                                                        paymethod = rs.getString("paymethod");

                                                        profession = rs.getString("gideonprofession");
                                                        education = rs.getString("education");
                                                        workplace = rs.getString("workplace");
                                                        jobtitle = rs.getString("jobtitle");

                                                        photo = rs.getString("photograph");
                                                        sign = rs.getString("Signature");

                                                        if (paymethod.equalsIgnoreCase("Payment Gateway")) {
                                                            trno = rs.getString("icici_refno");
                                                            trdate = rs.getString("icici_trdate");
                                                            trbank = rs.getString("icici_paymode");
                                                        } else {
                                                            trno = rs.getString("trno");
                                                            trdate = rs.getString("trdate");
                                                            trbank = rs.getString("trbank");
                                                        }

                                                        if (jobtitle == "null" || jobtitle == "") {
                                                            jobtitle = "--";
                                                        }

                                                        if (profession == "null" || profession == "") {
                                                            profession = "--";
                                                        }

                                                        if (workplace == "null" || workplace == "") {
                                                            workplace = "--";
                                                        }
                                            %>
                                            <tr>
                                                <%
                                                    if (mplan.contains("Annual Gideon")) {
                                                %>
                                                <td nowrap><center><a href='PrintewpApplication?refno=<%=rs.getString("rid")%>' target='_blank'><i class='fa fa-file-pdf-o' style='font-size:16px; color:blue'></i></a></center></td>
                                        <td>&nbsp;</td>            
                                        <%
                                        } else if (mplan.contains("Annual Auxiliary")) {
                                        %>
                                        <td nowrap><center><a href='PrintewpaApplication?refno=<%=rs.getString("rid")%>' target='_blank'><i class='fa fa-file-pdf-o' style='font-size:16px; color:red'></i></a></center></td>
                                        <td>&nbsp;</td>
                                        <%
                                        } else if (mplan.contains("Annual Both")) {
                                        %>
                                        <td nowrap><center><a href='PrintewpApplication?refno=<%=rs.getString("rid")%>' target='_blank'><i class='fa fa-file-pdf-o' style='font-size:16px; color:blue'></i></a>&nbsp;&nbsp;&nbsp;<a href='PrintewpaApplication?refno=<%=rs.getString("rid")%>' target='_blank'><i class='fa fa-file-pdf-o' style='font-size:16px; color:red'></i></a></center></td>
                                        <td>&nbsp;</td>                                    
                                        <%
                                        } else if (mplan.contains("Life Gideon")) {
                                        %>
                                        <td nowrap><center><a href='PrintewpApplication?refno=<%=rs.getString("rid")%>' target='_blank'><i class='fa fa-file-pdf-o' style='font-size:16px; color:blue'></i></a></center></td>
                                        <td nowrap><a class="image-link" href="<%=photo%>"><img src="<%=photo%>" alt="" width="100" height="120"></a>&nbsp;<a class="image-link" href="<%=sign%>"><img src="<%=sign%>" alt="" width="100" height="120"></a></td>
                                                <%
                                                } else if (mplan.contains("Life Auxiliary")) {
                                                %>
                                        <td nowrap><center><a href='PrintewpaApplication?refno=<%=rs.getString("rid")%>' target='_blank'><i class='fa fa-file-pdf-o' style='font-size:16px; color:red'></i></a></center></td>
                                        <td nowrap><a class="image-link" href="<%=photo%>"><img src="<%=photo%>" alt="" width="100" height="120"></a>&nbsp;<a class="image-link" href="<%=sign%>"><img src="<%=sign%>" alt="" width="100" height="120"></a></td>                                   
                                                <%
                                                } else if (mplan.contains("Life Both")) {
                                                %>
                                        <td nowrap><center><a href='PrintewpApplication?refno=<%=rs.getString("rid")%>' target='_blank'><i class='fa fa-file-pdf-o' style='font-size:16px; color:blue'></i></a>&nbsp;&nbsp;&nbsp;<a href='PrintewpaApplication?refno=<%=rs.getString("rid")%>' target='_blank'><i class='fa fa-file-pdf-o' style='font-size:16px; color:red'></i></a></center></td>
                                        <td nowrap><a class="image-link" href="<%=photo%>"><img src="<%=photo%>" alt="" width="100" height="120"></a>&nbsp;<a class="image-link" href="<%=sign%>"><img src="<%=sign%>" alt="" width="100" height="120"></a></td>
                                                <%
                                                    }
                                                %>
                                        <td nowrap><%=rs.getString("rid")%></td>
                                        <td nowrap><%=rs.getString("appln_mode")%></td>
                                        <td nowrap><%=rs.getString("status")%></td>
                                        <td nowrap><%=rs.getString("formfilledbycamp")%></td>
                                        <td nowrap><%=rs.getString("mplan")%></td>
                                        <td nowrap><%=rs.getString("gideonname")%></td>
                                        <td nowrap><%=rs.getString("auxname")%></td>  

                                        <td nowrap><%=rs.getString("gmobile")%></td>    
                                        <td nowrap><%= rs.getString("amobile")%></td>
                                        <td nowrap><%=rs.getString("gemail")%></td>
                                        <td nowrap><%=rs.getString("aemail")%></td>
                                        <td style='text-align: center;' nowrap><%=rs.getString("gfee")%></td>
                                        <td style='text-align: center;' nowrap><%=rs.getString("afee")%></td>
                                        <td style='text-align: center;' nowrap><%=rs.getString("mfee")%></td>

                                        <td nowrap><%=paymethod%></td>
                                        <td nowrap><%=trno%></td>
                                        <td nowrap><%=trdate%></td>
                                        <td nowrap><%=trbank%></td>
                                        <td nowrap><%=rs.getString("applied_on")%></td>
                                        <td nowrap><%=rs.getString("formfilledby")%></td>
                                        <td nowrap><%=rs.getString("form_filled_by")%></td>

                                        <td nowrap><%=rs.getString("gdob1")%></td>
                                        <td nowrap><%=rs.getString("adob1")%></td>
                                        <td nowrap><%=rs.getString("addr1")%></td>
                                        <td nowrap><%=rs.getString("addr2")%></td>
                                        <td nowrap><%=rs.getString("city")%></td>
                                        <td nowrap><%=rs.getString("state")%></td>
                                        <td nowrap><%=rs.getString("pincode")%></td>

                                        <td nowrap><%=rs.getString("churchname")%></td>
                                        <td nowrap><%=rs.getString("churchaddr")%></td>
                                        <td nowrap><%=rs.getString("churchcity")%></td>
                                        <td nowrap><%=rs.getString("churchdenoination")%></td>
                                        <td nowrap><%=rs.getString("pastorname")%></td>
                                        <td nowrap><%=rs.getString("pastormobile")%></td>
                                        <td nowrap><%=rs.getString("pastoremail")%></td>

                                        <td nowrap><%=rs.getString("ref1name")%></td>
                                        <td nowrap><%=rs.getString("ref1phone")%></td>
                                        <td nowrap><%=rs.getString("ref1camp")%></td>
                                        <td nowrap><%=rs.getString("ref2name")%></td>
                                        <td nowrap><%=rs.getString("ref2phone")%></td>
                                        <td nowrap><%=rs.getString("ref2camp")%></td>
                                        <td nowrap><%=rs.getString("state_asso")%></td>
                                        <td style='text-align: center;' nowrap><%=rs.getString("region")%></td>
                                        <td style='text-align: center;' nowrap><%=rs.getString("area")%></td>
                                        <td nowrap><%=profession%></td>
                                        <td nowrap><%=education%></td>
                                        <td nowrap><%=workplace%></td>
                                        <td nowrap><%=jobtitle%></td>
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
                            <!--<div class="form-group col-md-12">
                                <div class='input-group pull-right'>
                                    <input type="submit" class="btn btn-primary" id="final-submit" value="Step 1 : Send for Committee Approval">
                                </div>                                            
                            </div>-->
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
        <!-- <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/dataTables.responsive.min.js"></script>-->
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script>
                            function Status() {
                                if (document.getElementById("memtype").value === "Gideon(TGII) Life Member") {
                                    document.getElementById("start").hidden = false;
                                    document.getElementById("end").hidden = true;
                                } else if (document.getElementById("memtype").value === "Auxiliary(TGII) Life Member") {
                                    document.getElementById("start").hidden = false;
                                    document.getElementById("end").hidden = true;
                                } else {
                                    document.getElementById("start").hidden = false;
                                    document.getElementById("end").hidden = false;
                                }

                            }
        </script>
        <script>
            $(function () {
                $('#start_date').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    autoclose: true,
                    todayHighlight: true
                });
            });

            $('#startdate').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });
            $("#startdate").datepicker().datepicker("setDate", new Date());

            $(function () {
                $('#end_date').datepicker({
                    format: "dd/mm/yyyy",
                    language: "es",
                    autoclose: true,
                    todayHighlight: true
                });
            });

            $('#end_date').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });
            $("#end_date").datepicker().datepicker("setDate", "31/10/2021");
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
        <script>
            $(document).ready(function () {
                $('.image-link').magnificPopup({type: 'image'});
            });
        </script>
    </body>
</html>
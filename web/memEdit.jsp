<%@page import="java.util.Date"%>
<%@page language="java" import="java.util.*" %>
<%@page import="java.sql.*, javax.sql.*, javax.naming.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@include file="loadbaseinfo.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <script src="js/camps.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TGII | Membership Profile</title>
        <link href="css/bootstrap.min_sd.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">  
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
    </head>
    <body id="myContainer" style="background-color: #fff; width: 100%;" onload="Signup();">
        <%@ include file="menu.jsp" %>
        <section id="main" style="padding: 60px 0px;">
            <div class="container-fluid">   
                <div class="row">
                    <div class="col-md-12">
                        <form name="frm2" method="post">                      
                            <div class='panel panel-default panel-accent-gold'>
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 14px; font-weight: bold; color: #14599f; letter-spacing: 3px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; Search & Select record..
                                    </h3>
                                </div>
                                <div class="panel-body" style="padding-top: 20px;"> 
                                    <div class="form-row"> 
                                        <div class="form-group col-md-9" >
                                            <label for="namestr">Search & select the Record</label>
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-list"></span>
                                                </span>
                                                <%  String name_sql = "";
                                                    String mname = "";
                                                    String mname_str = "";

                                                    DataSource ds = null;
                                                    Connection con = null;
                                                    Context context = new InitialContext();
                                                    Context envCtx = (Context) context.lookup("java:comp/env");
                                                    ds = (DataSource) envCtx.lookup("tomcat/UCP_atp");
                                                    try {
                                                        con = ds.getConnection();
                                                        Statement statement = con.createStatement();
                                                        name_sql = "select mid,CAMP||' - '||MID||' - '||name||' - '||status||' - '||phone||' - '||email||' - '||mtype name_str from membership_weekly_raw order by mid";

                                                        ResultSet resultSet = statement.executeQuery(name_sql);
                                                %>
                                                <input name="mid" list="oName" class="form-control" id="mid" style="text-align: left; background-color: #fff; height: 30px;" placeholder=".. Search..">
                                                <datalist id="oName">
                                                    <%
                                                        while (resultSet.next()) {
                                                            mname = resultSet.getString("mid");
                                                            mname_str = resultSet.getString("name_str");
                                                    %>
                                                    <option value="<%=mname%>"><%=mname_str%></option>
                                                    <%
                                                        }
                                                    %>
                                                </datalist>
                                                <%
                                                        resultSet.close();
                                                        statement.close();
                                                        con.close();
                                                    } catch (Exception e) {
                                                        e.printStackTrace();
                                                    }
                                                %>
                                            </div>                                            
                                        </div> 
                                        <div class="form-group col-md-3" hidden>
                                            <div class='input-group'>
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-edit"></span>
                                                </span>
                                                <input type='text' style="padding: 5px; font-size:11px;" class="form-control editRow" name="mid"  id="mid" placeholder="Search"/>
                                            </div>                                            
                                        </div>  
                                        <div class="form-group col-md-3" hidden>
                                            <label for="namestr">&nbsp;</label>
                                            <div class='input-group'>                                                
                                                <input style="padding: 5px; font-size:11px;" class="btn btn-primary pull-right editRow " value="CLICK HERE" placeholder="CLICK HERE" readonly>   
                                            </div>                                            
                                        </div> 
                                    </div>                                    
                                    <div id="snackbar"></div>
                                </div>
                            </div>
                        </form>                        
                        <form name="frm_apply" id="frm_apply" class="registration-form">
                            <div class='panel panel-default panel-accent-gold'>                              
                                <div class="panel-heading" style="background-color: #fff;">
                                    <h3 class="panel-title" style="vertical-align: middle; font-size: 12px; font-weight: bold; color: #337ab7; letter-spacing: 3px;">
                                        <i class="fa fa-fw fa-share"></i>&nbsp; Profile Information
                                    </h3>
                                </div>
                                <br>                              
                                <div class="row" style=" padding: -5px; vertical-align: middle; font-size: 11px; height: auto;">   
                                    <div class="col-sm-12 form-group">   
                                        <div class="col-sm-2 form-group" hidden>
                                            <label>Zone Name</label>
                                            <input type="text" style="padding: 5px;" name="zone1"  class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>State Name</label>
                                            <input type="text" style="padding: 5px;" name="state_association" id="state_association" class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <label>Region Name</label>
                                            <input type="text" style="padding: 5px;" name="region_name" id="region_name" class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <label>Area Name</label>
                                            <input type="text" style="padding: 5px;" name="area_name" id="area_name"class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>Camp Name</label>
                                            <input type="text"  style="padding: 5px;" name="camp" id="camp" class="form-control" readonly>
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>Member's ID</label>
                                            <input type="text" style="padding: 5px;" name="mid1" id="mid1" class="form-control" readonly>
                                        </div>	
                                    </div>
                                </div>
                                <div class="row" style=" padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group">  
                                        <div class="col-sm-3 form-group">
                                            <label> Name</label>
                                            <input type="text" style="padding: 5px;" name="name" id="name" class="form-control">
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>Date of Birth</label>
                                            <input type="text" style="padding: 5px;"  name="date_of_birth" maxlength="10" id="date_of_birth" class="form-control">
                                        </div> 	
                                        <div class="col-sm-2 form-group">
                                            <label> Mobile No</label>
                                            <input inputmode="numeric" style="padding: 5px;"  name="phone" maxlength="10"  id="phone" class="form-control">
                                        </div>
                                        <div class="col-sm-2 form-group">
                                            <label>Landline No</label>
                                            <input type="text" style="padding: 5px;"  name="mobile2" maxlength="10" id="mobile2" class="form-control">
                                        </div>  
                                        <div class="col-sm-3 form-group">
                                            <label>WhatsApp No</label>
                                            <input inputmode="numeric" style="padding: 5px;"  name="mobile3" maxlength="10" id="mobile3" class="form-control">
                                        </div>
                                    </div>
                                </div>	
                                <div class="row" style=" padding: -10px; vertical-align: middle; font-size: 11px; height: auto;" >
                                    <div class="col-sm-12 form-group">  
                                        <div class="col-sm-2 form-group">
                                            <label>Email</label>
                                            <input type="email" style="padding: 5px;" name="email" id="email" class="form-control">
                                        </div>
                                        <div class="col-sm-5 form-group">
                                            <label>Address</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" name="address" id="address"  class="form-control">
                                        </div>	
                                        <div class="col-sm-5 form-group">
                                            <label>Address 2</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" name="address2" id="address2"  class="form-control">
                                        </div>
                                    </div>
                                </div>	
                                <div class="row" style=" padding: -10px; vertical-align: middle; font-size: 11px; height: auto;" hidden>
                                    <div class="col-sm-12 form-group">  
                                        <div class="col-sm-3 form-group" >
                                            <label>Auxiliary Name</label>
                                            <input type="text" style="padding: 5px;" name="wname" id="wname" class="form-control">
                                        </div>	
                                        <div class="col-sm-3 form-group">
                                            <label> Aux Phone No (1)</label>
                                            <input type="text" style="padding: 5px;"  name="wmobile" maxlength="10"  id="wmobile" class="form-control">
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <label>Aux WhatsApp Number</label>
                                            <input inputmode="numeric" style="padding: 5px;" name="mobile" maxlength="10" id="mobile" class="form-control">
                                        </div>  
                                        <div class="col-sm-3 form-group">
                                            <label>Aux Email</label>
                                            <input type="email" style="padding: 5px;" name="wemail" id="wemail" class="form-control">
                                        </div>	
                                    </div>
                                </div>	
                                <div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group">                                                                                

                                        <div class="col-sm-3 form-group">
                                            <label>Address Line 3</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" id="street"  name="street"   class="form-control">
                                        </div>	
                                        <div class="col-sm-3 form-group">
                                            <label>City</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" id="city" class="form-control"  name="city">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>State</label>
                                            <select class="form-control" style="font-size:11px; padding: 5px;" id="state" name="state" required="on">
                                                <option value="0">-- Select State --</option>                                        
                                                <option value="Andaman and Nicobar Islands">Andaman and Nicobar Islands</option>                                        
                                                <option value="Andhra Pradesh">Andhra Pradesh </option>                                        
                                                <option value="Arunachal Pradesh">Arunachal Pradesh </option>                                        
                                                <option value="Assam">Assam</option>                                        
                                                <option value="Bihar" >Bihar</option>                                        
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
                                                <option value="Madhya Pradesh" >Madhya Pradesh</option>                                        
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
                                                <option value="Uttarakhand" >Uttarakhand</option>                                        
                                                <option value="West Bengal">West Bengal</option> 
                                            </select>
                                        </div>
                                        <div class="col-sm-3 form-group">
                                            <label>Pin Code</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" maxlength="6" id="pincode" class="form-control"  name="pincode">
                                        </div>
                                    </div>
                                </div>
                                <div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group">  
                                        <div class="form-group col-md-3">
                                            <label>Designation</label>
                                            <input type="text" style="font-size:11px; padding: 5px;" id="designation" class="form-control"  name="designation">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Church Name</label>
                                            <input type="text" id="church" style="font-size:11px; padding: 5px;" class="form-control" placeholder="Name of the Church" name="church">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label>Church Address</label>
                                            <input type="text" id="caddress" style="font-size:11px; padding: 5px;" class="form-control" placeholder="Church Address" name="caddress">
                                        </div>

                                    </div>
                                </div>						
                                <div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group"> 
                                        <div class="form-group col-md-3 col-sm-3">
                                            <label>Church Number</label>
                                            <input  id="cmobile" maxlength="10" style="font-size:11px; padding: 5px;"  pattern="\d{10}" class="form-control"  name="cmobile">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Pastor Name</label>
                                            <input type="text" id="pastor_name" style="font-size:11px; padding: 5px;" class="form-control" name="pastor_name">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Pastor Number</label>
                                            <input type="text" id="pastor_mobile" style="font-size:11px; padding: 5px;" maxlength="10"  pattern="\d{10}" class="form-control" name="pastor_mobile">
                                        </div>
                                        <div class="form-group col-md-3 ">
                                            <label>Pastor email</label>
                                            <input  id="pastor_email" style="font-size:11px; padding: 5px;" name="pastor_email" class="form-email form-control"  >
                                        </div>
                                    </div>
                                </div>                                                            
                                <div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                    <div class="col-sm-12 form-group">  
                                        <div class="form-group col-md-3">
                                            <label>Membership Status</label>
                                            <select class="form-control" style="font-size:11px; padding: 5px;"  name="status" id="status" onchange="Signup()">
                                                <option value="0">---Select----</option>
                                                <option>Current</option>
                                                <option>Grace</option>
                                                <option>Dropped</option>
                                                <option>Applied</option>
                                                <option>Deceased</option>
                                                <option>Canceled</option>
                                                <option>Barred</option>
                                                <option>Revoked</option>
                                                <option>Not Interested</option>
                                            </select>
                                        </div>	
                                        <div class="form-group col-md-3" id="deceased_div">
                                            <label>Deceased Date</label>
                                            <div class='input-group date' id="event_date_cal7">
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text"  class="form-control" style="font-size:11px; padding: 5px;" id="deceased_date"  placeholder="DD/MM/YYY" name="deceased_date">
                                            </div>
                                        </div> 
                                        <div class="form-group col-sm-3" >
                                            <label>Membership Type</label>
                                            <select class="form-control first" style="font-size:11px; padding: 5px;" name="mtype"  id="mtype" >
                                                <option value="0">None</option>
                                                <option value="Auxiliary(TGII) Annual Member">Auxiliary Annual Member</option>
                                                <option value="Gideon(TGII) Annual Member">Gideon Annual Member </option>
                                                <option value="Auxiliary(TGII) Life Member">Auxiliary Life Member</option>
                                                <option value="Gideon(TGII) Life Member">Gideon Life Member</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3" >
                                            <label> Annual Start Date</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text"   class="form-control" style="font-size:11px; padding: 5px;" id="annual_start_date"  placeholder="Start" name="annual_start_date" >
                                            </div>
                                        </div>
                                        <div class="form-group col-md-3" >
                                            <label>Annual End Date</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text" class="form-control"  style="font-size:11px; padding: 5px;" placeholder="end date" id="annual_end_date" name="annual_end_date">
                                            </div>
                                        </div>

                                        <div class="form-group col-md-3" >
                                            <label>Life Start Date</label>
                                            <div class='input-group date' >
                                                <span class="input-group-addon">
                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                </span>
                                                <input type="text"  class="form-control" style="font-size:11px; padding: 5px;" id="life_start_date"  placeholder="Start" name="life_start_date">
                                            </div>
                                        </div> 
                                        <div class="form-group col-sm-3" >
                                            <label>Sign-up Type</label>
                                            <select class="form-control first" style="font-size:11px; padding: 5px;" name="source_of_application" id="source_of_application" >
                                                <option value="0">-Select-</option>
                                                <option value="Personal Sign-up (PSU)">Personal Sign-up (PSU)</option>
                                                <option value="Field - Personal Sign-up (F-PSU)">Field - Personal Sign-up (F-PSU)</option>
                                                <option value="Field - New Member Plan (F-NMP)">Field - New Member Plan (F-NMP)</option>
                                                <option value="Church Presentation Sign-up (PSU@CP)">Church Presentation Sign-up (PSU@CP)</option>
                                                <option value="Church Presentation Sign-up (F_PSU@CP)">Church Presentation Sign-up (F_PSU@CP)</option>
                                                <option value="Annual Membership Dinner (AMD)">Annual Membership Dinner (AMD)</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Credited to</label>
                                            <input type="text" id="cred_nfr_res_per_state" style="font-size:11px; padding: 5px;" class="form-control" name="cred_nfr_res_per_state">
                                        </div>
                                    </div>                                                          
                                    <!--<div class="row" style="padding: -10px; vertical-align: middle; font-size: 11px; height: auto;">
                                        <div class="col-sm-9 form-group">  
                                            <button id="myButton" type="button" class="btn btn-primary editRowSubmit pull-right" >SUBMIT</button>
                                        </div>
                                    </div>--> 
                                </div>
                            </div>
                        </form>	
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer">
            <span class="text-muted">&nbsp;</span>
        </footer>
        <script type="text/javascript" language="javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.5.4/js/buttons.bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" src="https://cdn.datatables.net/responsive/2.2.3/js/responsive.bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.6/dist/loadingoverlay.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>
        <script>

                                                $('#event_date_cal0').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#date_of_birth').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#annual_start_date').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#annual_end_date').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#life_start_date').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

                                                $('#deceased_date').datepicker({
                                                    format: "dd/mm/yyyy",
                                                    language: "es",
                                                    autoclose: true,
                                                    todayHighlight: true,
                                                    forceParse: false,
                                                    autosize: true,
                                                    changeMonth: true,
                                                    changeYear: true
                                                });

        </script>
        <script>
            function Signup() {
                if (document.frm_apply.status.value === "Deceased") {
                    document.getElementById("deceased_div").hidden = false;

                } else
                {
                    document.getElementById("deceased_div").hidden = true;
                    document.getElementById("deceased_date").value = "";

                }
            }
        </script>
        <script>

            $('#event_date_cal2').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true
            });

        </script>
        <script>

            $('#event_date_cal1').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true,
                forceParse: false,
                autosize: true,
                changeMonth: true,
                changeYear: true
            });

        </script>
        <script>

            $('#event_date_cal7').datepicker({
                format: "dd/mm/yyyy",
                language: "es",
                autoclose: true,
                todayHighlight: true,
                forceParse: false,
                autosize: true,
                changeMonth: true,
                changeYear: true
            });

        </script>
        <script>
            $(document).on('click', '.first', function (e) {
                e.preventDefault();
                if (document.frm_apply.mtype.value === "Auxiliary(TGII) Annual Member") {
                    document.getElementById("annual_start").hidden = false;
                    document.getElementById("annual_end").hidden = false;
                    document.getElementById("life_start").hidden = true;
                    document.getElementById("life_start_date").value = "";
                } else if (document.frm_apply.mtype.value === "Gideon(TGII) Annual Member") {
                    document.getElementById("annual_start").hidden = false;
                    document.getElementById("annual_end").hidden = false;
                    document.getElementById("life_start").hidden = true;
                    document.getElementById("life_start_date").value = "";
                } else if (document.frm_apply.mtype.value === "Auxiliary(TGII) Life Member")
                {
                    document.getElementById("annual_start").hidden = true;
                    document.getElementById("annual_end").hidden = true;
                    document.getElementById("life_start").hidden = false;
                    document.getElementById("anuual_start_date").value = "";
                    document.getElementById("anuual_end_date").value = "";
                } else if (document.frm_apply.mtype.value === "Gideon(TGII) Life Member")
                {
                    document.getElementById("annual_start").hidden = true;
                    document.getElementById("annual_end").hidden = true;
                    document.getElementById("life_start").hidden = false;
                    document.getElementById("anuual_start_date").value = "";
                    document.getElementById("anuual_end_date").value = "";
                }
            });
        </script>


        <script>
            $(document).on('click', '.editRowSubmit', function () {
                var mid = $("#mid").val();
                var name = $("#name").val();
                var address = $("#address").val();
                var address2 = $("#address2").val();
                var street = $("#street").val();
                var city = $("#city").val();
                var state = $("#state").val();
                var date_of_birth = $("#date_of_birth").val();
                var phone = $("#phone").val();
                var pincode = $("#pincode").val();
                var deceased_date = $("#deceased_date").val();
                var mobile2 = $("#mobile2").val();
                var mobile3 = $("#mobile3").val();
                var email = $("#email").val();
                var designation = $("#designation").val();
                var church = $("#church").val();
                var caddress = $("#caddress").val();
                var cemail = $("#cemail").val();
                var cmobile = $("#cmobile").val();
                var pastor_name = $("#pastor_name").val();
                var pastor_email = $("#pastor_email").val();
                var pastor_mobile = $("#pastor_mobile").val();
                var mtype = $("#mtype").val();
                var annual_start_date = $("#annual_start_date").val();
                var life_start_date = $("#life_start_date").val();
                var annual_end_date = $("#annual_end_date").val();
                var cred_nfr_res_per_state = $("#cred_nfr_res_per_state").val();
                var source_of_application = $("#source_of_application").val();
                var status = $("#status").val();
                var r = confirm("Are you sure ? Do you want to Update this record ?\n");
                if (r === true) {
                    $(this).hide();
                    $.ajax({
                        url: 'single_trendsSave.jsp?action=Update&mid=' + mid + '&name=' + name + '&date_of_birth=' + date_of_birth + '&address=' + address + '&street=' + street + '&city=' + city + '&state=' + state + '&phone=' + phone + '&email=' + email + '&church=' + church + '&caddress=' + caddress + '&cemail=' + cemail + '&cmobile=' + cmobile + '&pastor_name=' + pastor_name + '&pastor_email=' + pastor_email + '&pastor_mobile=' + pastor_mobile + '&mtype=' + mtype + '&annual_start_date=' + annual_start_date + '&annual_end_date=' + annual_end_date + '&status=' + status + '&life_start_date=' + life_start_date + '&designation=' + designation + '&mobile2=' + mobile2 + '&mobile3=' + mobile3 + '&pincode=' + pincode + '&address2=' + address2 + '&deceased_date=' + deceased_date + '&source_of_application=' + source_of_application + '&cred_nfr_res_per_state=' + cred_nfr_res_per_state,
                        data: {"action": "Update", "mid": mid},
                        success: function (data) {
                            alert(data.trim());
                            $('#myButton').show();
                            $("#mid").val('');
                            $("#region_name").val('');
                            $("#state_association").val('');
                            $("#area_name").val('');
                            $("#name").val('');
                            $("#date_of_birth").val('');
                            $("#address").val('');
                            $("#address2").val('');
                            $("#street").val('');
                            $("#city").val('');
                            $("#state").val('');
                            $("#pincode").val('');
                            $("#phone").val('');
                            $("#mobile2").val('');
                            $("#mobile3").val('');
                            $("#email").val('');
                            $("#marital_staus").val('');
                            $("#designation").val('');
                            $("#dob").val('');
                            $("#church").val('');
                            $("#caddress").val('');
                            $("#cemail").val('');
                            $("#cmobile").val('');
                            $("#pastor_name").val('');
                            $("#pastor_email").val('');
                            $("#pastor_mobile").val('');
                            $("#pastor_confirmation").val('');
                            $("#mtype").val('');
                            $("#deceased_date").val('');
                            $("#life_start_date").val('');
                            $("#annual_start_date").val('');
                            $("#annual_end_date").val('');
                            $("#wname").val('');
                            $("#hname").val('');
                            $("#wmobile").val('');
                            $("#wemail").val('');
                            $("#wdob").val('');
                            $("#status").val('');
                            $("#camp").val('');
                            $("#credential_addr").val('');
                            $("#physical_form_received").val('');
                            $("#cred_nfr_res_per_state").val('');
                            $("#source_of_application").val('0');
                        }
                    });
                }
            }
            );
        </script>
        <script>
            $(document).on('keyup', '#mid', function (e) {
                var mid = $("#mid").val();
                Signup();
                $("#myContainer").LoadingOverlay("show", {
                    background: "rgba(165, 190, 100, 0.5)"
                });
                $.ajax({
                    url: 'single_trendsEdit.jsp?action=Edit&mid=' + mid,
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        $("#snackbar1").hide();
                        $("#res").show();
                        $('#mid1').val(data.mid);
                        $("#name").val(data.name);
                        $("#date_of_birth").val(data.date_of_birth);
                        $("#address").val(data.address);
                        $("#deceased_date").val(data.deceased_date);
                        $("#address2").val(data.address2);
                        $("#street").val(data.street);
                        $("#state_association").val(data.state_association);
                        $("#area_name").val(data.area_name);
                        $("#region_name").val(data.region_name);
                        $("#pincode").val(data.pincode);
                        $("#wname").val(data.wname);
                        $("#wmobile").val(data.wmobile);
                        $("#wemail").val(data.wemail);
                        $("#phone").val(data.phone);
                        $("#email").val(data.email);
                        $("#mobile2").val(data.mobile2);
                        $("#mobile3").val(data.mobile3);
                        $("#city").val(data.city);
                        $("#state").val(data.state);
                        $("#marital_status").val(data.marital_status);
                        $("#designation").val(data.designation);
                        $("#church").val(data.church);
                        $("#caddress").val(data.caddress);
                        $("#cemail").val(data.cemail);
                        $("#cmobile").val(data.cmobile);
                        $("#pastor_name").val(data.pastor_name);
                        $("#pastor_email").val(data.pastor_email);
                        $("#pastor_mobile").val(data.pastor_mobile);
                        $("#business_name").val(data.business_name);
                        $("#nature_of_job").val(data.nature_of_job);
                        $("#qualification").val(data.qualification);
                        $("#qualification_others").val(data.qualification_others);
                        $("#mtype").val(data.mtype);
                        $("#life_start_date").val(data.life_start_date);
                        $("#annual_start_date").val(data.annual_start_date);
                        $("#annual_end_date").val(data.annual_end_date);
                        $("#cred_nfr_res_per_state").val(data.cred_nfr_res_per_state);
                        $("#source_of_application").val(data.source_of_application);
                        $("#status").val(data.status);
                        $("#camp").val(data.camp);
                        Signup();
                    }
                }).done(function () {
                    $("#myContainer").LoadingOverlay("hide", true);
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
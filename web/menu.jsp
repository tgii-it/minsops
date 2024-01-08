<div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn navbar-link" onclick="closeNav()"> &times;</a> 
    <%
        if (useraccessname.contains("Alex") || useraccessname.contains("Vijai") || useraccessname.contains("Sucharitha") || useraccessname.contains("Sandhana") || useraccessname.contains("Raj") || useraccessname.contains("Anbalagan") || useraccessname.contains("Sam") || useraccessname.contains("Ravi")) {
    %> 
    <a href="membership_reports.jsp" class="list-group-item " >
        <i class="glyphicon glyphicon-briefcase"></i>&nbsp; Membership Master
    </a>    
    <a href="StateWiseReport.jsp" class="list-group-item " >
        <i class="glyphicon glyphicon-list"></i>&nbsp; State wise Members
    </a> 
    <a href="memList.jsp" class="list-group-item " >
        <i class="glyphicon glyphicon-list"></i>&nbsp; Camp wise Members
    </a>   
    <a href="campOfficersAddressList.jsp" class="list-group-item " >
        <i class="glyphicon glyphicon-list"></i>&nbsp; Camp Officers Address
    </a>   
    <a href="deceased.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-list"></i>&nbsp; Deceased List
    </a>
    <a href="CampPerformance.jsp" class="list-group-item " >
        <i class="glyphicon glyphicon-briefcase"></i>&nbsp; Camp Dashboard
    </a> 
    <a href="campInfo.jsp" class="list-group-item " >
        <i class="glyphicon glyphicon-briefcase"></i>&nbsp; Camp Info
    </a>  
    <a href="pgRecords.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
        <i class="glyphicon glyphicon-list"></i>&nbsp; Renewal Payments
    </a>  
    <a href="pgDonations.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
        <i class="glyphicon glyphicon-list"></i>&nbsp; Online Donations
    </a>  
    <a href="CampsMaster.jsp" class="list-group-item " >
        <i class="glyphicon glyphicon-list"></i>&nbsp; Camps Master
    </a>  
    <a href="fogTbl.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-list"></i>&nbsp; List of FoG's
    </a>  
    <a href="memEdit.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-user"></i>&nbsp; Profile View
    </a>
    <a href="accHome.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-briefcase"></i>&nbsp; Accounts Dashboard
    </a>
    <a href="e503records.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-list"></i>&nbsp; e503 History
    </a>
    <a href="eReceiptList.jsp" class="list-group-item" id="Primary_Sidebar-My_Account-Email_History">
        <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Instant Receipt Details
    </a>
    <a href="GmapUsers.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Gmap Users
    </a>
    <a href="GmapUsersSAwise.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Gmap Users Report
    </a>
    <a href="changePasscode.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Reset Password
    </a>
    <a href="logout.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-globe"></i>&nbsp; Logout
    </a>
    <%
    } else {
    %> 
    <a href="changePasscode.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-credit-card"></i>&nbsp; Reset Password
    </a>
    <a href="logout.jsp" class="list-group-item" >
        <i class="glyphicon glyphicon-globe"></i>&nbsp; Logout
    </a>
    <%
        }
    %>
</div>
<nav class="navbar navbar-default navbar-fixed-top">
    <div>   
        <span class="navbar-brand pull-left" onclick="openNav()">&#9776;</span>                
        <a href="membership_reports.jsp"><img alt="The Gideons International" src="./images/GideonsLogo2.png" align="left"  height="50" width="170"  style="padding: 5px;"/></a>
    </div>
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="myNavbar" style="background-color: #01354a;">
            <%
                if (useraccessname.contains("Alex") || useraccessname.contains("Vijai") || useraccessname.contains("Sucharitha") || useraccessname.contains("Sandhana") || useraccessname.contains("Raj") || useraccessname.contains("Anbalagan") || useraccessname.contains("Sam") || useraccessname.contains("Ravi")) {
            %> 
            <ul class="nav navbar-nav navbar-left">
                <li  class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Mem I &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li><a href="memEdit.jsp" ><i class="glyphicon glyphicon-user"></i>&nbsp; View Profile</a></li> 
                        <li><a href="membership_reports.jsp"><i class="glyphicon glyphicon-briefcase" aria-hidden="true"></i> &nbsp; Membership Master Report</a></li>
                        <li><a href="StateWiseReport.jsp"><i class="glyphicon glyphicon-list" aria-hidden="true"></i> &nbsp; State wise Members List</a></li>
                        <li class="divider"></li>    
                        <li class = "dropdown-header" style="font-weight: bold; color: blue; letter-spacing: 2px;">Renewals DB</li>
                        <li><a href="RenewalsDB2023_24.jsp"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp; 2023-24</a></li>
                        <li><a href="CampsRenewed100per2023_24.jsp"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp; 2023_24 - 100% Renewed Camps List</a></li>
                        <li><a href="RenewalsDB2022_23.jsp"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp; 2022-23</a></li>
                        <li><a href="CampsRenewed100per2022_23.jsp"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp; 2022_23 - 100% Renewed Camps List</a></li>
                        <li><a href="RenewalsDB2021_22.jsp"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp; 2021-23</a></li>
                        <li><a href="StateWiseRenewalsReport.jsp"><i class="glyphicon glyphicon-list" aria-hidden="true"></i> &nbsp; State wise Renewals List</a></li>
                        <li class="divider"></li>
                        <li class="dropdown-submenu">
                            <a href="YetToRenew.jsp"><i class="fa fa-list" aria-hidden="true"></i> &nbsp; State wise Yet to Renew List</a>&nbsp; 
                            <ul class="dropdown-menu">
                                <li><a href="gYetToRenew.jsp"><i class="glyphicon glyphicon-user"></i>&nbsp; Gideons List</a></li>
                                <li><a href="aYetToRenew.jsp"><i class="glyphicon glyphicon-user"></i>&nbsp; Auxiliaries List</a></li>
                            </ul>
                        </li>
                        <li class="divider"></li>
                        <li><a href="memList.jsp" ><i class="glyphicon glyphicon-user"></i>&nbsp; Camp wise Members & Officers List</a></li>    
                        <li><a href="campOfficersAddressList.jsp"><i class="glyphicon glyphicon-list" aria-hidden="true"></i> &nbsp; Camp Officers Address List</a></li>
                        <li><a href="DownloadCampOfficersAddressList.jsp?exportToExcel=YES"><i class="fa fa-file-excel-o"></i>&nbsp;&nbsp;&nbsp;Camp Officers Address List MsExcel</a></li>  
                        <li><a href="deceased.jsp" ><i class="glyphicon glyphicon-user"></i>&nbsp; Deceased List</a></li>                                                                           
                    </ul>
                </li>
                <li  class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">Mem II &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">   
                        <li><a href="OpBal2023_24.jsp" ><i class="glyphicon glyphicon-briefcase"></i>&nbsp; Op Bal 2023-24</a></li> 
                        <li><a href="OpBal2022_23.jsp" ><i class="glyphicon glyphicon-briefcase"></i>&nbsp; Op Bal 2022-23</a></li> 
                        <li><a href="OpBal2021_22.jsp" ><i class="glyphicon glyphicon-briefcase"></i>&nbsp; Op Bal 2021-22</a></li> 
                        <li><a href="OpBal2020_21.jsp" ><i class="glyphicon glyphicon-briefcase"></i>&nbsp; Op Bal 2020-21</a></li>    
                        <li><a href="OpBal2019_20.jsp" ><i class="glyphicon glyphicon-briefcase"></i>&nbsp; Op Bal 2019-20</a></li> 
                        <li class="divider"></li>
                        <li><a href="ReInstatedList2023_24.jsp"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp; Reinstated 2023-24</a></li>
                        <li><a href="ReInstatedList2022_23.jsp"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp; Reinstated 2022-23</a></li>
                        <li><a href="ReInstatedList2021_22.jsp"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp; Reinstated 2021-22</a></li>
                        <li><a href="ReInstatedList2020_21.jsp"><i class="fa fa-suitcase" aria-hidden="true"></i> &nbsp; Reinstated 2020-21</a></li>
                        <li class="divider"></li>
                        <li><a href="newMembers2023_24.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; NM 2023-24</a></li>
                        <li><a href="newMembers2022_23.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; NM 2022-23</a></li>
                        <li><a href="newMembers2021_22.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; NM 2021-22</a></li>
                        <li><a href="newMembers2020_21.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; NM 2020-21</a></li> 
                        <li class="divider"></li>
                        <li><a href="eApplnList2023_24.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; DMF 2023_24</a></li>                                                                           
                        <li><a href="eApplnList2022_23.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; DMF 2022_23</a></li>                                                                           
                        <li><a href="eApplnList2021_22.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; DMF 2021_22</a></li>                                                                           
                        <li><a href="eApplnList2020_21.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> &nbsp; DMF 2020_21</a></li>                                                                           
                    </ul>
                </li>
                <li  class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">SD &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li><a href="pwtOrders.jsp" ><i class="glyphicon glyphicon-list"></i>&nbsp; PWT Orders with Language and Colors &nbsp;
                                <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup></a></li>                                                                     
                    </ul>
                </li>
                <li  class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">Cur Yr PRs &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li>
                            <a href="NationalPerformanceReport_currentYr.jsp">
                                National Performance Report
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=1">
                                SA 1 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=1"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=1"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=1"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=1"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=1"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=2">
                                SA 2 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=2"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=2"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=2"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=2"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=2"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=3">
                                SA 3 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=3"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=3"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=3"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=3"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=3"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=4">
                                SA 4 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=4"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=4"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=4"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=4"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=4"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=5">
                                SA 5 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=5"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=5"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=5"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=5"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=5"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=6">
                                SA 6 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=6"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=6"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=6"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=6"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=6"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=7">
                                SA 7 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=7"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=7"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=7"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=7"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=7"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=8">
                                SA 8 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=8"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=8"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=8"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=8"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=8"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=9">
                                SA 9 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=9"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=9"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=9"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=9"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=9"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=11">
                                SA 11 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=11"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=11"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=11"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=11"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=11"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=12">
                                SA 12 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=12"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=12"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=12"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=12"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=12"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=13">
                                SA 13 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=13"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=13"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=13"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=13"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=13"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=14">
                                O S - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=14"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=14"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=14"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=14"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=14"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="RegionPerformanceReport_currentYr.jsp">
                                Region wise Performance Report
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="AreaPerformanceReport_currentYr.jsp">
                                Area wise Performance Report
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="CampPerformanceReport_currentYr.jsp">
                                Camp Performance Report
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- Preious years-->
                <li  class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">Prev Yr PRs &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li>
                            <a href="NationalPerformanceReport_prevYrs.jsp">
                                National 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=1">
                                SA 1 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=2">
                                SA 2 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=3">
                                SA 3 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=4">
                                SA 4 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=5">
                                SA 5 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=6">
                                SA 6 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=7">
                                SA 7 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=8">
                                SA 8 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=9">
                                SA 9 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=10">
                                SA 10 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=11">
                                SA 11 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=12">
                                SA 12 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=13">
                                SA 13 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <!--                        <li class="divider"></li>
                                                <li>
                                                    <a href="RegionPerformanceReport.jsp">
                                                        Region wise PYs 2021_22, 2020_21 &amp; 2019_20
                                                    </a>
                                                </li>
                                                <li class="divider"></li>
                                                <li>
                                                    <a href="AreaPerformanceReport.jsp">
                                                        Area wise PYs 2021_22, 2020_21 &amp; 2019_20
                                                    </a>
                                                </li>-->
                    </ul>
                </li>
            </ul> 
            <ul class="nav navbar-nav navbar-left">
                <li  class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">Officers &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li><a href="nationalOfficers.jsp">National Leaders</a></li>
                        <li><a href="zoneOfficers.jsp">Zone Trustees</a></li>
                        <li><a href="stateOfficers.jsp">State Officers</a></li>
                        <li><a href="programCoordinators.jsp">Program Coordinators</a></li>
                        <li><a href="regionOfficers.jsp">Region Directors</a></li>
                        <li><a href="programLeaders.jsp">Program Leaders</a></li>
                        <li><a href="areaOfficers.jsp">Area Directors</a></li>
                        <li><a href="metroLeaders.jsp">Metro Leaders</a></li>
                        <li><a href="campOfficers.jsp">Camp Officers</a></li>
                        <li><a href="allOfficers.jsp">The Complete List</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">R 1 &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">  
                        <li class="dropdown-submenu">                            
                            <a href="CampsMaster2023_24.jsp"><i class="fa fa-list" aria-hidden="true"></i>&nbsp; Camps Master 2023-24</a>
                            <ul class="dropdown-menu">
                                <li><a href="CampsMaster_elec_2023_24.jsp"><i class="glyphicon glyphicon-list-alt"></i>&nbsp; with Election</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">                            
                            <a href="CampsMaster2022_23.jsp"><i class="fa fa-list" aria-hidden="true"></i>&nbsp; Camps Master 2022-23</a>
                            <ul class="dropdown-menu">
                                <li><a href="CampsMaster_elec_2022_23.jsp"><i class="glyphicon glyphicon-list-alt"></i>&nbsp; with Election</a></li>
                            </ul>
                        </li>
                        <li><a href="CampsMaster2021_22.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Camps Master 2021-22</a></li>
                        <li><a href="CampsMaster2020_21.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Camps Master 2020-21</a></li>                   
                        <li class="divider"></li>  
                        <li><a href="orbitGoals2023_24.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Orbit Goals 2023-24</a></li>
                        <li><a href="orbitGoals2022_23.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Orbit Goals 2022-23</a></li>
                        <li><a href="orbitGoals2021_22.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Orbit Goals 2021-22</a></li>
                        <li><a href="orbitGoals2020_21.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Orbit Goals 2020-21</a></li>                   
                        <li class="divider"></li>  
                        <li><a href="CampPerformance2023_24.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Camps Dashboard 2023_24</a></li>
                        <li><a href="CampPerformance2022_23.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Camps Dashboard 2022_23</a></li>
                        <li><a href="CampPerformance2021_22.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Camps Dashboard 2021_22</a></li>
                        <li><a href="CampPerformance2020_21.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Camps Dashboard 2020_21</a></li>      
                        <li class="divider"></li>  
                        <li><a href="campElectionReport.jsp">Camp Election Report & List &nbsp;
                                <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup></a></li>       
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">R 2 &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu"> 
                        <li><a href="pgRecords.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Online Renewals</a></li>
                        <li><a href="InstantRenewalsList.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Instant Renewals</a></li>
                        <!--<li><a href="#"><i class="glyphicon glyphicon-list"></i>&nbsp; Digital Membership Form Payments</a></li>-->
                        <li><a href="pgDonations.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Online Donations</a></li>   
                        <li><a href="eReceiptList.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Instant Receipt Info</a></li>               
                        <li class="divider"></li>      
                        <li><a href="accHome.jsp"><i class="glyphicon glyphicon-briefcase"></i>&nbsp; Accounts Dashboard</a></li>
                        <li><a href="e503CROrecords.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; CRO Details</a></li>
                        <li><a href="e503CROchildrecords.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; CRO Complete Information &nbsp;
                                <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup></a></li>
                        <li><a href="e503records.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; e503 History</a></li> 
                        <li><a href="eventlist.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; e503 FFR & PAB Events List &nbsp;
                                <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup></a></li> 
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">R 3 &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu"> 
                        <li class = "dropdown-header" style="font-weight: bold; color: blue; letter-spacing: 2px;">GMAP 2.0</li>
                        <li><a href="GmapUsers.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Users List</a></li> 
                        <li><a href="GmapUsersSAwise.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Report</a></li>                      
                        <li class="divider"></li>  
                        <li><a href="GCBPreport.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; GCBP real-time Report</a></li>     

                        <li class="divider"></li>  
                        <li class = "dropdown-header" style="font-weight: bold; color: blue; letter-spacing: 2px;">NATIONAL CONVENTIONS 2023</li>
                        <li><a href="ncstatstateandcampwise2023.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; SA/Camp wise Registrations </a></li>  
                        <li><a href="ncstatistics2023.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; SA wise counts</a></li>  
                        <li><a href="allRecords2023.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; All Records</a></li>    
                        <li><a href="ncPaidOuting.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Paid Outing List</a></li>    
                        <li><a href="ncComplOuting.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Complementary Outing List</a></li>       
                        <li class="divider"></li>  
                        <!--<li><a href="Conventions2020.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Conventions 2020</a></li>  
                        <li><a href="sascrecords.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; State Conventions 2021</a></li>
                        <li><a href="stconvstatistics.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; All State Conventions 2021 -::- Counts</a></li>  
                        <li><a href="stconvstatistics@campwise@sa.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; SA wise Registrations -::- Camp wise Counts</a></li> 
                        <li><a href="stconvstatistics@camplevel.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; All State Conventions 2021 -::- Camp wise Pending &AMP; Reconciled </a></li>  
                        <li><a href="stconvwagrp.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; State Conventions 2021 Registrations</a></li> 
                        <li class="divider"></li> --> 
                        <!--                        <li class = "dropdown-header" style="font-weight: bold; color: blue; letter-spacing: 2px;">STATE CONVENTIONS 2022</li>
                                                <li><a href="stconvwagrp2022.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Registrations &nbsp;
                                                        <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup></a></li>
                                                <li><a href="stconvstatistics2022.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; State Asso wise Counts &nbsp;
                                                        <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup></a></li>
                                                <li><a href="stconvstatistics@campwise@sa2022.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Camp /Area /Region wise Counts &nbsp;
                                                        <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup></a></li>
                                                <li><a href="stconvcontributions2022.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Contributions : CD100 /Heart-fund /Luncheon /Spl Offering &nbsp;
                                                        <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup></a></li>-->

                        <li class = "dropdown-header" style="font-weight: bold; color: blue; letter-spacing: 2px;">STATE CONVENTIONS 2023</li>
                        <li><a href="stconvwagrp2023.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Registrations</a></li>
                        <li><a href="stconvstatistics2023.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; State Asso wise Counts</a></li>
                        <li><a href="stconvstatistics@campwise@sa2023.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Camp /Area /Region wise Counts</a></li>
                        <li><a href="stconvcontributions2023.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Contributions : CD100 /Heart-fund /Luncheon /Spl Offering </a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">&nbsp;<%=useraccessname%>&nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li>
                            <a href="changePasscode.jsp">Reset Password <!--&nbsp;
                                <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup>-->
                            </a>
                        </li>
                        <li><a href="logout.jsp">Log Out</a></li>
                    </ul>
                </li>
            </ul>
            <%
            } else {
            %> 
            <ul class="nav navbar-nav navbar-left">
                <li  class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">Cur Yr PRs &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li>
                            <a href="NationalPerformanceReport_currentYr.jsp">
                                National Performance Report
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=1">
                                SA 1 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=1"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=1"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=1"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=1"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=1"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=2">
                                SA 2 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=2"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=2"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=2"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=2"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=2"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=3">
                                SA 3 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=3"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=3"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=3"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=3"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=3"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=4">
                                SA 4 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=4"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=4"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=4"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=4"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=4"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=5">
                                SA 5 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=5"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=5"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=5"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=5"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=5"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=6">
                                SA 6 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=6"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=6"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=6"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=6"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=6"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=7">
                                SA 7 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=7"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=7"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=7"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=7"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=7"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=8">
                                SA 8 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=8"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=8"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=8"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=8"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=8"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=9">
                                SA 9 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=9"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=9"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=9"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=9"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=9"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=11">
                                SA 11 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=11"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=11"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=11"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=11"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=11"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=12">
                                SA 12 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=12"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=12"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=12"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=12"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=12"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=13">
                                SA 13 - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=13"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=13"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=13"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=13"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=13"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="dropdown-submenu">
                            <a href="StatePerformanceReport_currentYr.jsp?StateAsso=14">
                                O S - Performance Report
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="StatePerformanceReportSF.jsp?StateAsso=14"><i class="fa fa-vcard-o" aria-hidden="true"></i> &nbsp; Scripture Fund Table only</a></li>
                                <li><a href="StatePerformanceReportMem.jsp?StateAsso=14"><i class="fa fa-address-book-o" aria-hidden="true"></i> &nbsp; Memberships Table only</a></li>
                                <li><a href="StatePerformanceReportSD.jsp?StateAsso=14"><i class="fa fa-book" aria-hidden="true"></i> &nbsp; Scripture Distribution Table only</a></li>
                                <li><a href="StatePerformanceReportAux.jsp?StateAsso=14"><i class="fa fa-female" aria-hidden="true"></i> &nbsp; Auxiliary Report only</a></li>
                                <li class="divider"></li>
                                <li><a href="StatePerformanceReport_currentYr.jsp?StateAsso=14"><i class="fa fa-building-o" aria-hidden="true"></i> &nbsp; All above in One Report</a></li>
                            </ul>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="RegionPerformanceReport_currentYr.jsp">
                                Region wise Performance Report
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="AreaPerformanceReport_currentYr.jsp">
                                Area wise Performance Report
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="CampPerformanceReport_currentYr.jsp">
                                Camp Performance Report
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- Preious years-->
                <li  class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">Prev Yr PRs &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li>
                            <a href="NationalPerformanceReport_prevYrs.jsp">
                                National 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=1">
                                SA 1 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=2">
                                SA 2 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=3">
                                SA 3 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=4">
                                SA 4 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=5">
                                SA 5 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=6">
                                SA 6 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=7">
                                SA 7 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=8">
                                SA 8 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=9">
                                SA 9 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=10">
                                SA 10 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=11">
                                SA 11 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=12">
                                SA 12 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                        <li>
                            <a href="StatePerformanceReport_prevYrs.jsp?StateAsso=13">
                                SA 13 2022_22, 2021_22, 2020_21 &amp; 2019_20
                            </a>
                        </li>
                    </ul>
                </li>
                <li  class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">Officers &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li><a href="nationalOfficers.jsp">National Leaders</a></li>
                        <li><a href="zoneOfficers.jsp">Zone Trustees</a></li>
                        <li><a href="stateOfficers.jsp">State Officers</a></li>
                        <li><a href="programCoordinators.jsp">Program Coordinators</a></li>
                        <li><a href="regionOfficers.jsp">Region Directors</a></li>
                        <li><a href="programLeaders.jsp">Program Leaders</a></li>
                        <li><a href="areaOfficers.jsp">Area Directors</a></li>
                        <li><a href="metroLeaders.jsp">Metro Leaders</a></li>
                        <li><a href="campOfficers.jsp">Camp Officers</a></li>
                        <li><a href="allOfficers.jsp">The Complete List</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="background-color: #01354a; color: #ffe114; font-size: 12px; font-weight: bold;">Camp Info &nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">  
                        <li><a href="CampsMaster_elec_2023_24.jsp"><i class="fa fa-list" aria-hidden="true"></i>&nbsp; Camps Master</a></li>
                        <li><a href="CampPerformance2023_24.jsp"><i class="glyphicon glyphicon-list"></i>&nbsp; Camps Dashboard</a></li>  
                        <li><a href="memList.jsp" ><i class="glyphicon glyphicon-list"></i>&nbsp; Camp wise Members & Officers List</a></li> 
                        <li><a href="memEdit.jsp" ><i class="glyphicon glyphicon-user"></i>&nbsp; Member Profile</a></li> 
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="color: #ffe114; font-size: 12px; font-weight: bold;">&nbsp;<%=useraccessname%>&nbsp;
                        <b class="caret"></b>
                    </a>
                    <ul class="dropdown-menu dmenu">
                        <li>
                            <a href="changePasscode.jsp">Reset Password <!--&nbsp;
                                <sup><img src="images/new.png" alt="New feature" style="width: 20px; height: 20px;"/></sup>-->
                            </a>
                        </li>
                        <li><a href="logout.jsp">Log Out</a></li>
                    </ul>
                </li>
            </ul>
            <%
                }
            %>

        </div>
    </div>
</nav>
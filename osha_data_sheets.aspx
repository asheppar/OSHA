<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Profile.master" AutoEventWireup="true" CodeFile="Osha_data_sheets.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link rel="stylesheet" href="<%= Page.ResolveClientUrl("~") %>css/altitudes/default.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h1>OSHA Material Safety Data Sheets</h1>
        <div class="row">
            <div class="col-xs-12">
                 <p>			              
            Click the link below to view a data sheet.
            <br><br>
            <a href="https://get.adobe.com/reader/download/?installer=Reader_DC_2019.010.20098_English_for_Windows&os=Windows%2010&browser_type=KHTML&browser_dist=Chrome&dualoffer=false&mdualoffer=true&cr=true&stype=7523&d=McAfee_Security_Scan_Plus&d=McAfee_Safe_Connect" target="_blank">Click here to download a free Adobe Acrobat Reader</a>
            </p>

                <%-- Data Found --%>
               <div><a href="oshadata.aspx"><< Back To Index</a>

               </div>
                    <div>
             

            <div class="table-responsive">  
                <div class="" style="background-color:#67077b;padding:8px">	
                   <div style="font-weight:bold;color: #fff;">Material Data Sheets beginning with</div>
                    </div>
 	
                 	
                <div style="margin-top:15px;">Sorry, there are no Data Sheets in that category at this time.</div>

            </div>




















                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>


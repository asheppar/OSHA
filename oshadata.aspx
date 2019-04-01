<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Profile.master" AutoEventWireup="true" CodeFile="Oshadata.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link rel="stylesheet" href="<%= Page.ResolveClientUrl("~") %>css/altitudes/default.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h1 style="margin: 2% auto;">OSHA Material Safety Data Sheets</h1>
        <hr />
        <div class="row">
            <div class="col-xs-12">

                <p>
                    Select an index:
                </p>
                <div class="table-responsive center" style="margin: 0 auto;font-size:24pt; text-align: center;">
                    <a href="osha_data_sheets.aspx?index=A">A&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=B">B&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=C">C&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=D">D&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=E">E&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=F">F&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=G">G&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=H">H&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=I">I&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=J">J&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=K">K&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=L">L&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=M">M&nbsp;</a>&nbsp;<br />
                    <a href="osha_data_sheets.aspx?index=N">N&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=O">O&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=P">P&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=Q">Q&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=R">R&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=S">S&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=T">T&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=U">U&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=V">V&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=W">W&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=X">X&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=Y">Y&nbsp;</a>&nbsp;
                    <a href="osha_data_sheets.aspx?index=Z">Z&nbsp;</a>&nbsp;
                </div>
            </div>
        </div>
    </div>
    <div align="center"><a href="osha_data_upload.asp" style="font-size:8pt;text-decoration:none;">Upload OSHA Material Safety Data Sheets</a></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>


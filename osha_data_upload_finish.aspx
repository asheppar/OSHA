<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Profile.master" AutoEventWireup="true" CodeFile="Oshadata.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link rel="stylesheet" href="<%= Page.ResolveClientUrl("~") %>css/altitudes/default.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h1>OSHA Compliance Page</h1>
        <div class="row">
            <div class="col-xs-12">

                <p>
                  Select an index:
                </p>
                <div class="table-responsive">
                    <%--<asp:label runat="server" id="lblMessage" forecolor="Red" visible="false"></asp:label>--%>
                    <table class="table oshaForms">


                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>


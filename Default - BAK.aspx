<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Profile.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Header" runat="Server">
    <link rel="stylesheet" href="<%= Page.ResolveClientUrl("~") %>css/altitudes/default.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container">
        <h1>OSHA Compliance Page</h1>
        <div class="row">
            <div class="col-xs-12">
                <p>
                    Keep our airline safe for employees and passengers. 
                </p>
                <p>
                    Call the Safety Concern Hotline to report unsafe work conditions at 1 800 732 7384 or email either:<br />
                    <a href="mailto=:MesaSafety@mesa-air.com">MesaSafety@mesa-air.com</a>  OR  <a href="mailto=:MesaOsha@mesa-air.com">MesaOsha@mesa-air.com</a>
                </p>
                <p>
                    Your identity will be kept <strong><em>CONFIDENTIAL</em></strong>.
                </p>
                <p>
                    These documents may take some time to load so please be patient and allow sufficient time.
                </p>

                <%--<div class="ts-test">
                            <asp:repeater runat="server" id="ts-testrepeat">
                                <catDescrp>
                                    <div class="header">
                                        <span><%# Eval("catDescrp") %></span>
                                    </div>
                                </catDescrp>
                            </asp:repeater>
                        </div>--%>

                <div class="table-responsive">
                    <asp:label runat="server" id="lblMessage" forecolor="Red" visible="false"></asp:label>
                    <table class="table oshaForms">

                        <asp:repeater id="rptHeader" runat="server">
                                <ItemTemplate>
                        <thead>
                            <tr>
                                <td class="text-left oshaForms"><asp:Label runat="server" id="catName" Text='<%# Container.DataItem.ToString() %>' OnDataBinding="BindChildRpt"></asp:Label></td>
                                <td class="text-left oshaForms">Link Type</td>
                                <td class="text-left oshaForms">Date Posted</td>
                               <%-- <td class="text-left"><%# Eval("DateSubmitted") %></td>--%>
                            </tr>
                        </thead>
                        <tbody>
                        <asp:repeater id="rptBody" runat="server">
                                <ItemTemplate>
                                   <tr class="table-row">
	  					    <td class="text-left">
                                <a href="<%# Eval("fullfilepath") %>"><%# Eval("displayname") %></a>
	  					    </td>
                                <%-- Images --%>
                                       <td class="text-left">
                                            <%# IsUrl(Eval("fullfilepath").ToString()) ?  
                                            "<a href=" + Eval("fullfilepath").ToString() + "></a>"
                                            : 
                                            "<img src="+ GetImageIcon(Eval("fullfilepath").ToString()) + ">" %>
                                            </td>

                             <%-- Posted Date --%>
                                         <td class="text-left"><%# Eval("DateSubmitted") %></td>
	  							    </tr>
                                </ItemTemplate>
                            </asp:repeater>
                            </tbody>
                                </ItemTemplate>
                            </asp:repeater>

                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>


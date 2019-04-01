<%@ Page Title="" Language="C#" MasterPageFile="~/Altitudes/MasterPages/LeftTabs.master" AutoEventWireup="true" CodeFile="View_Documents.aspx.cs" Inherits="Altitudes_View_Documents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Header" Runat="Server">
     <link rel="stylesheet" href="<%= Page.ResolveClientUrl("~") %>css/altitudes/default.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div class="container">
        <h1>Altitudes</h1>
        <h2>
            <%= _docName %>
        </h2>
		<div class="row">
			<div class="col-xs-12">
                <p>
                To view documents click on the title or image of the document you would like to view. To view docs below you must have Microsoft Word and Excel for designated docs.
                </p>
                <p class="red">
                <b>Note: Most documents are protected against editing therefore you may need to select "Read Only" when opening.</b>
                </p>
				<div class="table-responsive">
                    <asp:Label runat="server" ID="lblMessage" ForeColor="Red" Visible="false"></asp:Label>
					<table class="table">
						<thead>
                            <tr>
							<td class="text-left">Subject</td>
							<td class="text-left">Link</td>
							<td class="text-left">Date Posted</td>
                            </tr>
						</thead>
						<tbody>
                            <asp:Repeater runat="server" ID="repList">
                                <ItemTemplate>
                                    <tr class="table-row">
	  								    <td class="text-left"><a href="<%# Eval("uploadedfile") %>"><%# Eval("doctitle") %></a></td>
	  								    <td class="text-left"><img src="images/<%# Eval("image") %>" /></td>
									    <td class="text-left"><%# Eval("dateposted") %></td>
	  							    </tr>
                                </ItemTemplate>
                                <AlternatingItemTemplate>
                                    <tr class="table-row-alternate">
	  								    <td class="text-left"><a href="<%# Eval("uploadedfile") %>"><%# Eval("doctitle") %></a></td>
	  								    <td class="text-left"><img src="images/<%# Eval("image") %>" /></td>
									    <td class="text-left"><%# Eval("dateposted") %></td>
	  							    </tr>
                                </AlternatingItemTemplate>
                            </asp:Repeater>
						</tbody>
					</table>	
				</div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>


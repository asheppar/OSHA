<% AuthenticatePage = true %>
<% showTopMenu = true %>
<% showExternalLinksMenu = true %>
<% showHelpMenu = true %>

<!--#include virtual="/include/aspPageBuilder.asp" -->

<form id="frmMain">
<h2>OSHA Material Safety Data Sheets - File Upload</h2>

<%
startTime = Now
duplicate = False

'Create Upload object
Set Upload = Server.CreateObject("Persits.Upload") 
Upload.SetMaxSize 10000000, True
Count = Upload.Save

For Each Item in Upload.Form
    If Item.Name = "ddlAlpha" Then
        alpha = Item.Value
    ElseIf Item.Name = "txtLabel" Then
        label = Item.Value
    End If
Next

'Check for duplicate SQL record
strSQL = "SELECT filename FROM t_documents WHERE LOWER(label) = '" & Replace(LCase(label), "'", "''") & "' AND alpha = '" & alpha & "'"
Set objRS = RunSQLReturnRS(strSQL, oshaConn)
If Not (objRS.EOF AND objRS.BOF) Then
    varRS = objRS.GetRows
    
    'Delete old file
    If Len(varRS(0,0)) > 0 Then
        duplicate = True
        set objFS = Server.CreateObject("Scripting.FileSystemObject") 
        objFS.DeleteFile("d:/Websites/mesanet.mesa-air.com/docs/OSHA/DataSheets/" & varRS(0,0))
    End If 
End If

          
'Upload selected file
Set File = Upload.Files("txtFileToUpload")
vFilePath = "d:/Websites/mesanet.mesa-air.com/docs/OSHA/DataSheets/" & File.FileName
File.SaveAs vFilePath

'Add/Update database record
If duplicate = True Then
    strSQL = "UPDATE t_documents SET filename = '" & File.FileName & "' WHERE label = '" & label & "'"    
Else
    strSQL = "INSERT INTO t_documents (doctype, alpha, label, filename) VALUES (1, '" & alpha & "', '" & label & "', '" & File.FileName & "')"
End If

Call RunSQL(strSQL, oshaConn)

Response.Write("<div style='font-size:small;color:green;font-weight:bold;'>Upload process completed</div><br>")
Response.Write("<table><tr><td><b>Alpha Category:</b></td><td>" & alpha & "</td></tr>")
Response.Write("<tr><td><b>Label Text:</b></td><td>" & label & "</td></tr>")
Response.Write("<tr><td><b>File Name:</b></td><td>" & File.FileName & "</td></tr>")   
Response.Write("<tr><td><b>Processing Time:</b></td><td>" & DateDiff("s", startTime, Now) & " seconds</td></tr>")   
Response.Write("<tr><td>&nbsp;</td><td>&nbsp;</td></tr>")  
Response.Write("<tr><td colspan=2 align=center><a href='http://mesanet.mesa-air.com/docs/OSHA/DataSheets/" & File.FileName & "' target='_blank'>Document Test Link</a></td></tr>")  
Response.Write("<tr><td>&nbsp;</td><td>&nbsp;</td></tr>")  
Response.Write("<tr><td colspan=2 align=center><a href='osha_data_upload.asp'>Upload Another Document</a></td></tr>")
Response.Write("<tr><td>&nbsp;</td><td>&nbsp;</td></tr>") 
Response.Write("<tr><td colspan=2 align=center><a href='oshadata.asp'>OSHA Material Safety Data Sheets</a></td></tr></table>")

%>

</form>
<!--#include virtual="/include/aspPageBuilderFooter.asp" -->
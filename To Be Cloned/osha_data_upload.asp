<% AuthenticatePage = true %>
<% showTopMenu = true %>
<% showExternalLinksMenu = true %>
<% showHelpMenu = true %>

<!--#include virtual="/include/aspPageBuilder.asp" -->

<%
vTitle = Session("Title")
If InStr(LCase(vTitle), "web") > 0 _
    Or InStr(LCase(vTitle), "software development") > 0 _ 
    Or InStr(LCase(vTitle), "maint safety specialist") > 0  _
    Or InStr(LCase(vTitle), "director, security & process") > 0  _
    Or InStr(LCase(vTitle), "safety") > 0  _
      Or InStr(LCase(vTitle), "intern") > 0  _
    Or InStr(LCase(vTitle), "dir ops security and emer resp") > 0 Then
	'''Continue
else
    Response.Write("<h3>Access Denied</h3>")
    Response.End()
End If
%>

<script language="javascript">
function validateForm()
{   
    if (document.getElementById('ddlAlpha').value == '')
    {
        alert('Alpha Category is required!');
        return false;
    }
    else if (document.getElementById('txtLabel').value == '')
    {
        alert('Label text is required!');
        return false;
    }
    else if (document.getElementById('txtFileToUpload').value == '')
    {
        alert('File to Upload is required!');
        return false;
    }
    else if (document.getElementById('txtFileToUpload').value.indexOf('.pdf') == -1 && 
            document.getElementById('txtFileToUpload').value.indexOf('.htm') == -1 && 
            document.getElementById('txtFileToUpload').value.indexOf('.doc') == -1 && 
            document.getElementById('txtFileToUpload').value.indexOf('.jpg') == -1 && 
            document.getElementById('txtFileToUpload').value.indexOf('.txt') == -1)
    {
        alert('File to Upload must be in .pdf, .doc, .txt, .htm, or .jpg format!');
        return false;
    }
    
    document.getElementById('cmdSubmit').disabled = true;
    
    return true;
}
</script>

<form id="frmMain" action="osha_data_upload_finish.asp" method="post" onsubmit="return validateForm();" enctype="multipart/form-data">
<h2>OSHA Material Safety Data Sheets - File Upload</h2>
<table width="95%" border="0" cellspacing="3" cellpadding="1" class="OSHA">    
	<tr>
        <td colspan="2">
            <b style="font-size:small;">***READ BEFORE USING***</b>
            <br /><br />
            This application is used by the Safety Department to add or replace OSHA Material Safety Data Sheets.
            <br /><br />
            <b>Instructions</b>
            <ol style="margin-top:2px;">
                <li style="margin-left:-10px;margin-bottom:2px;">Select the Alpha Category character the data sheet should display under</li>
                <li style="margin-left:-10px;margin-bottom:2px;">Enter the Label Text you wish to appear in the list of documents</li>
                <li style="margin-left:-10px;margin-bottom:2px;">Select the data sheet that you should have saved somewhere using the "Browse..." button</li>
                <li style="margin-left:-10px;margin-bottom:2px;">Click the "Submit" button to start the process of uploading the document</li>
                <li style="margin-left:-10px;margin-bottom:2px;">Be aware that this process may take up to 30 seconds to complete. <b>DO NOT hit the "Stop" or "Back" buttons</b> while the process is running.</li>
            </ol> 
            The application does check for existing versions of documents based on the Alpha Category & Label Text. If 
            the same alpha/text combination is already in use then the application will upload the new file, delete the 
            old file, and update the database to use the filename of the file you just uploaded. <b><i>In other words, 
            if you want to replace a document with a newer version you will need to use the same label text.</i></b>
            <br /><br />
            If you run into any problems while using this application please contact the Development Team by emailing 
            <a href="mailto:developers@mesa-air.com">developers@mesa-air.com</a>. Please attach the file you are trying 
            to upload as well as a screenshot of the error you're are receiving.
        </td>
    </tr>
	<tr><td colspan="2"><hr /></td></tr>
	<tr>
	    <td style="font-size:small;font-weight:bold;">Alpha Category:</td>
	    <td>
	        <select id="ddlAlpha" name="ddlAlpha">
	            <option value=""></option>
	            <option value="A">A</option>
	            <option value="B">B</option>
	            <option value="C">C</option>
	            <option value="D">D</option>
	            <option value="E">E</option>
	            <option value="F">F</option>
	            <option value="G">G</option>
	            <option value="H">H</option>
	            <option value="I">I</option>
	            <option value="J">J</option>
	            <option value="K">K</option>
	            <option value="L">L</option>
	            <option value="M">M</option>
	            <option value="N">N</option>
	            <option value="O">O</option>
	            <option value="P">P</option>
	            <option value="Q">Q</option>
	            <option value="R">R</option>
	            <option value="S">S</option>
	            <option value="T">T</option>
	            <option value="U">U</option>
	            <option value="V">V</option>
	            <option value="W">W</option>
	            <option value="X">X</option>
	            <option value="Y">Y</option>
	            <option value="Z">Z</option>
	        </select>
	    </td>
	</tr>
	<tr>
	    <td style="font-size:small;font-weight:bold;">Label Text:</td>
	    <td><input type="text" id="txtLabel" name="txtLabel" style="width:350px;" /></td>
	</tr>
	<tr>
        <td width="20%" style="font-size:small;font-weight:bold;">File to Upload:</td>
        <td>
            <input type="file" id="txtFileToUpload" name="txtFileToUpload" style="width:400px;">
            <input type="submit" id="cmdSubmit" name="cmdSubmit" value="Submit">
        </td>        
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td align="left">
            <div style="float:left;"><a href="oshadata.asp"><< Back</a></div>
        </td>
    </tr>    
</table>
</form>
<!--#include virtual="/include/aspPageBuilderFooter.asp" -->
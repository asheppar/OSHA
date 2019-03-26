using System;
using System.Data;
using System.IO;
using System.Text.RegularExpressions;

public partial class _Default : System.Web.UI.Page

{
    MesaWS_Database.wsDatabase wsDatabase;

    protected String _docId = "";
    protected String _docName = "";
    protected String _folder = "http://mesanet.mesa-air.com/docs";
    // protected String _folder = "http://employeeportal.mesa-air.com/osha";
    protected void Page_Load(object sender, EventArgs e)
    {
        DisplayData();
    }
    private void DisplayData()


    {
        wsDatabase = new MesaWS_Database.wsDatabase();
        string connString = wsDatabase.GetConnString("File_Upload");
        //string connString = Shared.GetConnectionString("File_Upload");

        String strSQL = "SELECT docCategory.catDescrp, FilePaths.displayname, FilePaths.fullfilepath from FilePaths inner join docCategory on FilePaths.dept_id = 8 and FilePaths.man_sec_code = docCategory.catCode and len(docCategory.catCode) > 1 order by  docCategory.catDescrp, FilePaths.displayname";

        //_docName = Shared.wsDatabase.ExecuteScalar(connString, strSQL);

        //strSQL = String.Format("Select docID,doctype,doctitle,uploadedfile,image,CONVERT(VARCHAR(10), dateposted,101) AS dateposted From t_documents Where doctype='{0}' Order By doctitle", _docId);

        DataSet dsData = Shared.wsDatabase.ExecuteQuery(connString, strSQL);

        //Importing Images Here


        repList.DataSource = dsData.Tables[0];
        repList.DataBind();
        if (dsData.Tables[0].Rows.Count == 0)
        {
            lblMessage.Text = "Sorry, there are no " + _docName + "s at this time.";
            lblMessage.Visible = true;
        }



    }

    public bool IsUrl(string filePath)
    {
        Regex httpsUrlRegex = new Regex(@"^http(s)?://([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$");
        Regex urlRegex = new Regex(@"^([\w-]+.)+[\w-]+(/[\w- ./?%&=])?$");

        return httpsUrlRegex.Match(filePath).Success && urlRegex.Match(filePath).Success;
    }
    
    public string GetImageIcon(string filePath)
    {
        var fileName = string.Empty;


        switch (Path.GetExtension(filePath))
        {
            case ".pdf":
                fileName = "pdf.gif";
                break;
            case ".htm":
                fileName = "www.gif";
                break;
            case ".ppt":
            case ".pps":
                fileName = "pps.gif";
                break;
            case ".doc":
                fileName = "word.gif";
                break;
            case ".xls":
                fileName = "excel.gif";
                break;
            default:
                fileName = "www.gif";
                break;
        }

        return "/images/" + fileName;
    }


}
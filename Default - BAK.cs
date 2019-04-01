using System;
using System.Data;
using System.IO;
using System.Collections.Generic;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

public partial class _Default : System.Web.UI.Page

{
    MesaWS_Database.wsDatabase wsDatabase;

    protected String _docId = "";
    protected String _docName = "";
    protected String _folder = "http://mesanet.mesa-air.com/docs";
    private List<String> m_listCategories;
    private DataTable m_dtCategories;

    protected void Page_Load(object sender, EventArgs e)
    {
        DisplayData();
    }
    private void DisplayData()


    {
        wsDatabase = new MesaWS_Database.wsDatabase();
        string connString = wsDatabase.GetConnString("File_Upload");

        String strSQL = "SELECT docCategory.catDescrp, DateSubmitted, FilePaths.displayname, FilePaths.fullfilepath from FilePaths inner join docCategory on FilePaths.dept_id = 8 and FilePaths.man_sec_code = docCategory.catCode and len(docCategory.catCode) > 1 order by  docCategory.catDescrp, FilePaths.displayname";

        DataSet dsData = Shared.wsDatabase.ExecuteQuery(connString, strSQL);
        m_dtCategories = dsData.Tables[0];
        m_listCategories = ReturnCategories(m_dtCategories);

        rptHeader.DataSource = m_listCategories;
        rptHeader.DataBind();
        if (dsData.Tables[0].Rows.Count == 0)
        {
            lblMessage.Text = "Sorry, there are no " + _docName + "s at this time.";
            lblMessage.Visible = true;
        }

    }

    private List<String> ReturnCategories(DataTable dtCats)
    {
        List<String> listCategories = new List<string>();
        String catName = String.Empty;
        String prevCatName = String.Empty;
        foreach (DataRow dr in dtCats.Rows)
        {
            catName = dr["catDescrp"].ToString();
            if (catName != prevCatName)
            {
                listCategories.Add(catName);
            }
            prevCatName = dr["catDescrp"].ToString();
        }

        return listCategories;
    }
    protected void BindChildRpt(object sender, EventArgs e)
    {
        Label lblCatName = (Label)sender;
        RepeaterItem rptItem = (RepeaterItem)lblCatName.Parent;
        Repeater rptChild = (Repeater)rptItem.FindControl("rptBody");        
        DataView dvChild = m_dtCategories.DefaultView;
        dvChild.RowFilter = "catDescrp = '" + lblCatName.Text + "'";
        rptChild.DataSource = dvChild;
        rptChild.DataBind();
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
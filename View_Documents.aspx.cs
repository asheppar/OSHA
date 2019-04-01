using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Altitudes_View_Documents : System.Web.UI.Page
{
    protected String _docId = "";
    protected String _docName = "";
    //protected String _folder = "http://mesanet.mesa-air.com/altitudes/docs";
    protected String _folder = "http://employeeportal.mesa-air.com/altitudes/docs";
    protected String _currentBid = "";
    protected String _previousBid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            _docId = Request.QueryString["id"].ToString();
            DisplayData();
        }
        else
            Response.Redirect("Default.aspx", true);

    }
    private void DisplayData()
    {
        string connString = Shared.GetConnectionString();

        String strSQL = "Select doctype From t_doctypes Where docID='" + _docId + "' ";
        _docName = Shared.wsDatabase.ExecuteScalar(connString, strSQL);

        strSQL = String.Format("Select docID,doctype,doctitle,uploadedfile,image,CONVERT(VARCHAR(10), dateposted,101) AS dateposted From t_documents Where doctype='{0}' Order By doctitle", _docId);

        DataSet dsData = Shared.wsDatabase.ExecuteQuery(connString, strSQL);
        foreach(DataRow drTemp in dsData.Tables[0].Rows)
        {
            if (drTemp["docID"].ToString() == "426")
            {
                //drTemp["uploadedfile"] = String.Format("http://mesanet.mesa-air.com/altitudes/{0}", drTemp["uploadedfile"].ToString());
                drTemp["uploadedfile"] = String.Format("http://employeeportal.mesa-air.com/altitudes/{0}", drTemp["uploadedfile"].ToString());
            }
            else if (!drTemp["uploadedfile"].ToString().Contains("://"))
            {
                //drTemp["uploadedfile"] = String.Format("http://mesanet.mesa-air.com/altitudes/docs/{0}", drTemp["uploadedfile"].ToString());
                drTemp["uploadedfile"] = String.Format("http://employeeportal.mesa-air.com/altitudes/docs/{0}", drTemp["uploadedfile"].ToString());
            }
        }
        repList.DataSource = dsData.Tables[0];
        repList.DataBind();
        if (dsData.Tables[0].Rows.Count == 0)
        {
            lblMessage.Text = "Sorry, there are no " + _docName + "s at this time.";
            lblMessage.Visible = true;
        }

    }
}
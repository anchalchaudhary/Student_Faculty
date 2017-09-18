using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ReferAFriend;

public partial class FacultyRegistrations : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LogIn"] == null)
            Response.Redirect("Login.aspx");
        if (!IsPostBack)
            BindData();
    }
    protected void BindData()
    {
            string CS = ConfigurationManager.ConnectionStrings["ReferAFriendCS"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM tblFaculty where Accepted=0"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    GridViewData.DataSource = cmd.ExecuteReader();
                    GridViewData.DataBind();
                }
            }
    }
    protected void GridViewData_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int flag = 0;
        int facultyID = Convert.ToInt32(e.CommandArgument);
        string CS = ConfigurationManager.ConnectionStrings["ReferAFriendCS"].ConnectionString;
        string name = "", email = "";
        
        if (e.CommandName == "Accept")
        {
            //int facultyID = Convert.ToInt32(e.CommandArgument);
            //GridViewRow row = GridViewData.Rows[facultyID];
            //string CS = ConfigurationManager.ConnectionStrings["ReferAFriendCS"].ConnectionString;
            using (SqlConnection connect = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("update tblFaculty set Accepted=@Accepted where ID='"+facultyID+"'"))
                {
                    cmd.Connection = connect;
                    cmd.Parameters.AddWithValue("@Accepted", 1);
                    connect.Open();
                    cmd.ExecuteNonQuery();

                    flag = 1;
                }
            }
        }
        if (e.CommandName == "Reject")
        {
            using (SqlConnection connect = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("update tblFaculty set Accepted=@Accepted where ID='" + facultyID + "'"))
                {
                    cmd.Connection = connect;
                    cmd.Parameters.AddWithValue("@Accepted", 0);
                    connect.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
        if (flag == 1)
        {
            string month_year = DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString();
            string RefereeID = "RS"+ month_year+ facultyID;

            using (SqlConnection connect = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Name FROM tblFaculty where ID='" + facultyID + "'"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    name = cmd.ExecuteScalar().ToString();
                    connect.Close();
                }
                using (SqlCommand cmd = new SqlCommand("SELECT Email FROM tblFaculty where ID='" + facultyID + "'"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    email = cmd.ExecuteScalar().ToString();
                }
            }
            string subject = "Acknowledgement";
            string body = "Hello, " + name + ". You're registration has been approved. Your Referee ID is " + RefereeID + ". Thankyou.";
            string message = "Referee ID for "+ name +" is " + RefereeID + ". Mail has been sent to the referee.";

            Mail.Send_Mail(email, body, subject);

            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + message + "')", true);
            Response.Redirect("FacultyRegistrations.aspx");
        }
    }
}
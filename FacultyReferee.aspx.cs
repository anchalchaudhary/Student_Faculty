using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using ReferAFriend;

public partial class FacultyReferee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["ReferAFriendCS"].ConnectionString;
        if (!IsPostBack)
        {
            using (SqlConnection connect = new SqlConnection(CS)) //binds banks to the Drop down list
            {
                using (SqlCommand cmd = new SqlCommand("Select * from tblBanks"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    ddlBank.DataSource = cmd.ExecuteReader();
                    ddlBank.DataTextField = "BankName";
                    ddlBank.DataValueField = "id";
                    ddlBank.DataBind();
                    
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string CS = ConfigurationManager.ConnectionStrings["ReferAFriendCS"].ConnectionString;
        int emailCount = 0, BankID=0;
        using (SqlConnection connect = new SqlConnection(CS)) // Checks if Email already exists
        {
            using (SqlCommand cmd = new SqlCommand("Select count(*) from tblFaculty where Email='" + tbxEmail.Text.Trim() + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                emailCount = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            }
        }
        if (emailCount != 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('This Email is already added.')", true);
            return;
        }

        using (SqlConnection connect = new SqlConnection(CS))   //To find the Chosen Bank ID.
        {
            using (SqlCommand cmd = new SqlCommand("Select id from tblBanks where BankName='" + ddlBank.SelectedItem.Text + "'"))
            {
                cmd.Connection = connect;
                connect.Open();
                BankID = Convert.ToInt32(cmd.ExecuteScalar());
            }
        }

        Faculty objFaculty = new Faculty();

        objFaculty.Name = tbxName.Text.Trim();
        objFaculty.Email = tbxEmail.Text.Trim();
        objFaculty.Mobile = tbxMobile.Text.Trim();
        objFaculty.Organization = tbxOrganization.Text.Trim().ToString();
        objFaculty.Designation = tbxDesignation.Text.Trim().ToString();
        objFaculty.BankID = BankID.ToString();
        objFaculty.AccountType = rblAccountType.SelectedValue;
        objFaculty.AccountNo = tbxAccountNo.Text.Trim();
        objFaculty.AccountHolderName = tbxAccountHolder.Text.Trim();
        objFaculty.IFSC = tbxIfsc.Text.Trim();

        objFaculty.FacultyRefereeRegistration(objFaculty);

        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('You've been registered. You will receive your Referee ID on approval.')", true);

    }
}
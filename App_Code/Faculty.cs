using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Faculty
/// </summary>

namespace ReferAFriend
{
    public class Faculty
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Organization { get; set; }
        public string Designation { get; set; }
        public string BankID { get; set; }
        public string AccountType { get; set; }
        public string AccountNo { get; set; }
        public string AccountHolderName { get; set; }
        public string IFSC { get; set; }


        #region Faculty as a Referee Registration function
        public void FacultyRefereeRegistration(Faculty objFaculty)
        {
            string CS = ConfigurationManager.ConnectionStrings["ReferAFriendCS"].ConnectionString;

            using (SqlConnection connect = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("insert into tblFaculty (Name, Email, Mobile, Organization, Designation, BankID, AccountType, AccountNo, AccountHolderName, IFSC) values(@Name, @Email, @Mobile, @Organization, @Designation, @BankID, @AccountType, @AccountNo, @AccountHolderName, @IFSC)"))
                {
                    cmd.Connection = connect;
                    connect.Open();
                    cmd.Parameters.AddWithValue("@Name", objFaculty.Name);
                    cmd.Parameters.AddWithValue("@Email", objFaculty.Email);
                    cmd.Parameters.AddWithValue("@Mobile", objFaculty.Mobile);
                    cmd.Parameters.AddWithValue("@Organization", objFaculty.Organization);
                    cmd.Parameters.AddWithValue("@Designation", objFaculty.Designation);
                    cmd.Parameters.AddWithValue("@BankID", objFaculty.BankID);
                    cmd.Parameters.AddWithValue("@AccountType", objFaculty.AccountType);
                    cmd.Parameters.AddWithValue("@AccountNo", objFaculty.AccountNo);
                    cmd.Parameters.AddWithValue("@AccountHolderName", objFaculty.AccountHolderName);
                    cmd.Parameters.AddWithValue("@IFSC", objFaculty.IFSC);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        #endregion
    }
}
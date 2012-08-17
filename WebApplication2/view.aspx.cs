using System;
using System.Collections;
using System.Web;
using System.Data.SqlClient;
using CaisisFU.conn;
using System.Data;
using System.Web.Configuration;

namespace WebApplication2
{
    public partial class view : System.Web.UI.Page
    {
        public int id = 0;
        public string ptmrn = "";
        public string date="";
        protected void Page_Load(object sender, EventArgs e)
        {
            string sid = Request["sid"];

            DataTable dataTable = new DataTable();
            Conn conn1 = new Conn();
            SqlConnection myConnection = conn1.GetConnection(conn1.GetConnString());
            SqlCommand command = myConnection.CreateCommand();
            myConnection.Open();
            command.CommandText = "select * from surveyitems where surveyid = " + sid;
            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dataTable);
            da.Dispose();
            command.CommandText = "select patients.patientid,ptmrn,surveys.updatedtime from surveys,patients where surveys.patientid=patients.patientid and surveyid = " + sid;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                id=reader.GetInt32(0);
                ptmrn = reader.GetString(1);
                date = reader.GetDateTime(2).ToString().Substring(0,10);
            }
            reader.Close();
            myConnection.Close();
            
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
        }
    }
}

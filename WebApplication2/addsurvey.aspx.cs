using System;
using System.Collections;
using System.Web;
using System.Data.SqlClient;
using CaisisFU.conn;
using System.Data;
using System.Web.Configuration;

namespace WebApplication2
{
    public partial class AddSurvey : System.Web.UI.Page
    {
        public string id = "";
        public string name = "";
        public string email = "";
        public string surveyname = "";
        public string code = "";
        public string url = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request["id"];
            surveyname = Request["surveyname"];
            Conn conn1 = new Conn();
            SqlConnection myConnection = conn1.GetConnection(conn1.GetConnString());
            SqlCommand command = myConnection.CreateCommand();
            myConnection.Open();
            command.CommandText = "select * from patients where patientid = "+id;
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                name = reader.GetString(2) + " " + reader.GetString(3) + " " + reader.GetString(5);
                email = reader.GetString(19);
            }
            reader.Close();
            command.Connection.Close();
            code = GenerateAccessCode();
            url = WebConfigurationManager.AppSettings["SurveyorPath"]+"?id="+code;
            InsertSurvey(id, surveyname, code);
        }
        protected void InsertSurvey(string id, string surveyname, string code)
        {
            string now = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string today = DateTime.Now.Date.ToString("yyyy-MM-dd HH:mm:ss");
            Conn conn1 = new Conn();
            SqlConnection myConnection = conn1.GetConnection(conn1.GetConnString());
            SqlCommand command = myConnection.CreateCommand();
            myConnection.Open();
            command.CommandText = "insert into actions (patientid, actiondate, actionitem, enteredby, enteredtime) values (" + id + ",'" + now+"','"+"EmailSent','admin','"+now+"')";
            command.ExecuteNonQuery();
            command.CommandText = "insert into surveys (patientid, surveydate, surveytype, enteredby,enteredtime, surveyaccesscode) values (" + id + ",'" + today + "','" + surveyname + "','admin','" + now + "','" + code+"')";
            command.ExecuteNonQuery();
            command.CommandText = "update patients set ptcontactstatus='EmailSent' where patientid="+id;
            command.ExecuteNonQuery();
            myConnection.Close();

        }
        private string GenerateAccessCode()
        {
            string s = "";
            string chars = "abcdefghijklmnopqrstuvwxyz0123456789";
            Random rnd = new Random();
            for (int i = 0; i < 10; i++)
                s += chars[(int)(rnd.NextDouble() * 36)];
            return s;
        }
    }

}

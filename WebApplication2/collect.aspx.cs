using System;
using System.Data.SqlClient;
using CaisisFU.conn;
using System.Data;
using System.Web.Configuration;
using System.Net;

namespace WebApplication2
{
    public partial class collect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable table = new DataTable();
            table.Columns.Add("ptmrn", typeof(string));
            table.Columns.Add("date", typeof(string));
            table.Columns.Add("type", typeof(string));
            table.Columns.Add("accesscode", typeof(string));
            table.Columns.Add("status", typeof(string));
            table.Columns.Add("collect", typeof(string));
            Conn conn1 = new Conn();
            SqlConnection myConnection = conn1.GetConnection(conn1.GetConnString());
            SqlCommand command = myConnection.CreateCommand();
            myConnection.Open();
            command.CommandText = "select ptmrn,surveydate,surveytype,surveyaccesscode from surveys,patients where surveys.updatedtime is null and surveys.patientid=patients.patientid";
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string code=reader.GetString(3);
                string status = GetSurveyStatus(code);
                string collect = "";
                if (!status.StartsWith("Not"))
                    collect="<a href=\"fetch.aspx?code="+code+"\">Fetch from Surveyor</a>";
                
                table.Rows.Add(reader.GetString(0),reader.GetDateTime(1).ToString().Substring(0, 10), reader.GetString(2), code,status,collect);
            }
            reader.Close();
            myConnection.Close();
            Repeater1.DataSource = table;
            Repeater1.DataBind();
        }
        protected string GetSurveyStatus(string AccessCode)
        {
            string url = url = WebConfigurationManager.AppSettings["JsonPath"] + "to_json/" + AccessCode; 
            WebClient client = new WebClient();
            string json1 = client.DownloadString(url);
            if (json1.Equals("[]"))
            {
                return "Not Started";
            }
            else
            {
                return "Completed";
                //For some reason, (Hashtable)JSON.JsonDecode(json1) yields an empty object, no matter what the contents of json1 are. 
                //I didn't have time to figure out why, but it is vital to making the distinction between a "started yet incomplete" and "completed" survey

                //Hashtable ht = (Hashtable)JSON.JsonDecode(json1);
                //if (String.IsNullOrEmpty(ht["completed_at"].ToString()))
                //    return "Not Completed";
                //else
                //    return "Completed";
            }
        }
       
    }
}

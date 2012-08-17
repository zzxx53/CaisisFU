using System;
using System.Collections;
using System.Data.SqlClient;
using CaisisFU.conn;
using System.Data;
using System.Web.Configuration;
using Procurios.Public;
using System.Net;

namespace WebApplication2
{
    public partial class fetch : System.Web.UI.Page
    {
        public string result;
        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request["code"];
            int surveyid = 0;
            int id = 0;
            Conn conn1 = new Conn();
            SqlConnection myConnection = conn1.GetConnection(conn1.GetConnString());
            SqlCommand command = myConnection.CreateCommand();
            myConnection.Open();
            command.CommandText = "select surveyid,patientid from surveys where surveyaccesscode = '"+code+"'";
            SqlDataReader reader = command.ExecuteReader();
            if (reader.Read())
            {
                surveyid = reader.GetInt32(0);
                id = reader.GetInt32(1);
            }
            reader.Close();

            string url = url = WebConfigurationManager.AppSettings["JsonPath"] + "export/" + code;
            WebClient client = new WebClient();
            string json1 = client.DownloadString(url);
            if (json1.Equals("{}")||json1.StartsWith("<!D"))
                result = "Access Code Doesn't Exist";
            else
            {
                ArrayList arr = (ArrayList)JSON.JsonDecode(json1);
                InsertSurveyItems(arr, command, surveyid);
                string now = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                string today = DateTime.Now.Date.ToString("yyyy-MM-dd HH:mm:ss");
                command.CommandText = "update surveys set updatedtime='"+now+"',updatedby='admin(survey)' where surveyaccesscode='"+code+"'";
                command.ExecuteNonQuery();
                command.CommandText = "insert into actions (patientid, actiondate, actionitem, actionnotes, enteredby, enteredtime) values (" + id + ",'" + today + "','" + "DataReceived','Survey Completed','admin','" + now + "')";
                command.ExecuteNonQuery();
                command.CommandText = "insert into actions (patientid, actiondate, actionitem, enteredby, enteredtime) values (" + id + ",'" + today + "','" + "DataEntered','admin(survey)','" + now + "')";
                command.ExecuteNonQuery();
                command.CommandText = "update patients set ptcontactstatus='Current' where patientid=" + id;
                command.ExecuteNonQuery();
                result = "Survey "+code+" written to database";
            }
            myConnection.Close();

        }
        protected void InsertSurveyItems(ArrayList arr, SqlCommand command, int surveyid)
        {
            string now = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string commandText = "insert into surveyitems (surveyid,surveyitemnum,surveyitem,surveyitemresult,enteredby,enteredtime) values (" + surveyid + ", @aid, @qtext, @atext,'admin(survey)','"+now+"')";
            command.CommandText = commandText;
            command.Parameters.Add("@aid", SqlDbType.Text);
            command.Parameters.Add("@qtext", SqlDbType.Text);
            command.Parameters.Add("@atext", SqlDbType.Text);
            for (int i = 0; i < arr.Count; i++)
            {
                Hashtable ht = (Hashtable)arr[i];
                command.Parameters["@aid"].Value = ht["qid"]+"-"+ht["aid"];
                command.Parameters["@qtext"].Value = ht["qtext"];
                command.Parameters["@atext"].Value = ht["atext"];
                command.ExecuteNonQuery();
            }

        }
    }
}

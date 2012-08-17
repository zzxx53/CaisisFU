using System;
using System.Collections;
using System.Data.SqlClient;
using CaisisFU.conn;
using System.Data;

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        public string id = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Request["id"];
            Conn conn1 = new Conn();
            SqlConnection myConnection = conn1.GetConnection(conn1.GetConnString());
            SqlCommand command = myConnection.CreateCommand();
            command.CommandText = "select * from actions where patientid = "+id;
            myConnection.Open();
            SqlDataAdapter da = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            da.Fill(dataTable);


            command.CommandText = "select * from surveys where patientid = " + id;

            DataTable dataTable2 = new DataTable();
            dataTable2.Columns.Add("date", typeof(string));
            dataTable2.Columns.Add("surveyname", typeof(string));
            dataTable2.Columns.Add("accesscode", typeof(string));
            dataTable2.Columns.Add("completed", typeof(string));
            dataTable2.Columns.Add("view", typeof(string));
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                string completed="";
                string view="";
                string update = "";
                if (!reader.IsDBNull(14))
                {
                    update = reader.GetDateTime(14).ToString();
                }
                if (String.IsNullOrEmpty(update))
                {
                    completed = "No";
                    view = "<a href=\"collect.aspx\">Check Surveyor</a>";
                }
                else
                {
                    completed = "Yes";
                    view = "<a href=\"view.aspx?sid=" + reader.GetInt32(1).ToString() + "\">View Survey</a>";
                }
                dataTable2.Rows.Add(reader.GetDateTime(3).ToString().Substring(0, 10), reader.GetString(4), reader.GetString(17),completed,view);
            }
            reader.Close();

            command.CommandText = "select surveytype from metadatasurveys order by metadatasurveyid";
            reader = command.ExecuteReader();
            ArrayList arr1 = new ArrayList();
            while (reader.Read())
            {
                arr1.Add(reader.GetString(0));
            }
            reader.Close();

            myConnection.Close();
            da.Dispose();
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
            Repeater2.DataSource = dataTable2;
            Repeater2.DataBind();
            Repeater3.DataSource = arr1;
            Repeater3.DataBind();
            

        }
    }
}

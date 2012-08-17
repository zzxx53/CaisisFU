using System;
using System.Collections;
using System.Web;
using System.Data.SqlClient;
using CaisisFU.conn;
using System.Data;

namespace CaisisFU
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dataTable = new DataTable();
            Conn conn1 = new Conn();

            SqlConnection myConnection = conn1.GetConnection(conn1.GetConnString());
            SqlCommand command = myConnection.CreateCommand();
            command.CommandText = "select * from patients order by patientid";
            myConnection.Open();
            SqlDataAdapter da = new SqlDataAdapter(command);
            da.Fill(dataTable);
            
            //SqlDataReader reader = command.ExecuteReader();
            //while (reader.Read())
            //{
            //    arr1.Add(reader.GetString(0));
            //    arr1.Add(reader.GetString(3));
            //}
            //reader.Close();
            myConnection.Close();
            da.Dispose();

            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
            
//            string myInsertQuery = "INSERT INTO Customers (CustomerID, CompanyName) Values('NWIND', 'Northwind Traders')";
//            SqlCommand myCommand = new SqlCommand(myInsertQuery);
//            myCommand.Connection = myConnection;
//            myConnection.Open();
//            myCommand.ExecuteNonQuery();
//            myCommand.Connection.Close();
        }
    }
}

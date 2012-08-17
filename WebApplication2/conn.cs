using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace CaisisFU.conn
{
    public class Conn
    {
        public string GetConnString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString;
        }
        public SqlConnection GetConnection(string connectionString)
        {
            SqlConnection connection = null;
            connection = new SqlConnection(connectionString);
            return connection;
        }

    
    }
}
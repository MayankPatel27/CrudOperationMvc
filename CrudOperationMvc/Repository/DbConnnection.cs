using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace CrudOperationMvc.Repository
{
    public class DbConnnection
    {
        static String connectionStr = "";
        public DbConnnection() {
            connectionStr = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }
        public DataTable GetDataTable(String SPName, SqlParameter[] para)
        {
            using (SqlConnection con = new SqlConnection(connectionStr))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = SPName;
                foreach (SqlParameter par in para)
                {
                    cmd.Parameters.Add(par);
                }
                cmd.Connection = con;
                con.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }
        }
    }
}
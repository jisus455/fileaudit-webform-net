using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace tp2.api.Handlers
{
    public class MySQLHandlers
    {
        public static string GenerarStringBuider()
        {
            MySqlConnectionStringBuilder builder = new MySqlConnectionStringBuilder();
            builder.Server = "localhost";
            builder.Database = "tp2";
            builder.UserID = "user";
            builder.Password = "user";
            return builder.ToString();
        }

        public static string GetJson(string query)
        {
            DataTable dt = GetDataTable(query);
            return JsonConvert.SerializeObject(dt,Newtonsoft.Json.Formatting.Indented);
        }

        public static DataTable GetDataTable(string query)
        {
            DataTable dt = new DataTable();
            string connStr = GenerarStringBuider();
            MySqlConnection conn = new MySqlConnection(connStr);
            conn.Open();
            MySqlDataAdapter adapter = new MySqlDataAdapter(query, conn);
            adapter.Fill(dt);
            conn.Close();
            return dt;
        }

        public static bool Exec(string query) //permite modificar la tabla
        {
            bool result = false;
            string connStr = GenerarStringBuider();
            MySqlConnection conn = new MySqlConnection(connStr);
            MySqlCommand command = new MySqlCommand(query, conn);
            conn.Open();
            try
            {
                command.ExecuteReader();
                result = true;
            }
            catch (System.Exception)
            {
                result = false;
            }
            conn.Close();
            return result;
        }


    }
}

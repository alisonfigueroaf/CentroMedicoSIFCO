using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CentroMedicoSIFCO
{
    public class Conexion
    {

        private static SqlConnection objConexion;
        private static string error;
        public static SqlConnection getConexion()
        {
            if (objConexion != null)
                return objConexion;
            objConexion = new SqlConnection();
            objConexion.ConnectionString = "Data Source=localhost; Initial Catalog= HOSPITALSIFCO; Integrated Security= True";
            try
            {
                objConexion.Open();
                return objConexion;
            }
            catch (Exception e)
            {
                error = e.Message;
                return null;
            }
        }
        public static void closeConexion()
        {
            if (objConexion != null)
                objConexion.Close();
        }
    }
}
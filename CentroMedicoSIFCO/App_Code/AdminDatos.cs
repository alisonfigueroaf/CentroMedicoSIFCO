using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace CentroMedicoSIFCO
{
    public class AdminDatos
    {
        public SqlConnection conexion;
        public string error;

        public AdminDatos()
        {
            this.conexion = Conexion.getConexion();
        }
        public bool AgregarDoctor(Doctor unDoctor)
        {
            bool agregar = false;
            SqlCommand comandoDoctor = new SqlCommand();
            comandoDoctor.Connection = conexion;
            comandoDoctor.CommandText = "INSERT INTO DOCTORHOSPITAL VALUES (@Nombre,@Num_Colegiado,@Especialidad,@Genero,@Fecha_Nacimiento,@Fecha_Ingreso,@Fecha_Salida)";
            comandoDoctor.Parameters.AddWithValue("@Nombre", unDoctor.nombre);
            comandoDoctor.Parameters.AddWithValue("@Num_Colegiado", unDoctor.num_Colegiado);
            comandoDoctor.Parameters.AddWithValue("@Especialidad", unDoctor.especialidad);
            comandoDoctor.Parameters.AddWithValue("@Genero", unDoctor.genero);
            comandoDoctor.Parameters.AddWithValue("@Fecha_Nacimiento", unDoctor.fecha_Nacimiento);
            comandoDoctor.Parameters.AddWithValue("@Fecha_Ingreso", unDoctor.fecha_Ingreso);
            comandoDoctor.Parameters.AddWithValue("@Fecha_Salida", unDoctor.fecha_Salida);
            try
            {
                comandoDoctor.ExecuteNonQuery();
                agregar = true;
            }
            catch (SqlException ex)
            {
                this.error = ex.Message;
            }
            return agregar;
        }
        public List<Doctor> listarDoctores()
        {
            List<Doctor> Pacientes = new List<Doctor>();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandText = "SELECT * FROM DOCTORHOSPITAL";
            SqlDataReader RegistroPaciente = comando.ExecuteReader();
            while (RegistroPaciente.Read())
            {
                Doctor objDoctor = new Doctor();
                objDoctor.id_Doctor = RegistroPaciente.GetInt32(0);
                objDoctor.nombre = RegistroPaciente.GetString(1);
                objDoctor.num_Colegiado = RegistroPaciente.GetInt32(2);
                objDoctor.especialidad = RegistroPaciente.GetString(3);
                objDoctor.genero = RegistroPaciente.GetString(4);
                objDoctor.fecha_Nacimiento = RegistroPaciente.GetDateTime(5);
                objDoctor.fecha_Ingreso = RegistroPaciente.GetDateTime(6);
                objDoctor.fecha_Salida = RegistroPaciente.GetDateTime(7);
                Pacientes.Add(objDoctor);
            }
            RegistroPaciente.Close();
            return Pacientes;
        }
        public bool AgregarPaciente(Paciente unPaciente)
        {
            bool agregar = false;
            SqlCommand comandoPaciente = new SqlCommand();
            comandoPaciente.Connection = conexion;
            comandoPaciente.CommandText = "INSERT INTO FICHAPACIENTE VALUES (@Id_Doctor,@DPI,@Nombre,@Genero,@Fecha_Nacimiento,@Num_Clinica)";
            comandoPaciente.Parameters.AddWithValue("@Id_Doctor", unPaciente.id_Doctor);
            comandoPaciente.Parameters.AddWithValue("@DPI", unPaciente.dpi);
            comandoPaciente.Parameters.AddWithValue("@Nombre", unPaciente.nombre);
            comandoPaciente.Parameters.AddWithValue("@Genero", unPaciente.genero);
            comandoPaciente.Parameters.AddWithValue("@Fecha_Nacimiento", unPaciente.fecha_Nacimiento);
            comandoPaciente.Parameters.AddWithValue("@Num_Clinica", unPaciente.num_clinica);
            try
            {
                comandoPaciente.ExecuteNonQuery();
                agregar = true;
            }
            catch (SqlException ex)
            {
                this.error = ex.Message;
            }
            return agregar;
        }
        public List<Paciente> listarPacientes()
        {
            List<Paciente> Pacientes = new List<Paciente>();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandText = "SELECT * FROM FICHAPACIENTE";
            SqlDataReader RegistroPaciente = comando.ExecuteReader();
            while (RegistroPaciente.Read())
            {
                Paciente objPaciente = new Paciente();
                objPaciente.id_paciente = RegistroPaciente.GetInt32(0);
                objPaciente.id_Doctor = RegistroPaciente.GetInt32(1);
                objPaciente.dpi = RegistroPaciente.GetInt32(2);
                objPaciente.nombre = RegistroPaciente.GetString(3);
                objPaciente.genero = RegistroPaciente.GetString(4);
                objPaciente.fecha_Nacimiento = RegistroPaciente.GetDateTime(5);
                objPaciente.num_clinica = RegistroPaciente.GetInt32(6);
                Pacientes.Add(objPaciente);
            }
            RegistroPaciente.Close();
            return Pacientes;
        }
        public bool AgregarConsulta(Consulta unaConsulta)
        {
            bool agregar = false;
            SqlCommand comandoConsulta = new SqlCommand();
            comandoConsulta.Connection = conexion;
            comandoConsulta.CommandText = "INSERT INTO CONSULTAHOSPITAL VALUES (@Id_Paciente,@Id_Doctor,@Num_Clinica,@Fecha_Ingreso,@Fecha_Salida,@Estado,@Observaciones,@Medicamentos,@ProximaCita,@Fecha_ProximaCita)";
            comandoConsulta.Parameters.AddWithValue("@Id_Paciente", unaConsulta.id_paciente);
            comandoConsulta.Parameters.AddWithValue("@Id_Doctor", unaConsulta.id_Doctor);
            comandoConsulta.Parameters.AddWithValue("@Num_Clinica", unaConsulta.num_clinica);
            comandoConsulta.Parameters.AddWithValue("@Fecha_Ingreso", unaConsulta.fecha_Ingreso);
            comandoConsulta.Parameters.AddWithValue("@Fecha_Salida", unaConsulta.fecha_Salida);
            comandoConsulta.Parameters.AddWithValue("@Estado", unaConsulta.estado);
            comandoConsulta.Parameters.AddWithValue("@Observaciones", unaConsulta.observaciones);
            comandoConsulta.Parameters.AddWithValue("@Medicamentos", unaConsulta.medicamento);
            comandoConsulta.Parameters.AddWithValue("@ProximaCita", unaConsulta.proximacita);
            comandoConsulta.Parameters.AddWithValue("@Fecha_ProximaCita", unaConsulta.fecha_proximacita);
            try
            {
                comandoConsulta.ExecuteNonQuery();
                agregar = true;
            }
            catch (SqlException ex)
            {
                this.error = ex.Message;
            }
            return agregar;
        }
        public List<Consulta> listarConsultas()
        {
            List<Consulta> Consultas = new List<Consulta>();
            SqlCommand comando = new SqlCommand();
            comando.Connection = conexion;
            comando.CommandText = "SELECT * FROM CONSULTAHOSPITAL";
            SqlDataReader RegistroConsultas = comando.ExecuteReader();
            while (RegistroConsultas.Read())
            {
                Consulta objConsultas = new Consulta();
                objConsultas.id_consulta = RegistroConsultas.GetInt32(0);
                objConsultas.id_paciente = RegistroConsultas.GetInt32(1);
                objConsultas.id_Doctor = RegistroConsultas.GetInt32(2);
                objConsultas.num_clinica = RegistroConsultas.GetInt32(3);
                objConsultas.fecha_Ingreso = RegistroConsultas.GetDateTime(4);
                objConsultas.fecha_Salida = RegistroConsultas.GetDateTime(5);
                objConsultas.estado = RegistroConsultas.GetString(6);
                objConsultas.observaciones = RegistroConsultas.GetString(7);
                objConsultas.medicamento = RegistroConsultas.GetString(7);
                objConsultas.proximacita = RegistroConsultas.GetInt32(7);
                objConsultas.fecha_proximacita = RegistroConsultas.GetDateTime(7);
                Consultas.Add(objConsultas);
            }
            RegistroConsultas.Close();
            return Consultas;
        }
    }
}
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

    public partial class HospitalSIFCO : System.Web.UI.Page
    {
        //AdminDatos objAdminDatos = new AdminDatos();
        protected void Page_Load(object sender, EventArgs e)
        {
         
        }
       
        protected void btnADoctor_Click(object sender, EventArgs e)
        {
            //Page.Validate();
            //Doctor unDoctor = new Doctor();
            //if (Page.IsValid)
            //    unDoctor.nombre = txtNDoctor.Text;
            //    unDoctor.num_Colegiado = txtNumDoctor.Text;
            //    unDoctor.especialidad = txtEspecialidad.Text;
            //    unDoctor.genero = ddlGDoctor.Text;
            //    unDoctor.fecha_Nacimiento = txtNacimiento.Text;
            //    unDoctor.fecha_Ingreso = txtDIngreso.Text;
            //    unDoctor.fecha_Salida = txtDSalida.Text;
            
            //bool add = objAdminDatos.AgregarDoctor(unDoctor);
        }

        protected void btnMConsulta_Click(object sender, EventArgs e)
        {
            //List<Consulta> Consultas = objAdminDatos.listarConsultas();
            //gvdDoctor.DataSource = Consultas;
            //gvdDoctor.DataBind();
        }

        protected void btnAPaciente_Click(object sender, EventArgs e)
        {
            //Page.Validate();
            //Paciente unPaciente = new Paciente();
            //if (Page.IsValid)
            //unPaciente.id_Doctor = txtIDDPaciente.Text;
            //unPaciente.dpi = txtDPI.Text;
            //unPaciente.nombre = txtNPaciente.Text;
            //unPaciente.genero = ddlGPaciente.Text;
            //unPaciente.fecha_Nacimiento = txtPNacimiento.Text;
            //unPaciente.num_clinica = txtPNumClinica.Text;

            //bool add = objAdminDatos.AgregarPaciente(unPaciente);
        }

        protected void btnMPaciente_Click(object sender, EventArgs e)
        {
            //List<Paciente> Pacientes = objAdminDatos.listarPacientes();
            //gvdDoctor.DataSource = Pacientes;
            //gvdDoctor.DataBind();
        }

        protected void btnAConsulta_Click(object sender, EventArgs e)
        {
            //Page.Validate();
            //Consulta unaConsulta = new Consulta();
            //if (Page.IsValid)
            //    unaConsulta.id_paciente = txtIDCPaciente.Text;
            //unaConsulta.id_Doctor = txtIdCDoctor.Text;
            //unaConsulta.num_clinica = txtCNumClinica.Text;
            //unaConsulta.fecha_Ingreso = txtCIngreso.Text;
            //unaConsulta.fecha_Salida = txtCSalida.Text;
            //unaConsulta.estado = ddlCEstado.Text;
            //unaConsulta.observaciones = txtObservaciones.Text;
            //unaConsulta.medicamento = txtMedicamentos.Text;
            //unaConsulta.proximacita = ddlCita.Text;
            //unaConsulta.fecha_proximacita = txtFechaCita.Text;

            //bool add = objAdminDatos.AgregarConsulta(unaConsulta);
        }

        protected void btnMDoctor_Click(object sender, EventArgs e)
        {

            //List<Doctor> Doctores = objAdminDatos.listarDoctores();
            //gvdDoctor.DataSource = Doctores;
            //gvdDoctor.DataBind();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CentroMedicoSIFCO
{
    public class Consulta
    {
        private int Id_Consulta;
        private int Id_Paciente;
        private int Id_Doctor;
        private int Num_Clinica;
        private DateTime Fecha_Ingreso;
        private DateTime Fecha_Salida;
        private string Estado;
        private string Observaciones;
        private string Medicamentos;
        private int ProximaCita;
        private DateTime Fecha_ProximaCita;

        public Consulta()
        {
        }

        public Consulta(int Id_Paciente, int Id_Doctor, int Num_Clinica, DateTime Fecha_Ingreso, DateTime Fecha_Salida, string Estado, string Observaciones, string Medicamentos, int ProximaCita, DateTime Fecha_ProximaCita)
        {
            this.Id_Paciente = Id_Paciente;
            this.Id_Doctor = Id_Doctor;
            this.Num_Clinica = Num_Clinica;
            this.Fecha_Ingreso = Fecha_Ingreso;
            this.Fecha_Salida = Fecha_Salida;
            this.Estado = Estado;
            this.Observaciones = Observaciones;
            this.Medicamentos = Medicamentos;
            this.ProximaCita = ProximaCita;
            this.Fecha_ProximaCita = Fecha_ProximaCita;
        }
        public int id_consulta
        {
            get { return Id_Consulta; }
            set { Id_Consulta = value; }
        }
        public int id_paciente
        {
            get { return Id_Paciente; }
            set { Id_Paciente = value; }
        }
        public int id_Doctor
        {
            get { return Id_Doctor; }
            set { Id_Doctor = value; }
        }
        public int num_clinica
        {
            get { return Num_Clinica; }
            set { Num_Clinica = value; }
        }
        public DateTime fecha_Ingreso
        {
            get { return Fecha_Ingreso; }
            set { Fecha_Ingreso = value; }
        }
        public DateTime fecha_Salida
        {
            get { return Fecha_Salida; }
            set { Fecha_Salida = value; }
        }
        public string estado
        {
            get { return Estado; }
            set { Estado = value; }
        }
        public string observaciones
        {
            get { return Observaciones; }
            set { Observaciones = value; }
        }
        public string medicamento
        {
            get { return Medicamentos; }
            set { Medicamentos = value; }
        }
        public int proximacita
        {
            get { return ProximaCita; }
            set { ProximaCita = value; }
        }

        public DateTime fecha_proximacita
        {
            get { return Fecha_ProximaCita; }
            set { Fecha_ProximaCita = value; }
        }

    }
}
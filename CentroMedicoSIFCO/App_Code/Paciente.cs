using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CentroMedicoSIFCO
{
    public class Paciente
    {
        private int Id_Paciente;
        private int Id_Doctor;
        private int DPI = 0;
        private string Nombre = "";
        private string Genero = "";
        private DateTime Fecha_Nacimiento;
        private int Num_Clinica;

        public Paciente()
        {
        }

        public Paciente(int Id_Doctor, int DPI, string Nombre, string Genero, DateTime Fecha_Nacimiento, int Num_Clinica)
        {
            this.Id_Doctor = Id_Doctor;
            this.DPI = DPI;
            this.Nombre = Nombre;
            this.Genero = Genero;
            this.Fecha_Nacimiento = Fecha_Nacimiento;
            this.Num_Clinica = Num_Clinica;

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
        public int dpi
        {
            get { return DPI; }
            set { DPI = value; }
        }
        public string nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }

        public string genero
        {
            get { return Genero; }
            set { Genero = value; }
        }
        public DateTime fecha_Nacimiento
        {
            get { return Fecha_Nacimiento; }
            set { Fecha_Nacimiento = value; }
        }
        public int num_clinica
        {
            get { return Num_Clinica; }
            set { Num_Clinica = value; }
        }
    }
}
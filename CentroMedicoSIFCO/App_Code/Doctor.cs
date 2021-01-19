using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CentroMedicoSIFCO
{
    public class Doctor
    {
        private int Id_Doctor;
        private string Nombre = "";
        private int Num_Colegiado = 0;
        private string Especialidad = "";
        private string Genero = "";
        private DateTime Fecha_Nacimiento;
        private DateTime Fecha_Ingreso;
        private DateTime Fecha_Salida;

        public Doctor()
        {
        }

        public Doctor(string Nombre, int Num_Colegiado, string Especialidad, string Genero, DateTime Fecha_Nacimiento, DateTime Fecha_Ingreso, DateTime Fecha_Salida)
        {
            this.Nombre = Nombre;
            this.Num_Colegiado = Num_Colegiado;
            this.Especialidad = Especialidad;
            this.Genero = Genero;
            this.Fecha_Nacimiento = Fecha_Nacimiento;
            this.Fecha_Ingreso = Fecha_Ingreso;
            this.Fecha_Salida = Fecha_Salida;
        }

        public int id_Doctor
        {
            get { return Id_Doctor; }
            set { Id_Doctor = value; }
        }
        public string nombre
        {
            get { return Nombre; }
            set { Nombre = value; }
        }
        public int num_Colegiado
        {
            get { return Num_Colegiado; }
            set { Num_Colegiado = value; }
        }

        public string especialidad
        {
            get { return Especialidad; }
            set { Especialidad = value; }
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
    }
}

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HospitalSIFCO.aspx.cs" Inherits="CentroMedicoSIFCO.HospitalSIFCO" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    </head>
<body style="height: 581px">
     <form id="form1" runat="server"  onsubmit="return validacion()">
     <style type="text/css">
  body {
      font-family: Verdana;
      color: black;
    background-color: white }
  h1 {
    font-family: Verdana;

      color: white;
    background-color: darkblue }
   h2 {
    font-family: Verdana;
      color: darkblue; }
   label {
      font-family: Verdana;
      color: black;
      background-color: white }
         .auto-style1 {
             width: 352px;
             height: 57px;
         }
         .auto-style2 {
             width: 276px;
         }
         .auto-style3 {
             width: 284px;
         }
         .auto-style4 {
             width: 294px;
         }
  </style> 
    
    <h1> 
        <img alt="" class="auto-style1" src="https://bupartech.com/wp-content/uploads/2020/01/sifco1.png" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; CENTRO MÉDICO</h1>
    <h2>Doctores</h2>
         <label dir="auto">&nbsp;&nbsp;&nbsp;&nbsp;Si desea agregar un doctor, complete el formulario. Si únicamente desea visualizar la base de datos, presione &quot;Generar listado&quot;</label>
         <table style="width:95%;">
            <tr>
                <td class="auto-style4">
                    <asp:Label ID="lbNombreD" runat="server" Text="Nombre del Doctor"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtNDoctor" runat="server" Width="864px"></asp:TextBox>
                </td>
              
            </tr>
             <tr>
                <td class="auto-style4">Número de colegiado</td>
                <td>
                    <asp:TextBox ID="txtNumDoctor" runat="server" Width="864px"></asp:TextBox>
                 </td>
              
            </tr>
             <tr>
                <td class="auto-style4">Especialidad</td>
                <td>
                    <asp:TextBox ID="txtEspecialidad" runat="server" Width="864px"></asp:TextBox>
                 </td>
              
            </tr>
             <tr>
                <td class="auto-style4">Género</td>
                <td>
                    <asp:DropDownList ID="ddlGDoctor" runat="server">
                        <asp:ListItem Value="F">Femenino</asp:ListItem>
                        <asp:ListItem Value="M">Masculino</asp:ListItem>
                    </asp:DropDownList>
                 </td>
              
            </tr>
             <tr>
                <td class="auto-style4">Fecha de nacimiento</td>
                <td>
                    <asp:TextBox ID="txtNacimiento" runat="server" Width="864px"></asp:TextBox>
                 </td>
              
            </tr>
             <tr>
                <td class="auto-style4">Fecha de ingreso</td>
                <td>
                    <asp:TextBox ID="txtDIngreso" runat="server" Width="864px"></asp:TextBox>
                 </td>
              
            </tr>
             <tr>
                <td class="auto-style4">Fecha de salida</td>
                <td>
                    <asp:TextBox ID="txtDSalida" runat="server" Width="864px"></asp:TextBox>
                 </td>
              
            </tr>
          
        </table>
         <asp:Button ID="btnADoctor" runat="server" Text="Agregar Doctor" OnClick="btnADoctor_Click" BackColor="#000099" ForeColor="White" />
         <asp:Button ID="btnMDoctor" runat="server" Text="Generar listado" BackColor="#00CC00" OnClick="btnMDoctor_Click" />
         <asp:GridView ID="gvdDoctor" runat="server" BorderStyle="Double">
             </asp:GridView>
    <h2>Pacientes</h2>
          <label dir="auto">&nbsp;&nbsp;&nbsp;Si desea agregar un paciente, complete el formulario. Si únicamente desea visualizar la base de datos, presione &quot;Generar listado&quot;</label>
        <table style="width:95%;">
            <tr>
                <td class="auto-style3">Id de doctor regular</td>
                <td>
                    <asp:TextBox ID="txtIDDPaciente" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td class="auto-style3">DPI</td>
                <td>
                    <asp:TextBox ID="txtDPI" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td class="auto-style3">Nombre del paciente</td>
                <td>
                    <asp:TextBox ID="txtNPaciente" runat="server" Width="864px"></asp:TextBox>
                 </td>
            </tr>
             <tr>
                <td class="auto-style3">Género</td>
                <td>
                    <asp:DropDownList ID="ddlGPaciente" runat="server">
                        <asp:ListItem Value="F">Femenino</asp:ListItem>
                        <asp:ListItem Value="M">Masculino</asp:ListItem>
                    </asp:DropDownList>
                 </td>
            </tr>
             <tr>
                <td class="auto-style3">Fehca de nacimiento</td>
                <td>
                    <asp:TextBox ID="txtPNacimiento" runat="server" Width="864px"></asp:TextBox>
                 </td>
            </tr>
             <tr>
                <td class="auto-style3">Número de clínica</td>
                <td>
                    <asp:TextBox ID="txtPNumClinica" runat="server" Width="864px"></asp:TextBox>
                 </td>
            </tr>
        </table>
          <asp:Button ID="btnAPaciente" runat="server" Text="Agregar Paciente" BackColor="#000099" ForeColor="White" OnClick="btnAPaciente_Click" />
         <asp:Button ID="btnMPaciente" runat="server" Text="Generar Listado" BackColor="#00CC00" OnClick="btnMPaciente_Click" />
          <asp:GridView ID="gvdPaciente" runat="server" BorderStyle="Double">
             </asp:GridView>
    <h2>Consultas</h2>
          <label dir="auto">&nbsp;&nbsp;&nbsp;Si desea agregar una consulta, complete el formulario. Si únicamente desea visualizar la base de datos, presione &quot;Generar listado&quot;</label>
        
     <table style="width:95%;">
         <tr>
                <td class="auto-style2">Id de Paciente</td>
                <td>
                    <asp:TextBox ID="txtIDCPaciente" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td class="auto-style2">Id de Doctor</td>
                <td>
                    <asp:TextBox ID="txtIdCDoctor" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td class="auto-style2">Número de clínica</td>
                <td>
                    <asp:TextBox ID="txtCNumClinica" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td class="auto-style2">Fecha de ingreso</td>
                <td>
                    <asp:TextBox ID="txtCIngreso" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td class="auto-style2">Fecha de salida</td>
                <td>
                    <asp:TextBox ID="txtCSalida" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td class="auto-style2">Estado</td>
                <td>
                    <asp:DropDownList ID="ddlCEstado" runat="server" Height="16px" Width="144px">
                        <asp:ListItem>En progreso</asp:ListItem>
                        <asp:ListItem>Pendiente</asp:ListItem>
                        <asp:ListItem>Finalizada</asp:ListItem>
                        <asp:ListItem>Cancelada</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
          <tr>
                <td class="auto-style2">Observaciones</td>
                <td>
                    <asp:TextBox ID="txtObservaciones" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td class="auto-style2">Medicamentos</td>
                <td>
                    <asp:TextBox ID="txtMedicamentos" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
          <tr>
                <td class="auto-style2">Próxima cita</td>
                <td>
                    <asp:DropDownList ID="ddlCita" runat="server">
                        <asp:ListItem Value="1">Sí</asp:ListItem>
                        <asp:ListItem Value="0">No</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
          <tr>
                <td class="auto-style2">Fecha proxima cita</td>
                <td>
                    <asp:TextBox ID="txtFechaCita" runat="server" Width="864px"></asp:TextBox>
                </td>
            </tr>
    </table>
          <asp:Button ID="btnAConsulta" runat="server" Text="Agregar Consulta" BackColor="#000099" ForeColor="White" OnClick="btnAConsulta_Click" />
         <asp:Button ID="btnMConsulta" runat="server" Text="Generar listado" BackColor="#00CC00" OnClick="btnMConsulta_Click" />
     <asp:GridView ID="gvdConsulta" runat="server">
             </asp:GridView>
         
     </form>
         
</body>
</html>

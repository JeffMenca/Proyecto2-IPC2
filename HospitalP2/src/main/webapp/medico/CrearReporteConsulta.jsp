<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="SQLConnector.DbConnection"%>
<%@page import="Entidades.Informe_Consulta_Medica"%>
<%@page import="Logica.BuscarEnDB1"%>
<%@page import="Entidades.Medico"%>
<%@page import="Entidades.Paciente"%>
<%@page import="Entidades.Examen_Laboratorio"%>
<%@page import="Entidades.Cita_Consulta_Medica"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Logica.HorarioMedico"%>
<%@page import="Logica.BuscarEnDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Generar consulta</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css?5.0">
    </head>
    <body>
        <%@include  file="MenuNavigator2.html" %>
        <form method="GET" action="CrearReporteConsulta.jsp">
            <%
                String codigoMedico = String.valueOf(session.getAttribute("username"));
                int citaConsulta;
                try {
                    citaConsulta = Integer.parseInt(request.getParameter("codigo"));
                } catch (Exception e) {
                    String codigo = String.valueOf(session.getAttribute("CitaConsulta"));
                    citaConsulta = Integer.parseInt(codigo);
                }
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("CitaConsulta", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoCitaConsulta = String.valueOf(session.getAttribute("CitaConsulta"));
                BuscarEnDB1 buscador = new BuscarEnDB1();
                ResultSet resultset = buscador.BuscarCitaConsulta(Integer.parseInt(codigoCitaConsulta));
                String nombrePaciente = "", nombreEspecialidad = "", codigoPaciente = "";
                int codigoConsulta = 1, codigoCita = 1;
                while (resultset.next()) {
                    nombrePaciente = resultset.getString("paciente_nombre");
                    codigoConsulta = resultset.getInt("consulta_medica_codigo");
                    nombreEspecialidad = resultset.getString("especialidad_nombre");
                    codigoPaciente = resultset.getString("paciente_codigo");
                }

            %>
            <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Consulta</h1>
                <br><br><br><br>
                <h1>Crear reporte</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fnombre">Paciente</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="paciente" value="<%= nombrePaciente%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fnombre">Examen</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="paciente" value="<%= nombreEspecialidad%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Fecha</label>
                    </div>
                    <div class="col-77">
                        <label for="fname"><%= LocalDate.now()%></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Hora</label>
                    </div>
                    <div class="col-77">
                        <label for="fname"><%= LocalTime.of(LocalTime.now().getHour(), LocalTime.now().getMinute())%></label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="subject">Descripcion</label>
                    </div>
                    <div class="col-77">
                        <textarea id="subject" name="descripcion" placeholder="Descripcion.." required style="height:150px"></textarea>
                    </div>
                </div>
                <div class="row">
                    <br> 
                    <input type="submit" class="button2" name="buttonSubmit" value="Crear reporte de consulta">
                </div>

            </div>

        </form>

    </body>
    <%

        try {
            if (request.getParameter("buttonSubmit") != null) {

                try {
                    Informe_Consulta_Medica nuevoInforme = new Informe_Consulta_Medica(0, request.getParameter("descripcion"), LocalDate.now(),
                            LocalTime.now(), codigoConsulta, codigoPaciente, codigoMedico);
                    String citaEliminar = String.valueOf(codigoCita);
                    String queryEliminar = "DELETE FROM CITA_CONSULTA_MEDICA WHERE codigo=?";
                    PreparedStatement statement = DbConnection.getConnection().prepareStatement(queryEliminar);
                    statement.setString(1, codigoCitaConsulta);
                    statement.execute();
                    statement.close();
    %> 
    <div class="alert1">
        <span class="closebtn"> 
            <strong>Creado</strong> Se creo la consulta y se genero el reporte
    </div>
    <%
                } catch (Exception e) {
                }
            }
        } catch (Exception e) {
        }


    %>
</html>

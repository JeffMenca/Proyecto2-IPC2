<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="Entidades.Informe_Examen_Laboratorio"%>
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
        <%@include  file="MenuNavigator3.html" %>
        <form method="post" action="../ServletReporteExamen">
            <%
                String codigoLaboratorista = String.valueOf(session.getAttribute("username"));
                int citaExamen;
                try {
                    citaExamen = Integer.parseInt(request.getParameter("codigo"));
                } catch (Exception e) {
                    String codigo = String.valueOf(session.getAttribute("CitaExamen"));
                    citaExamen = Integer.parseInt(codigo);
                }
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("CitaExamen", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoCitaConsulta = String.valueOf(session.getAttribute("CitaExamen"));
                BuscarEnDB1 buscador = new BuscarEnDB1();
                ResultSet resultset = buscador.BuscarCitaExamen(Integer.parseInt(codigoCitaConsulta));
                String nombrePaciente = "", tipo = "", codigoPaciente = "";
                int examenCodigo = 1;
                while (resultset.next()) {
                    examenCodigo = resultset.getInt("codigo_examen");
                    tipo = resultset.getString("tipo");
                    nombrePaciente = resultset.getString("paciente_nombre");
                    codigoPaciente = resultset.getString("paciente_codigo");
                }
                session.setAttribute("ExamenCodigo", examenCodigo);
                session.setAttribute("CodigoPaciente", codigoPaciente);

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
                        <input type="text" id="lname" name="paciente" value="<%= tipo%>" readonly>
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
                    <input type="submit" class="button2" name="buttonSubmit" value="Crear reporte de examen">
                </div>

            </div>

        </form>

    </body>
    <%

        try {
            
        } catch (Exception e) {
        }


    %>
</html>

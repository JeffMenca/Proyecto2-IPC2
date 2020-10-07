<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="Entidades.Orden_Examen"%>
<%@page import="Entidades.Laboratorista"%>
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
        <title>Crear Laboratorista</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css?5.0">
    </head>
    <body>
        <%@include  file="MenuNavigator2.html" %>
        <form method="post" action="../CrearOrden" enctype="multipart/form-data">
            <%
                String codigoMedico = String.valueOf(session.getAttribute("username"));
                String paciente;
                try {
                    paciente = String.valueOf(request.getParameter("codigo"));
                } catch (Exception e) {
                    String codigo = String.valueOf(session.getAttribute("CodigoPaciente"));
                    paciente = String.valueOf(codigo);
                }
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("CodigoPaciente", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoPaciente = String.valueOf(session.getAttribute("CodigoPaciente"));

            %>

            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Orden de examen</h1>
                <br><br><br><br>
                <h1>Crear orden de examen</h1>


                <div class="row">
                    <div class="col-25">
                        <label for="subject">Descripcion</label>
                    </div>
                    <div class="col-77">
                        <textarea id="subject" name="descripcion" placeholder="Descripcion.." required style="height:150px"></textarea>
                    </div>
                </div>

                <div class="row">
                    <div class="col-25">
                        <label for="fname">Examen que realizara</label>
                    </div>
                    <div class="col-77">
                        <select id="country" name="examen">
                            <%                                BuscarEnDB buscador = new BuscarEnDB();
                                ResultSet resultados = buscador.BuscarTodosExamenes();
                                while (resultados.next()) {
                            %><option value="<%= resultados.getInt("codigo")%>"><%= resultados.getString("nombre")%></option><%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <br> 
                    <input type="submit" class="button2" name="generarOrden" value="Generar Orden">
                </div>

            </div>

        </form>

    </body>
    <%        


    %>
</html>

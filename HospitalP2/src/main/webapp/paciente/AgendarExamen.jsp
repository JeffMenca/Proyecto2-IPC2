<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="java.sql.Blob"%>
<%@page import="Entidades.Cita_Examen_Laboratorio"%>
<%@page import="Logica.HorarioLaboratorista"%>
<%@page import="Logica.BuscarEnDB1"%>
<%@page import="java.sql.Date"%>
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
        <title>Agendar examen</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>

        <%@include  file="MenuNavigator.html" %>
        <form method="GET" action="AgendarExamen.jsp">
            <%

                String diaSemana[] = {"Domingo", "Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado"};
                String diaPorEnviar = "";
                try {
                    session.setAttribute("Fecha", request.getParameter("fecha"));
                } catch (Exception e) {
                }

                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("Laboratorista", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoLaboratorista = String.valueOf(session.getAttribute("Laboratorista"));
                BuscarEnDB buscador = new BuscarEnDB();
                BuscarEnDB1 obtenerDias = new BuscarEnDB1();
                ResultSet resultset = buscador.BuscarLaboratorista(codigoLaboratorista);
                ArrayList listaDiasTrabajados = obtenerDias.BuscarDiasTrabajados(codigoLaboratorista);
                String nombre = "", costo = "", nombreExamen = "", consulta = "";
                int codigoExamen = 1, orden = 1;
                while (resultset.next()) {
                    nombre = resultset.getString("nombre");
                    costo = resultset.getString("precio_examen");
                    nombreExamen = resultset.getString("nombre_examen");
                    codigoExamen = resultset.getInt("codigo_examen");
                    orden = resultset.getInt("orden");
                }

            %>
            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Programar cita de consulta</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Laboratorista</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="lastname" value="<%= nombre%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Precio</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcosto" name="lastname" value="<%= costo%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="country">Tipo de examen</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lespecialidad" name="lastname" value="<%= nombreExamen%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fpassword">Dias que trabaja el laboratorista</label>
                    </div>
                    <div class="col-77">
                        <%
                            for (int i = 0; i < listaDiasTrabajados.size(); i++) {
                        %> 
                        <label class="container"><%= listaDiasTrabajados.get(i)%>
                            <input type="checkbox" checked onclick="return false;">
                        </label>
                        <%
                            }
                        %>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Fecha de la cita</label>
                    </div>
                    <div class="col-77">
                        <input  type="date" name="fecha"
                                value="<%= LocalDate.now()%>"
                                min="<%= LocalDate.now()%>" max="2050-12-31">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Verificar disponibilidad de fecha</label>
                    </div>
                    <div class="col-77">
                        <input type="submit" class="button1" value="Verificar dia" name="disponible">
                    </div>
                </div>

            </div>

        </form>

    </body>
    <%
        if (request.getParameter("disponible") != null) {
            session.setAttribute("Fecha", request.getParameter("fecha"));
            response.sendRedirect("ConfirmarAgendarExamen.jsp");
        }

    %>
</html>

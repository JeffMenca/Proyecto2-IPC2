<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

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
        <title>Agendar cita</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <%@include  file="MenuNavigator3.html" %>
        <form method="GET" action="AgendarCita.jsp">
            <%
                String mensaje = request.getParameter("mensaje");

            %>
            <br> <br> <br> <br> <br> <br> <br> 



            <div class="alert1">
                <span class="closebtn"> 
                    <strong>Creado, </strong><%= mensaje%>
            </div>
        </form>

    </body>

</html>

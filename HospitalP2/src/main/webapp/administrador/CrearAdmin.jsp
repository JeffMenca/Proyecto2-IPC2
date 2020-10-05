<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="Entidades.Administrador"%>
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
        <title>Crear paciente</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css?4.0">
    </head>
    <body>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" action="CrearAdmin.jsp">

            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Administrador</h1>
                <a href="VerAdmin.jsp">Ver administradores creados</a>
                <br><br><br><br>
                <h1>Crear Administrador</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fcodigo">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" placeholder="Codigo del admin" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fnombre">Nombre</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="nombre" placeholder="Nombre del admin" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fDPI">DPI</label>
                    </div>
                    <div class="col-77">
                        <input type="number" id="lDPI" name="DPI" placeholder="DPI" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fpassword">Password</label>
                    </div>
                    <div class="col-77">
                        <input type="password" id="lpassword" name="password" placeholder="Password" required>
                    </div>
                </div>

                <div class="row">
                    <br> 
                    <input type="submit" class="button2" value="Ingresar Paciente" >
                </div>

            </div>

        </form>

    </body>
    <%

        try {
            if ((request.getParameter("nombre") != "")) {
                try {
                    Administrador nuevoAdmin = new Administrador(request.getParameter("codigo"), request.getParameter("nombre"),
                            request.getParameter("DPI"), request.getParameter("password"));
    %> 
    <div class="alert1">
        <span class="closebtn"> 
            <strong>Creado</strong> El Admin se creo exitosamente
    </div>
    <%
        } catch (Exception e) {
        }

    } else {
    %> 
    <div class="alert2">
        <span class="closebtn"> 
            <strong>Error</strong> No ingreso bien los datos del Admin
    </div>
    <%
            }

        } catch (Exception e) {
        }


    %>
</html>

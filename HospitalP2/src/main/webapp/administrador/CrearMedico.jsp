<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

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
        <title>Crear Medico</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css?5.0">
    </head>
    <body>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" action="CrearMedico.jsp">

            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Medico</h1>
                <a href="VerMedico.jsp">Ver medicos creados</a>
                <br><br><br><br>
                <h1>Crear Medico</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fcodigo">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" placeholder="Codigo del medico" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fnombre">Nombre</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="nombre" placeholder="Nombre del medico" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fnombre">Numero de colegiado</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcolegiado" name="colegiado" placeholder="Numero de colegiado" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fnombre">Especialidad</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcolegiado" name="especialidad" placeholder="Especialidad" required>
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
                        <label for="ftelefono">Telefono</label>
                    </div>
                    <div class="col-77">
                        <input type="number" id="ltelefono" name="telefono" placeholder="Telefono" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fcorreo">Correo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcorreo" name="correo" placeholder="Correo" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Hora de entrada</label>
                    </div>
                    <div class="col-77">
                        <input type="time" id="appt" value="00:00" name="horaentrada"
                               required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Hora de salida</label>
                    </div>
                    <div class="col-77">
                        <input type="time" id="appt" value="23:00" name="horasalida"
                               required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Fecha de inicio de trabajo</label>
                    </div>
                    <div class="col-77">
                        <input  type="date" name="fecha"
                                value="<%= LocalDate.now()%>"
                                min="1870-01-01" max="<%= LocalDate.now()%>" required>
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
                    <input type="submit" class="button2" value="Ingresar Medico">
                </div>

            </div>

        </form>

    </body>
    <%

        try {
            LocalTime horaEntradaIngresada = LocalTime.parse(request.getParameter("horaentrada"));
            LocalTime horaSalidaIngresada = LocalTime.parse(request.getParameter("horasalida"));
            if ((request.getParameter("nombre") != "") && (request.getParameter("codigo") != "")
                    && (request.getParameter("DPI") != "") && (request.getParameter("telefono") != "")
                    && (request.getParameter("correo") != "") && (request.getParameter("colegiado") != "")
                    && (request.getParameter("password") != "") && (request.getParameter("especialidad") != "")
                    && (horaEntradaIngresada.isBefore(horaSalidaIngresada))) {
                LocalDate fechaIngresada = LocalDate.parse(request.getParameter("fecha"));
                try {
                    Medico nuevoMedico = new Medico(request.getParameter("codigo"), request.getParameter("nombre"), request.getParameter("colegiado"),
                            request.getParameter("DPI"), request.getParameter("telefono"), request.getParameter("especialidad"), request.getParameter("correo"),
                            horaEntradaIngresada, horaSalidaIngresada, fechaIngresada, request.getParameter("password"));
    %> 
    <div class="alert1">
        <span class="closebtn"> 
            <strong>Creado</strong> El medico se creo exitosamente
    </div>
    <%
        } catch (Exception e) {
        }

    } else {
    %> 
    <div class="alert2">
        <span class="closebtn"> 
            <strong>Error</strong> No ingreso bien los datos o las fechas
    </div>
    <%
            }

        } catch (Exception e) {
        }


    %>
</html>

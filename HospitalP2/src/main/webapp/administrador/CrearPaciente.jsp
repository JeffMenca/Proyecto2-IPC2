<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

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
        <form method="GET" action="CrearPaciente.jsp">

            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Paciente</h1>
                <a href="VerPaciente.jsp">Ver pacientes creados</a>
                <br><br><br><br>
                <h1>Ingresar Paciente</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fcodigo">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" placeholder="Codigo del paciente" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fnombre">Nombre</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="nombre" placeholder="Nombre del examen" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fsexo">Sexo</label>
                    </div>
                    <div class="col-77">
                        <select id="country2" name="sexo">
                            <option value="masculino" >Masculino</option>  
                            <option value="femenino" >Femenino</option>
                            <option value="otro" >Otro</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Fecha de nacimiento</label>
                    </div>
                    <div class="col-77">
                        <input  type="date" name="fecha"
                                value="<%= LocalDate.now()%>"
                                min="1870-01-01" max="<%= LocalDate.now()%>" required>
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
                        <label for="fpeso">Peso</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lpeso" name="peso" placeholder="Peso" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="ftiposangre">Tipo de sangre</label>
                    </div>
                    <div class="col-77">
                        <select id="country2" name="sangre">
                            <option value="a+" >A+</option>  
                            <option value="a-" >A-</option>
                            <option value="b+" >B+</option>
                            <option value="b-" >B-</option>
                            <option value="ab+" >AB+</option>
                            <option value="ab-" >AB-</option>
                            <option value="o+" >O+</option>
                            <option value="o-" >O-</option>
                        </select>
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
            if ((request.getParameter("nombre") !="") && (request.getParameter("codigo") !="")
                    && (request.getParameter("DPI") !="") && (request.getParameter("telefono") !="")
                    && (request.getParameter("peso") !="") && (request.getParameter("correo") !="")) {
                LocalDate fechaIngresada = LocalDate.parse(request.getParameter("fecha"));
                try {
                    Paciente nuevoPaciente = new Paciente(request.getParameter("codigo"), request.getParameter("nombre"), request.getParameter("sexo"),
                            fechaIngresada, request.getParameter("DPI"), request.getParameter("telefono"), request.getParameter("peso"),
                            request.getParameter("sangre"), request.getParameter("correo"), request.getParameter("password"));
    %> 
    <div class="alert1">
        <span class="closebtn"> 
            <strong>Creado</strong> El paciente se creo exitosamente
    </div>
    <%
                } catch (Exception e) {
                }

            }
else {
    %> 
    <div class="alert2">
        <span class="closebtn"> 
            <strong>Error</strong> No ingreso bien los datos del paciente
    </div>
    <%
            }

        } catch (Exception e) {
        }


    %>
</html>

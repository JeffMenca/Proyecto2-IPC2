<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

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
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" action="CrearLaboratorista.jsp">

            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Laboratorista</h1>
                <a href="VerLaboratorista.jsp">Ver Laboratoristas creados</a>
                <br><br><br><br>
                <h1>Crear laboratorista</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fcodigo">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" placeholder="Codigo del laboratorista" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fnombre">Nombre</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="nombre" placeholder="Nombre del laboratorista" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fnombre">Numero de registro</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lregistro" name="registro" placeholder="Numero de registro" required>
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
                    <div class="col-25">
                        <label for="fpassword">Dias que trabajara</label>
                    </div>
                    <div class="col-77">
                        <label class="container">Lunes
                            <input type="checkbox" name="lunes" >
                        </label>
                        <label class="container">Martes
                            <input type="checkbox" name="martes" >
                        </label>
                        <label class="container">Miercoles
                            <input type="checkbox" name="miercoles" >
                        </label>
                        <label class="container">Jueves
                            <input type="checkbox" name="jueves" >
                        </label>
                        <label class="container">Viernes
                            <input type="checkbox" name="viernes" >
                        </label>
                        <label class="container">Sabado
                            <input type="checkbox" name="sabado" >
                        </label>
                        <label class="container">Domingo
                            <input type="checkbox" name="domingo" >
                        </label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Examen que realizara</label>
                    </div>
                    <div class="col-77">
                        <select id="country" name="examen">
                            <%

                                BuscarEnDB buscador = new BuscarEnDB();
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
                    <input type="submit" class="button2" value="Ingresar Laboratorista">
                </div>

            </div>

        </form>

    </body>
    <%        try {
            if (request.getParameter("nombre") != "dato") {
                LocalDate fechaIngresada = LocalDate.parse(request.getParameter("fecha"));
                try {
                    Laboratorista nuevoLaboratorista = new Laboratorista(request.getParameter("codigo"), request.getParameter("nombre"),
                            request.getParameter("registro"), request.getParameter("DPI"), request.getParameter("telefono"), request.getParameter("correo"),
                            fechaIngresada, request.getParameter("password"), Integer.parseInt(request.getParameter("examen")));
                    ArrayList dias = new ArrayList();
                    if (request.getParameter("lunes") != null) {
                        dias.add("Lunes");
                    }
                    if (request.getParameter("martes") != null) {
                        dias.add("Martes");
                    }
                    if (request.getParameter("miercoles") != null) {
                        dias.add("Miercoles");
                    }
                    if (request.getParameter("jueves") != null) {
                        dias.add("Jueves");
                    }
                    if (request.getParameter("viernes") != null) {
                        dias.add("Viernes");
                    }
                    if (request.getParameter("sabado") != null) {
                        dias.add("Sabado");
                    }
                    if (request.getParameter("domingo") != null) {
                        dias.add("Domingo");
                    }
                    buscador.generarDias(dias, request.getParameter("codigo"));
    %> 
    <div class="alert1">
        <span class="closebtn"> 
            <strong>Creado</strong> El laboratorista se creo exitosamente
    </div>
    <%
        } catch (Exception e) {
        }

    } else {
    %> 
    <div class="alert2">
        <span class="closebtn"> 
            <strong>Error</strong> No ingreso bien los datos
    </div>
    <%
            }

        } catch (Exception e) {
        }


    %>
</html>

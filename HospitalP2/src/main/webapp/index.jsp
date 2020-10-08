<%-- 
    Document   : index
    Created on : 28/09/2020, 00:44:23
    Author     : jeffmenca
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Logica.HorarioMedico"%>
<%@page import="Logica.BuscarEnDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="Logica.Login"%>
<%@page import="Entidades.*"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="SQLConnector.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital IPC2</title>
        <link rel="stylesheet" href="styles/MenuBarStyle.css">
        <link rel="stylesheet" href="styles/LoginStyle.css">
    </head>


    <body>
        <div class="header">
            <img class="logo" src="img/logo.png" width="60" height="60" />
        </div>
        <form method="GET" action="index.jsp">

            <div class="login-box">
                <h1>Ingreso</h1>

                <div class="box">
                    <select name="tipo">
                        <option value="ninguno">Tipo de usuario:</option>
                        <option value="Paciente">Paciente</option>
                        <option value="Medico">Medico</option>
                        <option value="Laboratorista">Laboratorista</option>
                        <option value="Administrador">Administrador</option>
                    </select>
                </div>

                <div class="textbox">
                    <i class="fas fa-user"></i>
                    <input type="text" placeholder="Usuario" name="usuario">
                </div>

                <div class="textbox">
                    <i class="fas fa-lock"></i>
                    <input type="password" placeholder="Contraseña" name="password">
                </div>

                <input type="submit" class="btn" value="Ingresar">
                <br>
                <a href="administrador/CrearPacienteLogin.jsp" style="color:#FFF;">No tiene cuenta? haga click aqui</a>
            </div>
        </form>
        <% DbConnection conexion = new DbConnection();
            conexion.connectionDB();

            Administrador admin = new Administrador("512", "admin01", "345", "jeffjma100");
            if (!(request.getParameter("usuario") == null) && !(request.getParameter("password") == null) && !(request.getParameter("tipo") == "ninguno")) {
                Login login = new Login(request.getParameter("usuario"), request.getParameter("password"), request.getParameter("tipo"));
                if (login.ingresarLogin() == 1) {
                    session.setAttribute("username", request.getParameter("usuario"));
                    response.sendRedirect("paciente/PacienteIndex.jsp");
                } else if (login.ingresarLogin() == 2) {
                    session.setAttribute("username", request.getParameter("usuario"));
                    response.sendRedirect("medico/MedicoIndex.jsp");
                } else if (login.ingresarLogin() == 3) {
                    session.setAttribute("username", request.getParameter("usuario"));
                    response.sendRedirect("laboratorista/LaboratoristaIndex.jsp");
                } else if (login.ingresarLogin() == 4) {
                    session.setAttribute("username", request.getParameter("usuario"));
                    response.sendRedirect("administrador/AdminIndex.jsp");
                } else {
        %><h4 class="error">Su usuario, tipo o contraseña son incorrectos</h4><%
                }
            }
        %>
    </body>
</html>

<%-- 
    Document   : index
    Created on : 28/09/2020, 00:44:23
    Author     : jeffmenca
--%>

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
        <header>

            <img class="logo" src="img/logoazul.png" width="300" height="75" />
            <input type="checkbox" id="nav-toggle" class="nav-toggle">
            <nav>
                <ul>
                    <li><a href="#"></a></li>
                </ul>
            </nav>
            <label for="nav-toggle" class="nav-toggle-label">
                <span></span>
            </label>
        </header>
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
            </div>
        </form>w
        <% DbConnection conexion = new DbConnection();
            conexion.connectionDB();
            if (!(request.getParameter("usuario") == null) && !(request.getParameter("password") == null) && !(request.getParameter("tipo") == "ninguno")) {
                Login login = new Login(request.getParameter("usuario"), request.getParameter("password"), request.getParameter("tipo"));
                if (login.ingresarLogin() == 1) {
                    response.sendRedirect("paciente/pacienteIndex.jsp");
                }else if (login.ingresarLogin() == 2) {
                    response.sendRedirect("newhtml.html");
                }else if (login.ingresarLogin() == 3) {
                    response.sendRedirect("newhtml.html");
                }else if (login.ingresarLogin() == 4) {
                    response.sendRedirect("newhtml.html");
                } else {
        %><h4 class="error">Su usuario, tipo o contraseña son incorrectos</h4><%
                }
            }
        %>
    </body>
</html>

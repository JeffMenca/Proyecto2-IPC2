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
        <link rel="stylesheet" href="MenuPacienteStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head> 
    <body>
        <%@include  file="MenuNavigator4.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
    <center><h1 style="color:white;">Bienvenido al hospital IPC2</h1></center>
    <br> 
    <center><div style="color:white;">
            <p>Aqui podra crear citas y modificar examenes.</p>
            <p>Puede acceder a las consultas y modificar el precio.</p>
            <p>dependiendo de la especialidad.</p>
            <p>Tambien podra agregar nuevos usuarios, como pacientes, doctores,</p>
            <p>laboratoristas y otros administradores.</p>
            <p>Bienvenido</p>
        </div></center>
    <center><img src="../img/logo.png" width="150" height="150" /></center>



</body>
</html>

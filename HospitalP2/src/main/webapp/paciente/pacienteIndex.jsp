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
        <link rel="stylesheet" href="MenuStyle.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head> 
    <body>
        <%@include  file="MenuNavigator.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
    <center><h1 style="color:white;">Bienvenido al hospital IPC2</h1></center>
    <br> 
    <center><div style="color:white;">
            <p>Aqui podra crear citas para consultas o examenes de laboratorio.</p>
            <p>Puede acceder a nuestra informacion como por ejemplo ver los horarios.</p>
            <p>de su medico de preferencia.</p>
            <p>Tambien podra acceder a su historial medico y a toda su informacion.</p>
            <p>Sus datos son privados y seguros.</p>
            <p>bienvenido</p>
        </div></center>
    <center><img src="../img/logo.png" width="150" height="150" /></center>



</body>
</html>

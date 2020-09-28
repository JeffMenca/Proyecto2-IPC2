<%-- 
    Document   : index
    Created on : 28/09/2020, 00:44:23
    Author     : jeffmenca
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="Entidades.Paciente"%>
<%@page import="SQLConnector.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% DbConnection conexion=new DbConnection();
           conexion.connectionDB();
           System.out.println("si");
           Paciente paciente1=new Paciente("123", "jeff", "masculino", LocalDate.now(), "1234567", "44813514", "25", "abpositivo", "jeff@gmail.com", "5678");
           paciente1.insertarPaciente();
    %>
    </body>
</html>

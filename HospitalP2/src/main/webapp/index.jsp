<%-- 
    Document   : index
    Created on : 28/09/2020, 00:44:23
    Author     : jeffmenca
--%>

<%@page import="Entidades.Dias_Trabajados"%>
<%@page import="Entidades.Orden_Examen"%>
<%@page import="Entidades.Especializacion"%>
<%@page import="Entidades.Informe_Examen_Laboratorio"%>
<%@page import="Entidades.Informe_Consulta_Medica"%>
<%@page import="Entidades.Cita_Examen_Laboratorio"%>
<%@page import="Entidades.Laboratorista"%>
<%@page import="Entidades.Examen_Laboratorio"%>
<%@page import="Entidades.Cita_Consulta_Medica"%>
<%@page import="Entidades.Consulta_Medica"%>
<%@page import="Entidades.Especialidad"%>
<%@page import="Entidades.Administrador"%>
<%@page import="java.time.LocalTime"%>
<%@page import="Entidades.Medico"%>
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
           Paciente paciente=new Paciente("123", "jeff", "masculino", LocalDate.now(), "345", "3455", "560kg", "dsf", "sdf", "dsf");
           Medico medico1=new Medico("57", "doctorxX", "3453", "2342345", "5675","medicina", "medic@", LocalTime.now(), LocalTime.now(), LocalDate.now(), "234");
           Examen_Laboratorio examenlab=new Examen_Laboratorio("777", "33", true, "2sdf", 25.5, "imagen");
           Laboratorista laboratorista= new Laboratorista("34", "simon", "234652", "45645", "5645", "simon@", LocalDate.now(), "456", "777");
           Cita_Examen_Laboratorio citaexamen=new Cita_Examen_Laboratorio(435, LocalDate.now(), LocalTime.now(), "123",null , "34");
           Especialidad especialidad=new Especialidad("ninguna");
           Consulta_Medica consultamedica=new Consulta_Medica(1, 24.5, "ninguna");
           Informe_Consulta_Medica informeconsulta=new Informe_Consulta_Medica("6675", "info", LocalDate.now(), LocalTime.now(),1 , "123", "4566");
           Informe_Examen_Laboratorio informeexamen=new Informe_Examen_Laboratorio("66", "info", LocalDate.now(), LocalTime.now(), "777", "123", "34");
           Especializacion especializacion=new Especializacion("ninguna", "4566");
           Orden_Examen orden=new Orden_Examen(1, "info", "123", "4566", "777");
           Dias_Trabajados dias=new Dias_Trabajados(1, "lunes", "34");
    %>
    </body>
</html>

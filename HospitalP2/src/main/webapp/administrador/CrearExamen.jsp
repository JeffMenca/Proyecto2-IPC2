<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

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
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" action="CrearExamen.jsp">

            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Ingresar examen de laboratorio</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Nombre</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="nombre" placeholder="Nombre del examen">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="country">Costo</label>
                    </div>
                    <div class="col-77">
                        <input type="number" name="costo" value="100.00" step="0.01" min="0">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Necesita orden de medico?</label>
                    </div>
                    <div class="col-77">
                        <select id="country" name="orden">
                            <option value="Si" >Si</option>  
                            <option value="No" >No</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Tipo de informe</label>
                    </div>
                    <div class="col-77">
                        <select id="country" name="tipo">
                            <option value="PDF" >PDF</option>  
                            <option value="JPG" >JPG</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="subject">Descripcion</label>
                    </div>
                    <div class="col-77">
                        <textarea id="subject" name="descripcion" placeholder="Descripcion.." style="height:150px"></textarea>
                    </div>
                </div>

                <div class="row">
                    <br> 
                    <input type="submit" class="button2" value="Ingresar examen de laboratorio">
                </div>

            </div>

        </form>

    </body>
    <%
        boolean resultado;
        boolean informe;
        try {
            Double.parseDouble(request.getParameter("costo"));
            resultado = true;
        } catch (Exception excepcion) {
            resultado = false;
        }
        try {
            if (!(request.getParameter("nombre") == null) && !(request.getParameter("costo") == null) && !(resultado == false)) {
                if (request.getParameter("orden").equals("Si")) {
                    informe = true;
                } else {
                    informe = false;
                }
                Examen_Laboratorio nuevoExamen=new Examen_Laboratorio(0,request.getParameter("nombre"), informe, 
                request.getParameter("descripcion"), Double.parseDouble(request.getParameter("costo")), request.getParameter("tipo"));
            }

        } catch (Exception e) {
        }


    %>
</html>

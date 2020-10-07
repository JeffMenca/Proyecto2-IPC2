<%-- 
    Document   : BuscarMedico
    Created on : 30/09/2020, 17:38:45
    Author     : jeffrey
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="SQLConnector.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver paciente</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator2.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerPaciente.jsp">


        </form>
        <%
            String codigoPaciente=request.getParameter("codigo");
            //Acciones que se ejecutan al presionar el boton
            try {
                //Variables de filtro y del tipo
                String queryselect = "";
                
                queryselect = "SELECT * FROM INFORME_CONSULTA_MEDICA WHERE paciente_codigo='"+codigoPaciente+"'";
                

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Codigo</th><th>Descripcion</th><th>Fecha</th><th>Hora</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("codigo") + "</td>");
                            out.println("<td>" + resultset01.getObject("descripcion") + "</td>");
                            out.println("<td>" + resultset01.getObject("fecha") + "</td>");
                            out.println("<td>" + resultset01.getObject("hora") + "</td>");
                                
                                    out.println("</tr>");
                                }

                %></table><%                    } catch (Exception e) {
                        // Error en algun momento.
                        out.println("Excepcion " + e);
                        e.printStackTrace();
                    }
                    try {
                        //Variables de filtro y del tipo
                        String queryselect = "";
                        
                            queryselect = "SELECT * FROM INFORME_EXAMEN_LABORATORIO WHERE paciente_codigo='"+codigoPaciente+"'";
                        

                        Statement statements = DbConnection.getConnection().createStatement();
                        ResultSet resultset01 = statements.executeQuery(queryselect);
                        // Ponemos los resultados en un table de html
        %>
    <table id="customers"><tr><th>Codigo</th><th>Descripcion</th><th>Fecha</th><th>Hora</th></tr>
                <%
                    while (resultset01.next()) {
                        out.println("<tr>");
                        out.println("<td>" + resultset01.getObject("codigo") + "</td>");
                        out.println("<td>" + resultset01.getObject("descripcion") + "</td>");
                        out.println("<td>" + resultset01.getObject("fecha") + "</td>");
                        out.println("<td>" + resultset01.getObject("hora") + "</td>");
                           
                                    out.println("</tr>");
                                }

            %></table><%                    } catch (Exception e) {
                    // Error en algun momento.
                    out.println("Excepcion " + e);
                    e.printStackTrace();
                }
    %>
</body>
</html>

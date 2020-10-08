<%-- 
    Document   : BuscarMedico
    Created on : 30/09/2020, 17:38:45
    Author     : jeffrey
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="SQLConnector.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Examenes realizados en el dia</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css?3.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator3.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerDiasUtilizacion.jsp">
           <h2 style="color:white;">Fechas con mas trabajo</h2>
        </form>
        <%

            //Acciones que se ejecutan al presionar el boton
            try {
                //Variables de filtro y del tipo
                String codigoLab = String.valueOf(session.getAttribute("username"));
                String queryselect = "";
                String tipo = request.getParameter("tipo");
                String filtro = request.getParameter("filtro");
                //Verificacion del filtro

                queryselect = "SELECT COUNT(*) AS numero,fecha FROM INFORME_EXAMEN_LABORATORIO "
                + "WHERE laboratorista_codigo='" + codigoLab + "' GROUP BY fecha LIMIT 10";

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Numero de veces</th><th>Fecha</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("numero") + "</td>");
                            out.println("<td>" + resultset01.getObject("fecha") + "</td>");
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

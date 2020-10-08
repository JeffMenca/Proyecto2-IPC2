<%-- 
    Document   : BuscarMedico
    Created on : 30/09/2020, 17:38:45
    Author     : jeffrey
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="SQLConnector.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ver medicos con mas examenes requeridos</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator4.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerMedicoOrdenes.jsp">
            <h2 style="color:white;">Ver medicos con mas examenes requeridos</h2>
            

        </form>
        <%
            //Acciones que se ejecutan al presionar el boton
            try {
                //Variables de filtro y del tipo
                String queryselect = "";

                queryselect = "SELECT COUNT(*) AS cantidad,M.nombre as medico,E.nombre FROM ORDEN_EXAMEN OE INNER JOIN MEDICO M ON "
                        + "M.codigo=OE.medico_codigo INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=OE.examen_laboratorio_codigo GROUP BY medico,E.nombre ORDER BY cantidad DESC";

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Medico</th><th>Cantidad de veces demandado</th><th>Examen</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("medico") + "</td>");
                            out.println("<td>" + resultset01.getObject("cantidad") + "</td>");
                            out.println("<td>" + resultset01.getObject("nombre") + "</td>");

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

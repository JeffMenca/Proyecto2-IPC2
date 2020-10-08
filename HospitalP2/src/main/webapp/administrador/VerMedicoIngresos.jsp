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
        <title>Ver ingresos obtenidos por medico</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator4.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerMedicoIngresos.jsp">
            <h2 style="color:white;">Ver ingresos obtenidos por medico</h2>
            <div class="box">

                <label for="fname" style="color: white" >Fecha inicio</label>
                <input  type="date" name="fechainicio"
                        value="<%= LocalDate.now()%>"
                        min="1990-12-31" max="2050-12-31">
                <label for="fname" style="color: white">Fecha final</label>
                <input  type="date" name="fechafinal"
                        value="<%= LocalDate.now()%>"
                        min="1990-12-31" max="2050-12-31">
                <button type="submit" name="intervalo" class="searchButton">
                    <i class="fa fa-search"></i>
                </button>

            </div>

        </form>
        <%
            //Acciones que se ejecutan al presionar el boton
            try {
                //Variables de filtro y del tipo
                String queryselect = "SELECT M.nombre AS medico,SUM(C.costo) AS ingresos FROM INFORME_CONSULTA_MEDICA IC INNER JOIN CONSULTA_MEDICA C "
                        + "ON C.codigo=IC.consulta_medica_codigo INNER JOIN MEDICO M ON IC.medico_codigo=M.codigo WHERE IC.fecha BETWEEN '" + request.getParameter("fechainicio") + "' AND '" + request.getParameter("fechafinal")
                        + "' GROUP BY medico ORDER BY ingresos";

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Nombre del medico</th><th>Ingresos</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("medico") + "</td>");
                            out.println("<td>" + resultset01.getObject("ingresos") + "</td>");

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

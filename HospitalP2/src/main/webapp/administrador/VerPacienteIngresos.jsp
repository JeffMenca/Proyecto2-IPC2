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
        <title>Ver ingresos generados por paciente</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator4.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerPacienteIngresos.jsp">
            <h2 style="color:white;">Ver ingresos generados por paciente</h2>
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
                String queryselect = "SELECT P.nombre AS paciente,SUM(C.costo+E.costo) AS ingresos FROM INFORME_CONSULTA_MEDICA IC "
                        + "INNER JOIN CONSULTA_MEDICA C ON C.codigo=IC.consulta_medica_codigo INNER JOIN PACIENTE P ON IC.paciente_codigo=P.codigo "
                        + "INNER JOIN INFORME_EXAMEN_LABORATORIO IL ON IL.paciente_codigo=P.codigo INNER JOIN EXAMEN_LABORATORIO E "
                        + "ON IL.examen_laboratorio_codigo=E.codigo WHERE IC.fecha "
                        + "BETWEEN '" + request.getParameter("fechainicio") + "' AND '" + request.getParameter("fechafinal") + "' "
                        + "GROUP BY paciente ORDER BY ingresos";

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Nombre del paciente</th><th>Ingresos generados</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("paciente") + "</td>");
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

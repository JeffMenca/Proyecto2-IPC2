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
        <title>Ver 5 ultimas Consultas realizados</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css?3.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerInformeDia.jsp">
            <h2 style="color:white;">Ultimas 5 consultas realizados</h2>

        </form>
        <%

            //Acciones que se ejecutan al presionar el boton
            try {
                //Variables de filtro y del tipo
                String codigoPaciente = String.valueOf(session.getAttribute("username"));
                String queryselect = "";
                String tipo = request.getParameter("tipo");
                String filtro = request.getParameter("filtro");
                //Verificacion del filtro

                queryselect = "SELECT I.*,C.especialidad_nombre FROM INFORME_CONSULTA_MEDICA I INNER JOIN CONSULTA_MEDICA C ON "
                        + "I.consulta_medica_codigo=C.codigo WHERE paciente_codigo='" + codigoPaciente + "' "
                        + "ORDER BY fecha DESC LIMIT 5";

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Codigo</th><th>Descripcion</th><th>Fecha</th><th>Hora</th><th>Especialidad</th><th>Codigo del Medico</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("codigo") + "</td>");
                            out.println("<td>" + resultset01.getObject("descripcion") + "</td>");
                            out.println("<td>" + resultset01.getObject("fecha") + "</td>");
                            out.println("<td>" + resultset01.getObject("hora") + "</td>");
                            out.println("<td>" + resultset01.getObject("especialidad_nombre") + "</td>");
                            out.println("<td>" + resultset01.getObject("medico_codigo") + "</td>");

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

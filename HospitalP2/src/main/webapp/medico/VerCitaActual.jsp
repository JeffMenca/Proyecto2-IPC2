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
        <title>Citas ya programadas</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css?3.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator2.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerCitaActual.jsp">
            <div class="box">
                <select name="tipo">
                    <option value="codigo">Codigo</option>
                </select>
            </div>
            <div class="wrap">
                <div class="search">
                    <input type="text" name="filtro" class="searchTerm" placeholder="Que desea buscar?">
                    <button type="submit" class="searchButton">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </form>
        <%

            //Acciones que se ejecutan al presionar el boton
            try {
                //Variables de filtro y del tipo
                String codigoMedico = String.valueOf(session.getAttribute("username"));
                String queryselect = "";
                String tipo = request.getParameter("tipo");
                String filtro = request.getParameter("filtro");
                //Verificacion del filtro
                if (!(filtro == null)) {
                    //Filtro por nombre
                    if (tipo.equals("codigo")) {
                        queryselect = "SELECT C.*,M.nombre AS medico,CM.especialidad_nombre FROM CITA_CONSULTA_MEDICA C INNER JOIN MEDICO M "
                                + "ON C.medico_codigo=M.codigo INNER JOIN CONSULTA_MEDICA CM ON C.consulta_medica_codigo=CM.codigo "
                                + "WHERE M.codigo='"+codigoMedico+"' && C.fecha='" + LocalDate.now() + "' && C.codigo LIKE '%" + request.getParameter("filtro") + "%';";
                        //Filtro por codigo
                    }
                } else {
                    queryselect = "SELECT C.*,M.nombre AS medico,CM.especialidad_nombre FROM CITA_CONSULTA_MEDICA C INNER JOIN MEDICO M "
                            + "ON C.medico_codigo=M.codigo INNER JOIN CONSULTA_MEDICA CM ON C.consulta_medica_codigo=CM.codigo"
                            + " WHERE M.codigo='"+codigoMedico+"' && C.fecha='" + LocalDate.now() + "'";
                }

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Codigo</th><th>Fecha</th><th>Hora</th><th>Medico</th><th>Tipo</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("codigo") + "</td>");
                            out.println("<td>" + resultset01.getObject("fecha") + "</td>");
                            out.println("<td>" + resultset01.getObject("hora") + "</td>");
                            out.println("<td>" + resultset01.getObject("medico") + "</td>");
                            out.println("<td>" + resultset01.getObject("especialidad_nombre") + "</td>");

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

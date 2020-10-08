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
        <form method="GET" action="VerInformeDia.jsp">
            <h2 style="color:white;">Examenes realiazdos en el dia</h2>
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
                String codigoLab = String.valueOf(session.getAttribute("username"));
                String queryselect = "";
                String tipo = request.getParameter("tipo");
                String filtro = request.getParameter("filtro");
                //Verificacion del filtro
                if (!(filtro == null)) {
                    //Filtro por nombre
                    if (tipo.equals("codigo")) {
                        queryselect = "SELECT I.*,P.nombre AS paciente,E.nombre AS examen_nombre FROM INFORME_EXAMEN_LABORATORIO I INNER JOIN PACIENTE P "
                            + "ON I.paciente_codigo=P.codigo INNER JOIN EXAMEN_LABORATORIO E ON I.examen_laboratorio_codigo=E.codigo "
                            + "WHERE I.fecha='" + LocalDate.now() + "' && I.laboratorista_codigo='" + codigoLab + "' && I.codigo LIKE '%" + request.getParameter("filtro") + "%';";
                        //Filtro por codigo
                    }
                    
                } else {
                    queryselect = "SELECT I.*,P.nombre AS paciente,E.nombre AS examen_nombre FROM INFORME_EXAMEN_LABORATORIO I INNER JOIN PACIENTE P "
                            + "ON I.paciente_codigo=P.codigo INNER JOIN EXAMEN_LABORATORIO E ON I.examen_laboratorio_codigo=E.codigo "
                            + "WHERE I.fecha='" + LocalDate.now() + "' && I.laboratorista_codigo='" + codigoLab + "'";
                }

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Codigo</th><th>Fecha</th><th>Hora</th><th>Paciente</th><th>Examen</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("codigo") + "</td>");
                            out.println("<td>" + resultset01.getObject("fecha") + "</td>");
                            out.println("<td>" + resultset01.getObject("hora") + "</td>");
                            out.println("<td>" + resultset01.getObject("paciente") + "</td>");
                            out.println("<td>" + resultset01.getObject("examen_nombre") + "</td>");

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

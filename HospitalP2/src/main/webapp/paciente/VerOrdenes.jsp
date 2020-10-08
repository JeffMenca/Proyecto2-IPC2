<%-- 
    Document   : BuscarMedico
    Created on : 30/09/2020, 17:38:45
    Author     : jeffrey
--%>

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
        <title>Ver ordenes</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css?3.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerOrdenes.jsp">
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
                String codigoPaciente = String.valueOf(session.getAttribute("username"));
                String queryselect = "";
                String tipo = request.getParameter("tipo");
                String filtro = request.getParameter("filtro");
                //Verificacion del filtro
                if (!(filtro == null)) {
                    //Filtro por codigo
                    if (tipo.equals("codigo")) {
                        queryselect = "SELECT O.*,E.nombre FROM ORDEN_EXAMEN O INNER JOIN EXAMEN_LABORATORIO E ON "
                                + "E.codigo=O.examen_laboratorio_codigo WHERE O.paciente_codigo='" + codigoPaciente + "' "
                                + "&& O.codigo LIKE '%" + request.getParameter("filtro") + "%';";
                        //Sin filtro
                    }
                } else {
                    queryselect = "SELECT O.*,E.nombre FROM ORDEN_EXAMEN O INNER JOIN EXAMEN_LABORATORIO E ON "
                            + "E.codigo=O.examen_laboratorio_codigo WHERE O.paciente_codigo='" + codigoPaciente + "'";
                }

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Codigo</th><th>Descripcion</th><th>Examen</th><th>Codigo de Medico</th><th>Descargar orden</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("codigo") + "</td>");
                            out.println("<td>" + resultset01.getObject("descripcion") + "</td>");
                            out.println("<td>" + resultset01.getObject("nombre") + "</td>");
                            out.println("<td>" + resultset01.getObject("medico_codigo") + "</td>");
                                    %><td><center><a class="button" href="../ServletDescargarOrden?ordenExamen=<%=resultset01.getInt("codigo")%>">Descargar</a></center></td><%
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

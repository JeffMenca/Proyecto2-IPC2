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
        <title>Ver examenes</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator4.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerConsulta.jsp">
            <div class="box">
                <select name="tipo">
                    <option value="codigo">Codigo</option>
                    <option value="especialidad">Especialidad</option>
                    <option value="costo">Costo</option>
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
                String queryselect = "";
                String tipo = request.getParameter("tipo");
                String filtro = request.getParameter("filtro");
                //Verificacion del filtro
                if (!(filtro == null)) {
                    //Filtro por nombre
                    if (tipo.equals("especialidad")) {
                        queryselect = "SELECT * FROM CONSULTA_MEDICA WHERE especialidad_nombre LIKE '%" + request.getParameter("filtro") + "%';";
                        //Filtro por codigo
                    } else if (tipo.equals("codigo")) {
                        queryselect = "SELECT * FROM CONSULTA_MEDICA WHERE codigo LIKE '%" + request.getParameter("filtro") + "%';";
                        //Filtro por codigo
                    } else if (tipo.equals("costo")) {
                        queryselect = "SELECT * FROM CONSULTA_MEDICA WHERE costo LIKE '%" + request.getParameter("filtro") + "%';";
                    }

                } else {
                    queryselect = "SELECT * FROM CONSULTA_MEDICA";
                }

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Codigo</th><th>Especialidad</th><th>Costo</th><th>Editar</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("codigo") + "</td>");
                            out.println("<td>" + resultset01.getObject("especialidad_nombre") + "</td>");
                            out.println("<td>" + resultset01.getObject("costo") + "</td>");
                                    %><td><center><a class="button" href="EditarConsulta.jsp?codigo=<%=resultset01.getInt("codigo")%>">Editar costo</a></center></td><%
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

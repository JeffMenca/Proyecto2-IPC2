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
        <title>Examenes ya programados</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css?3.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerCitaExamen.jsp">
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
            if (!(request.getParameter("eliminar") == null)) {
                try {
                    String citaEliminar = request.getParameter("eliminar");
                    String queryEliminar = "DELETE FROM CITA_EXAMEN_LABORATORIO WHERE codigo=?";
                    PreparedStatement statement = DbConnection.getConnection().prepareStatement(queryEliminar);
                    statement.setString(1, citaEliminar);
                    statement.execute();
                    statement.close();
        %> 
        <div class="alert2">

            <strong>Cancelado</strong> Se cancelo la cita correctamente
        </div>
        <%
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "no se elimino nada");
                }
            }

            //Acciones que se ejecutan al presionar el boton
            try {
                //Variables de filtro y del tipo
                String codigoPaciente = String.valueOf(session.getAttribute("username"));
                String queryselect = "";
                String tipo = request.getParameter("tipo");
                String filtro = request.getParameter("filtro");
                //Verificacion del filtro
                if (!(filtro == null)) {
                    //Filtro por nombre
                    if (tipo.equals("codigo")) {
                        queryselect = "SELECT C.*,L.nombre AS laboratorista,EL.nombre AS examen_nombre FROM CITA_EXAMEN_LABORATORIO C INNER JOIN LABORATORISTA L "
                                + "ON C.laboratorista_codigo=L.codigo INNER JOIN EXAMEN_LABORATORIO EL ON L.examen_laboratorio_codigo=EL.codigo "
                                + "WHERE C.paciente_codigo='" + codigoPaciente + "' && C.codigo LIKE '%" + request.getParameter("filtro") + "%';";
                        //Filtro por codigo
                    }
                } else {
                    queryselect = "SELECT C.*,L.nombre AS laboratorista,EL.nombre AS examen_nombre FROM CITA_EXAMEN_LABORATORIO C INNER JOIN LABORATORISTA L "
                            + "ON C.laboratorista_codigo=L.codigo INNER JOIN EXAMEN_LABORATORIO EL ON L.examen_laboratorio_codigo=EL.codigo "
                            + "WHERE C.paciente_codigo='" + codigoPaciente + "'";
                }

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Codigo</th><th>Fecha</th><th>Hora</th><th>Examen</th><th>Laboratorista</th><th>Eliminar</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("codigo") + "</td>");
                            out.println("<td>" + resultset01.getObject("fecha") + "</td>");
                            out.println("<td>" + resultset01.getObject("hora") + "</td>");
                            out.println("<td>" + resultset01.getObject("laboratorista") + "</td>");
                            out.println("<td>" + resultset01.getObject("examen_nombre") + "</td>");
                                        %><td><center><a class="button2" href="VerCitaExamen.jsp?eliminar=<%=resultset01.getInt("codigo")%>">Cancelar consulta</a></center></td><%
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

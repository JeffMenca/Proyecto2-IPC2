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
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css">

    </head>
    <body>
        <%@include  file="MenuNavigator.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="BuscarMedico.jsp">
            <div class="box">
                <select name="tipo">
                    <option value="codigo">Codigo</option>
                    <option value="nombre">Nombre</option>
                    <option value="especialidad">Especialidad</option>
                    <option value="hora">Hora de trabajo</option>
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
                    if (tipo.equals("nombre")) {
                        queryselect = "SELECT M.codigo,M.nombre,E.especialidad_nombre,M.horario_entrada,M.horario_salida"
                                + " FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo "
                                + "WHERE M.nombre LIKE '%" + request.getParameter("filtro") + "%';";
                        //Filtro por codigo
                    } else if (tipo.equals("codigo")) {
                        queryselect = "SELECT M.codigo,M.nombre,E.especialidad_nombre,M.horario_entrada,M.horario_salida"
                                + " FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo "
                                + "WHERE M.codigo LIKE '%" + request.getParameter("filtro") + "%';";
                        //Filtro por codigo
                    } else if (tipo.equals("especialidad")) {
                        queryselect = "SELECT M.codigo,M.nombre,E.especialidad_nombre,M.horario_entrada,M.horario_salida"
                                + " FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo "
                                + "WHERE E.especialidad_nombre LIKE '%" + request.getParameter("filtro") + "%';";
                    } else if (tipo.equals("hora")) {
                        queryselect = "SELECT M.codigo,M.nombre,E.especialidad_nombre,M.horario_entrada,M.horario_salida"
                                + " FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo "
                                + "WHERE horario_salida>='"+filtro+"' AND '"+filtro+"'>=horario_entrada";
                    }

                } else {
                    queryselect = "SELECT M.codigo,M.nombre,E.especialidad_nombre,M.horario_entrada,M.horario_salida"
                            + " FROM MEDICO M INNER JOIN ESPECIALIZACION E ON M.codigo=E.medico_codigo;";
                }

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Codigo</th><th>Nombre</th><th>Especialidad</th><th>Horario de entrada</th><th>Horario de salida</th><th>Cita</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("codigo") + "</td>");
                            out.println("<td>" + resultset01.getObject("nombre") + "</td>");
                            out.println("<td>" + resultset01.getObject("especialidad_nombre") + "</td>");
                            out.println("<td>" + resultset01.getObject("horario_entrada") + "</td>");
                            out.println("<td>" + resultset01.getObject("horario_salida") + "</td>");
                            %><td><center><a class="button" href="AgendarCita.jsp?codigo=<%=resultset01.getString("codigo")%>">Programar cita</a></center></td><%
                            out.println("</tr>");
                        }

                                    %></table>");<%                    } catch (Exception e) {
                                            // Error en algun momento.
                                            out.println("Excepcion " + e);
                                            e.printStackTrace();
                                        }
            %>
    </body>
</html>

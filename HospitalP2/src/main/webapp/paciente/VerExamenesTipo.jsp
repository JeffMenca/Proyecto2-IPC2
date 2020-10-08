<%-- 
    Document   : BuscarMedico
    Created on : 30/09/2020, 17:38:45
    Author     : jeffrey
--%>

<%@page import="Logica.BuscarEnDB"%>
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
        <title>Examenes por tipo</title>
        <link rel="stylesheet" href="../styles/TableStyle.css">
        <link rel="stylesheet" href="../styles/SearchBarStyle.css?3.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    </head>
    <body>
        <%@include  file="MenuNavigator.html" %>
        <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br> <br>
        <form method="GET" action="VerExamenesTipo.jsp">
            <h2 style="color:white;">Ver examenes por tipo</h2>
            <div class="box">




                <select id="country" name="filtro">
                    <%

                        BuscarEnDB buscador = new BuscarEnDB();
                        ResultSet resultados = buscador.BuscarTodosExamenes();
                        while (resultados.next()) {
                    %><option value="<%= resultados.getInt("codigo")%>"><%= resultados.getString("nombre")%></option><%
                        }
                    %>
                </select>


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
                String codigoPaciente = String.valueOf(session.getAttribute("username"));
                String queryselect = "";
                String tipo = request.getParameter("tipo");
                String filtro = request.getParameter("filtro");
                //Verificacion del filtro

                queryselect = "SELECT I.*,E.nombre FROM INFORME_EXAMEN_LABORATORIO I INNER JOIN EXAMEN_LABORATORIO E ON E.codigo=I.examen_laboratorio_codigo "
                        + "WHERE I.paciente_codigo='" + codigoPaciente + "' && E.codigo='" + filtro + "' && I.fecha BETWEEN '"
                        + request.getParameter("fechainicio") + "' AND '" + request.getParameter("fechafinal") + "';";

                Statement statements = DbConnection.getConnection().createStatement();
                ResultSet resultset01 = statements.executeQuery(queryselect);
                // Ponemos los resultados en un table de html
        %>
        <table id="customers"><tr><th>Nombre</th><th>Descripcion</th><th>Fecha</th><th>Hora</th><th>Codigo de laboratorista</th></tr>
                    <%
                        while (resultset01.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultset01.getObject("nombre") + "</td>");
                            out.println("<td>" + resultset01.getObject("descripcion") + "</td>");
                            out.println("<td>" + resultset01.getObject("fecha") + "</td>");
                            out.println("<td>" + resultset01.getObject("hora") + "</td>");
                            out.println("<td>" + resultset01.getObject("laboratorista_codigo") + "</td>");
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

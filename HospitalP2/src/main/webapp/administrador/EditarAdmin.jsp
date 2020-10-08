<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="Entidades.Paciente"%>
<%@page import="SQLConnector.Encriptar"%>
<%@page import="Entidades.Cita_Consulta_Medica"%>
<%@page import="java.time.LocalTime"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDate"%>
<%@page import="Logica.HorarioMedico"%>
<%@page import="Logica.BuscarEnDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Admin</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <script>
            function exito() {
                alert("Admin editado con exito");
            }
        </script>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" id="Form1" action="EditarAdmin.jsp">
            <%
                String admin;
                try {
                    admin = request.getParameter("codigo");
                } catch (Exception e) {
                    admin = String.valueOf(session.getAttribute("Admin"));
                }
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("Admin", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoAdmin = String.valueOf(session.getAttribute("Admin"));
                BuscarEnDB buscador = new BuscarEnDB();
                ResultSet resultset = buscador.BuscarAdmin(codigoAdmin);
                String nombre = "", DPI = "", password = "";
                LocalDate fecha = null;
                while (resultset.next()) {
                    nombre = resultset.getString("nombre");
                    DPI = resultset.getString("DPI");
                    password = Encriptar.desencriptar(resultset.getString("password"));;
                }

            %>
            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Editar Administrador</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" value="<%= codigoAdmin%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Nombre</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="nombre" value="<%= nombre%>" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">DPI</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="ldpi" name="DPI" value="<%= DPI%>" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Password</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lpassword" name="password" value="<%= password%>" required >
                    </div>
                </div>
                <div class="row">
                    <br> 
                    <input type="submit" class="button2" name="botonEditar" onclick="exito()" value="Editar admin">
                </div>

            </div>

        </form>

    </body>
    <%
        try {
            if (!(request.getParameter("nombre") == null)) {
                buscador.EditarAdmin(request.getParameter("codigo"), request.getParameter("nombre"),
                        request.getParameter("DPI"), request.getParameter("password"));
                response.sendRedirect("EditarAdmin.jsp");
                session.setAttribute("Admin", codigoAdmin);
            }

        } catch (Exception e) {
        }


    %>

</html>

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
        <title>Editar Paciente</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <script>
            function exito() {
                alert("Paciente editada con exito");
            }
        </script>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" id="Form1" action="EditarPaciente.jsp">
            <%
                String paciente;
                try {
                    paciente = request.getParameter("codigo");
                } catch (Exception e) {
                    paciente = String.valueOf(session.getAttribute("Paciente"));
                }
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("Paciente", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoPaciente = String.valueOf(session.getAttribute("Paciente"));
                BuscarEnDB buscador = new BuscarEnDB();
                ResultSet resultset = buscador.BuscarPaciente(codigoPaciente);
                String nombre = "", sexo = "", DPI = "", telefono = "", peso = "", sangre = "", correo = "", password = "";
                LocalDate fecha = null;
                while (resultset.next()) {
                    nombre = resultset.getString("nombre");
                    sexo = resultset.getString("sexo");
                    DPI = resultset.getString("DPI");
                    telefono = resultset.getString("telefono");
                    peso = resultset.getString("peso");
                    sangre = resultset.getString("tipo_sangre");
                    correo = resultset.getString("correo");
                    password = Encriptar.desencriptar(resultset.getString("password"));
                    String fechaCaracter = String.valueOf(resultset.getDate("fecha_nacimiento"));
                    fecha = LocalDate.parse(fechaCaracter);
                }

            %>
            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Editar Paciente</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" value="<%= codigoPaciente%>" readonly>
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
                        <label for="fname">Sexo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lsexo" name="sexo" value="<%= sexo%>" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Fecha de nacimiento</label>
                    </div>
                    <div class="col-77">
                        <input  type="date" name="fecha"
                                value="<%= fecha%>"
                                min="1870-01-01" max="<%= LocalDate.now()%>">
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
                        <label for="fname">Telefono</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="ltelefono" name="telefono" value="<%= telefono%>" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Peso</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lpeso" name="peso" value="<%= peso%>" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Tipo de sangre</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lsangre" name="sangre" value="<%= sangre%>" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Correo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcorreo" name="correo" value="<%= correo%>" required >
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
                    <input type="submit" class="button2" name="botonEditar" onclick="exito()" value="Editar examen de laboratorio">
                </div>

            </div>

        </form>

    </body>
    <%
        try {
            if (!(request.getParameter("nombre") == null) && !(request.getParameter("codigo") == null)
                    && !(request.getParameter("DPI") == null) && !(request.getParameter("telefono") == null)
                    && !(request.getParameter("peso") == null)) {
                LocalDate fechaIngresada = LocalDate.parse(request.getParameter("fecha"));
                buscador.EditarPaciente(request.getParameter("codigo"), request.getParameter("nombre"), request.getParameter("sexo"),
                        fechaIngresada, request.getParameter("DPI"), request.getParameter("telefono"), request.getParameter("peso"),
                        request.getParameter("sangre"), request.getParameter("correo"), request.getParameter("password"));
                response.sendRedirect("EditarPaciente.jsp");
                session.setAttribute("Paciente", codigoPaciente);
            }

        } catch (Exception e) {
        }


    %>

</html>

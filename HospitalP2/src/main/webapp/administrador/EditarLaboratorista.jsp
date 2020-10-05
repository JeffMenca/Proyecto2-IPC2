<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="Entidades.Laboratorista"%>
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
        <title>Editar Laboratorista</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <script>
            function exito() {
                alert("Laboratorista editado con exito");
            }
        </script>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" id="Form1" action="EditarLaboratorista.jsp">
            <%
                String laboratorista;
                try {
                    laboratorista = request.getParameter("codigo");
                } catch (Exception e) {
                    laboratorista = String.valueOf(session.getAttribute("Laboratorista"));
                }
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("Laboratorista", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoLaboratorista = String.valueOf(session.getAttribute("Laboratorista"));
                BuscarEnDB buscador = new BuscarEnDB();
                ResultSet resultset = buscador.BuscarLaboratorista(codigoLaboratorista);
                String nombre = "", registro = "", DPI = "", telefono = "", correo = "", password = "", nombreExamen = "";
                LocalDate fecha = null;
                while (resultset.next()) {
                    nombre = resultset.getString("nombre");
                    registro = resultset.getString("numero_registro");
                    DPI = resultset.getString("DPI");
                    telefono = resultset.getString("telefono");
                    correo = resultset.getString("correo");
                    String fechaCaracter = String.valueOf(resultset.getDate("fecha_inicio"));
                    fecha = LocalDate.parse(fechaCaracter);
                    password = Encriptar.desencriptar(resultset.getString("password"));
                    nombreExamen = resultset.getString("nombre_Examen");
                }

            %>
            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Editar Laboratorista</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" value="<%= codigoLaboratorista%>" readonly>
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
                        <label for="fname">Numero de registro</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcolegiado" name="registro" value="<%= registro%>" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">DPI</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lDPI" name="DPI" value="<%= DPI%>" required >
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
                        <label for="fname">Correo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcorreo" name="correo" value="<%= correo%>" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Fecha de inicio de trabajo</label>
                    </div>
                    <div class="col-77">
                        <input  type="date" name="fecha"
                                value="<%= fecha%>"
                                min="1870-01-01" max="<%= LocalDate.now()%>">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Password</label>
                    </div>
                    <div class="col-77">
                        <input type="password" id="lpassword" name="password" value="<%= password%>" required >
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Examen que realizara</label>
                    </div>
                    <div class="col-77">
                        <select id="country" name="examen">
                            <%

                                buscador = new BuscarEnDB();
                                ResultSet resultados = buscador.BuscarExamenesSin(nombreExamen);
                                ResultSet resultados2 = buscador.BuscarExamen(nombreExamen);
                                while (resultados2.next()) {
                            %><option value="<%= resultados2.getInt("codigo")%>"><%= resultados2.getString("nombre")%></option><%
                                            }
                                            while (resultados.next()) {
                            %><option value="<%= resultados.getInt("codigo")%>"><%= resultados.getString("nombre")%></option><%
                                }
                                %>
                        </select>
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
            LocalDate fechaIngresada = LocalDate.parse(request.getParameter("fecha"));
            buscador.EditarLaboratorista(request.getParameter("codigo"), request.getParameter("nombre"),
                    request.getParameter("registro"), request.getParameter("DPI"), request.getParameter("telefono"), request.getParameter("correo"),
                    fechaIngresada, request.getParameter("password"), Integer.parseInt(request.getParameter("examen")));
            response.sendRedirect("EditarLaboratorista.jsp");
            session.setAttribute("Laboratorista", codigoLaboratorista);

        } catch (Exception e) {
        }


    %>

</html>

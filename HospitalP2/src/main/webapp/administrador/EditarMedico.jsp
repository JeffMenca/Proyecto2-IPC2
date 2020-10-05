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
        <title>Editar Medico</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <script>
            function exito() {
                alert("Medico editado con exito");
            }
        </script>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" id="Form1" action="EditarMedico.jsp">
            <%
                String medico;
                try {
                    medico = request.getParameter("codigo");
                } catch (Exception e) {
                    medico = String.valueOf(session.getAttribute("Medico"));
                }
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("Medico", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoMedico = String.valueOf(session.getAttribute("Medico"));
                BuscarEnDB buscador = new BuscarEnDB();
                ResultSet resultset = buscador.BuscarMedicos(codigoMedico);
                String nombre = "", colegiado = "", DPI = "", telefono = "", correo = "", password = "",
                        horaEntradaCaracter = "", horaSalidaCaracter = "";
                LocalDate fecha = null;
                LocalTime horaEntrada = null, horaSalida = null;
                while (resultset.next()) {
                    nombre = resultset.getString("nombre");
                    colegiado = resultset.getString("numero_colegiado");
                    DPI = resultset.getString("DPI");
                    telefono = resultset.getString("telefono");
                    correo = resultset.getString("correo");
                    horaEntradaCaracter = String.valueOf(resultset.getTime("horario_entrada"));
                    horaEntrada = LocalTime.parse(horaEntradaCaracter);
                    horaSalidaCaracter = String.valueOf(resultset.getTime("horario_salida"));
                    horaSalida = LocalTime.parse(horaSalidaCaracter);
                    String fechaCaracter = String.valueOf(resultset.getDate("inicio_trabajo"));
                    fecha = LocalDate.parse(fechaCaracter);
                    password = Encriptar.desencriptar(resultset.getString("password"));
                }

            %>
            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Editar Medico</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" value="<%= codigoMedico%>" readonly>
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
                        <label for="fname">Numero de colegiado</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcolegiado" name="colegiado" value="<%= colegiado%>" required >
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
                        <label for="fname">Hora de entrada</label>
                    </div>
                    <div class="col-77">
                        <input type="time" id="appt" value="<%= horaEntradaCaracter%>" name="horaentrada"
                               required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Hora de salida</label>
                    </div>
                    <div class="col-77">
                        <input type="time" id="appt" value="<%= horaSalidaCaracter%>" name="horasalida"
                               required>
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
                    <br> 
                    <input type="submit" class="button2" name="botonEditar" onclick="exito()" value="Editar examen de laboratorio">
                </div>

            </div>

        </form>

    </body>
    <%
        try {

            LocalTime horaEntradaIngresada = LocalTime.parse(request.getParameter("horaentrada"));
            LocalTime horaSalidaIngresada = LocalTime.parse(request.getParameter("horasalida"));
            response.sendRedirect("EditarMedico.jsp");
            session.setAttribute("Medico", codigoMedico);
            if ((horaEntradaIngresada.isBefore(horaSalidaIngresada))) {
                LocalDate fechaIngresada = LocalDate.parse(request.getParameter("fecha"));
                buscador.EditarMedico(codigoMedico, request.getParameter("nombre"), request.getParameter("colegiado"), request.getParameter("DPI"),
                        request.getParameter("telefono"), request.getParameter("correo"), horaEntradaIngresada, horaSalidaIngresada, fechaIngresada, request.getParameter("password"));
            }
            

        } catch (Exception e) {
        }


    %>

</html>

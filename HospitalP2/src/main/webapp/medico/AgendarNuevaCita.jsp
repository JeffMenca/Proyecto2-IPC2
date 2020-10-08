<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="Logica.BuscarEnDB1"%>
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
        <title>Agendar cita</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <%@include  file="MenuNavigator2.html" %>
        <form method="GET" action="AgendarNuevaCita.jsp">
            <%
                String codigoMedico = String.valueOf(session.getAttribute("username"));
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("Medico", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoPaciente = String.valueOf(session.getAttribute("Medico"));
                BuscarEnDB buscador = new BuscarEnDB();
                BuscarEnDB1 buscador2 = new BuscarEnDB1();
                ResultSet resultset = buscador2.BuscarMedico(codigoMedico);
                String nombre = "", costo = "", especialidad = "", consulta = "";
                while (resultset.next()) {
                    nombre = resultset.getString("nombre");
                    costo = resultset.getString("costo");
                    especialidad = resultset.getString("especialidad_nombre");
                }
                ResultSet resultset2 = buscador.BuscarConsultaEspecialidad(especialidad);
                while (resultset2.next()) {
                    consulta = resultset2.getString("codigo");
                }
            %>
            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Programar cita de consulta</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Medico</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="lastname" value="<%= nombre%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Precio</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcosto" name="lastname" value="<%= costo%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="country">Tipo de consulta</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lespecialidad" name="lastname" value="<%= especialidad%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Fecha de la cita</label>
                    </div>
                    <div class="col-77">
                        <input  type="date" name="fecha"
                                value="<%= LocalDate.now()%>"
                                min="<%= LocalDate.now()%>" max="2050-12-31">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Verificar disponibilidad de fecha</label>
                    </div>
                    <div class="col-77">
                        <input type="submit" class="button1" value="Ver disponibilidad" name="disponible">
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Horas disponibles</label>
                    </div>
                    <div class="col-77">
                        <select id="country" name="horas">
                            <%
                                if (!(request.getParameter("disponible") == null)) {
                                    LocalDate fecha = LocalDate.parse(request.getParameter("fecha"));
                                    HorarioMedico horario = new HorarioMedico(codigoMedico, fecha);
                                    ArrayList listahoras = horario.comprobarDisponibilidad();
                                    if (listahoras.size() == 0) {
                            %><option value="error" >No existen horas disponibles en esa fecha</option><%
                                }
                                for (int i = 0; i < listahoras.size(); i++) {
                            %><option value="<%= listahoras.get(i)%>"><%= listahoras.get(i)%></option><%
                                }
                            } else {
                            %><option value="error" >No ha comprobado disponibilidad</option><%
                                }

                                %>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <br> 
                    <input type="submit" class="button2" name="citar" value="Programar cita">
                </div>

            </div>

        </form>

    </body>
    <%        try {

            if (!(request.getParameter("horas").equals("error")) && (request.getParameter("citar") != null)) {

                LocalDate fechaIngresada = LocalDate.parse(request.getParameter("fecha"));
                LocalTime horaIngresada = LocalTime.parse(request.getParameter("horas"));
                int consultaIngresada = Integer.valueOf(consulta);
                try {
                    Cita_Consulta_Medica nuevaConsulta = new Cita_Consulta_Medica(0, fechaIngresada, horaIngresada,
                            consultaIngresada, codigoPaciente, codigoMedico);
    %> 
    <div class="alert1">
        <span class="closebtn"> 
            <strong>Creado</strong> La cita se creo exitosamente
    </div>
    <%
                } catch (Exception e) {
                }

            }

        } catch (Exception e) {
        }


    %>
</html>

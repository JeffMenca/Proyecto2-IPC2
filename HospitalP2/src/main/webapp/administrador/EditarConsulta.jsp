<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

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
        <script>
        function exito() {
            alert("Consulta editada con exito");
        }
      </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Consulta</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" id="Form1" action="EditarConsulta.jsp">
            <%
                int consulta;
                try {
                    consulta = Integer.parseInt(request.getParameter("codigo"));
                } catch (Exception e) {
                    String codigo = String.valueOf(session.getAttribute("Consulta"));
                    consulta = Integer.parseInt(codigo);
                }
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("Consulta", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoConsulta = String.valueOf(session.getAttribute("Consulta"));
                BuscarEnDB buscador = new BuscarEnDB();
                ResultSet resultset = buscador.BuscarConsulta(Integer.parseInt(codigoConsulta));
                String especialidad = "";
                Double costo = 1.00;
                while (resultset.next()) {
                    especialidad = resultset.getString("especialidad_nombre");
                    costo = resultset.getDouble("costo");
                }

            %>
            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Editar consulta medica</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" value="<%= codigoConsulta%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Especialidad</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="especialidad" value="<%= especialidad%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="country">Costo</label>
                    </div>
                    <div class="col-77">
                        <input type="number" name="costo"  step="0.01" min="0" value="<%=costo%>" required/>
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
        boolean resultado;
        try {
            Double.parseDouble(request.getParameter("costo"));
            resultado = true;
        } catch (Exception excepcion) {
            resultado = false;
        }
        try {
            if (!(request.getParameter("costo") == null) && !(resultado == false)) {
                
                buscador.EditarConsulta(Integer.parseInt(codigoConsulta),request.getParameter("especialidad"),Double.parseDouble(request.getParameter("costo")));
                response.sendRedirect("EditarConsulta.jsp");
                session.setAttribute("Consulta", codigoConsulta);

            }

        } catch (Exception e) {
        }


    %>

</html>

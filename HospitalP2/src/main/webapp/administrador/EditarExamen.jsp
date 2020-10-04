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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agendar cita</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <script>
            function exito() {
                alert("Examen editado con exito");
            }
        </script>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" id="Form1" action="EditarExamen.jsp">
            <%
                int examen_codigo;
                try {
                    examen_codigo = Integer.parseInt(request.getParameter("codigo"));
                } catch (Exception e) {
                    String codigo = String.valueOf(session.getAttribute("Examen"));
                    examen_codigo = Integer.parseInt(codigo);
                }
                String codigo = request.getParameter("codigo");
                try {
                    if (!codigo.equals("")) {
                        session.setAttribute("Examen", request.getParameter("codigo"));
                    }
                } catch (Exception e) {
                }

                String codigoExamen = String.valueOf(session.getAttribute("Examen"));
                BuscarEnDB buscador = new BuscarEnDB();
                ResultSet resultset = buscador.BuscarExamen(Integer.parseInt(codigoExamen));
                String nombre = "", descripcion = "", informe1 = "", informe2 = "", orden = "", orden2 = "";
                Double costo = 1.00;
                while (resultset.next()) {
                    nombre = resultset.getString("nombre");
                    costo = resultset.getDouble("costo");
                    descripcion = resultset.getString("descripcion");
                    if (resultset.getInt("orden") == 1) {
                        orden = "Si";
                        orden2 = "No";
                    } else {
                        orden = "No";
                        orden2 = "Si";
                    }
                    if (resultset.getString("tipo_informe").equals("PDF")) {
                        informe1 = "PDF";
                        informe2 = "JPG";
                    } else {
                        informe1 = "JPG";
                        informe2 = "PDF";
                    }
                }

            %>
            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Editar examen de laboratorio</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Codigo</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" value="<%= codigoExamen%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Nombre</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="nombre" value="<%= nombre%>" required>
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
                    <div class="col-25">
                        <label for="fname">Necesita orden de medico?</label>
                    </div>
                    <div class="col-77">
                        <select id="country" name="orden">
                            <option value="<%= orden%>" ><%= orden%></option>  
                            <option value="<%= orden2%>" ><%= orden2%></option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Tipo de informe</label>
                    </div>
                    <div class="col-77">
                        <select id="country" name="tipo">
                            <option value="<%= informe1%>" ><%= informe1%></option>  
                            <option value="<%= informe2%>" ><%= informe2%></option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="subject">Descripcion</label>
                    </div>
                    <div class="col-77">
                        <textarea id="subject" name="descripcion" required style="height:150px"><%= descripcion%></textarea>
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
        boolean informe;
        try {
            Double.parseDouble(request.getParameter("costo"));
            resultado = true;
        } catch (Exception excepcion) {
            resultado = false;
        }
        try {
            if (!(request.getParameter("nombre") == null) && !(request.getParameter("costo") == null) && !(resultado == false)) {
                if (request.getParameter("orden").equals("Si")) {
                    informe = true;
                } else {
                    informe = false;
                }
                buscador.EditarExamenLaboratorio(Integer.parseInt(codigoExamen), request.getParameter("nombre"), informe, request.getParameter("descripcion"), Double.parseDouble(request.getParameter("costo")), request.getParameter("tipo"));
                response.sendRedirect("EditarExamen.jsp");
                session.setAttribute("Examen", codigoExamen);

            }

        } catch (Exception e) {
        }


    %>

</html>

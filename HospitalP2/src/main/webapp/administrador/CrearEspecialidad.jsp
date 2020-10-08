<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="Entidades.Especializacion"%>
<%@page import="Entidades.Consulta_Medica"%>
<%@page import="Entidades.Especialidad"%>
<%@page import="java.sql.Statement"%>
<%@page import="SQLConnector.DbConnection"%>
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
        <title>Crear especialidad</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <script>
            function exito() {
                alert("Admin editado con exito");
            }
        </script>
        <%@include  file="MenuNavigator4.html" %>
        <form method="GET" id="Form1" action="CrearEspecialidad.jsp">
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
                String nombre = "";
                LocalDate fecha = null;
                while (resultset.next()) {
                    nombre = resultset.getString("nombre");
                }

            %>
            <br> <br> <br> <br> <br> <br> <br> 

            <div class="container">
                <h1>Editar Administrador</h1>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Medico</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lcodigo" name="codigo" value="<%= codigoMedico%>" readonly>
                    </div>
                </div>
                <div class="row">
                    <div class="col-25">
                        <label for="fname">Nombre de la especialidad</label>
                    </div>
                    <div class="col-77">
                        <input type="text" id="lname" name="especialidad" placeholder="Nombre de la especialidad" required >
                    </div>
                </div>

                <div class="row">
                    <br> 
                    <input type="submit" class="button2" name="boton" value="Crear especialidad">
                </div>

            </div>

        </form>

    </body>
    <%
        try {
            if (!(request.getParameter("boton") == null)) {

                try {
                    String queryselect = "SELECT * FROM ESPECIALIDAD WHERE nombre='" + request.getParameter("especialidad") + "'";
                    Statement statements = DbConnection.getConnection().createStatement();
                    resultset = statements.executeQuery(queryselect);
                    if (resultset.getRow() == 0) {
                        Especialidad nuevaEspecialidad = new Especialidad(request.getParameter("especialidad"));
                        Consulta_Medica nuevaConsultaMedica = new Consulta_Medica(0, 100, request.getParameter("especialidad"));
    %> 
    <div class="alert1">
        <span class="closebtn"> 
            <strong>Creado</strong> La especialidad se agrego correctamente al medico
    </div>
    <%
                    }
                } catch (Exception e) {
                }
                Especializacion nuevaEspecializacion = new Especializacion(request.getParameter("especialidad"), codigoMedico);
            }

        } catch (Exception e) {
        }


    %>

</html>

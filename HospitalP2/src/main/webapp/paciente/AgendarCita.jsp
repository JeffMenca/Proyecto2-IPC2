<%-- 
    Document   : AgendarCita
    Created on : 1/10/2020, 00:31:40
    Author     : jeffrey
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../styles/AgendarCitaStyle.css">
    </head>
    <body>
        <%@include  file="MenuNavigator.html" %>
        <br> <br> <br> <br> <br> <br> <br> 
    
            <div class="container">
                <h1>Programar cita de consulta</h1>
                <form action="/action_page.php">
                    <div class="row">
                        <div class="col-25">
                            <label for="fname">Medico</label>
                        </div>
                        <div class="col-77">
                            <input class="date" type="date" id="start" name="trip-start"
                                   value="2018-07-22"
                                   min="2018-01-01" max="2018-12-31">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="fname">Precio</label>
                        </div>
                        <div class="col-77">
                            <input class="date" type="date" id="start" name="trip-start"
                                   value="2018-07-22"
                                   min="2018-01-01" max="2018-12-31">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="fname">Fecha de la cita</label>
                        </div>
                        <div class="col-77">
                            <input class="date" type="date" id="start" name="trip-start"
                                   value="2018-07-22"
                                   min="2018-01-01" max="2018-12-31">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="lname">Hora de la cita</label>
                        </div>
                        <div class="col-77">
                            <input class="time" id="appt-time" type="time" name="appt-time" value="13:30">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-25">
                            <label for="country">Tipo de consulta</label>
                        </div>
                        <div class="col-77">
                            <select id="country" name="country">
                                <option value="australia">Australia</option>
                                <option value="canada">Canada</option>
                                <option value="usa">USA</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <br> 
                        <input type="submit" value="Guardar">
                        <input type="submit" value="Guardar">
                    </div>
                </form>
            </div>







            </body>
            <%
                String codigoMedico = request.getParameter("codigo");
                String codigoPaciente = String.valueOf(session.getAttribute("username"));
            %>
            </html>

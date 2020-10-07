/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entidades.Cita_Examen_Laboratorio;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

/**
 *
 * @author jeffrey
 */
@WebServlet(name = "ServletAgendarExamen", urlPatterns = {"/ServletAgendarExamen"})
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class ServletAgendarExamen extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletAgendarExamen</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletAgendarExamen at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            if (!(request.getParameter("horas").equals("error"))) {
                String codigoPaciente = String.valueOf(request.getSession().getAttribute("username"));
                String codigoLaboratorista = String.valueOf(request.getSession().getAttribute("Laboratorista"));
                String ordenString = String.valueOf(request.getSession().getAttribute("Orden"));
                int ordenNecesaria = Integer.parseInt(ordenString);
                String fecha=String.valueOf(request.getSession().getAttribute("Fecha"));
                LocalDate fechaIngresada = LocalDate.parse(fecha);
                LocalTime horaIngresada = LocalTime.parse(request.getParameter("horas"));
                Part archivo = request.getPart("file");

                InputStream fileStream = null;
                try {
                    fileStream = archivo.getInputStream();
                } catch (Exception e) {
                }
                if (fileStream != null) {
                    try {

                        Cita_Examen_Laboratorio nuevoExamen = new Cita_Examen_Laboratorio(0, fechaIngresada, horaIngresada, codigoPaciente,
                                fileStream, codigoLaboratorista);
                        response.sendRedirect("paciente/MensajeExito.jsp?mensaje=Cita Agendada con exito");

                    } catch (Exception e) {
                    }
                } else if ((fileStream == null) && (ordenNecesaria == 0)) {
                    try {

                        Cita_Examen_Laboratorio nuevoExamen = new Cita_Examen_Laboratorio(0, fechaIngresada, horaIngresada, codigoPaciente,
                                fileStream, codigoLaboratorista);
                        response.sendRedirect("paciente/MensajeExito.jsp?mensaje= Cita programada exitosamente");

                    } catch (Exception e) {
                    }
                }

            }

        } catch (Exception e) {
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

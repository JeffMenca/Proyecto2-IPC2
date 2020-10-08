/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entidades.Informe_Examen_Laboratorio;
import SQLConnector.DbConnection;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.time.LocalTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jeffrey
 */
@WebServlet(name = "ServletReporteExamen", urlPatterns = {"/ServletReporteExamen"})
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class ServletReporteExamen extends HttpServlet {

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
            out.println("<title>Servlet ServletReporteExamen</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletReporteExamen at " + request.getContextPath() + "</h1>");
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
        if (request.getParameter("buttonSubmit") != null) {

            try {
                String codigoLaboratorista = String.valueOf(request.getSession().getAttribute("username"));
                String codigoCitaConsulta = String.valueOf(request.getSession().getAttribute("CitaExamen"));
                String examenCodigoString = String.valueOf(request.getSession().getAttribute("ExamenCodigo"));
                int examenCodigo = Integer.parseInt(examenCodigoString);
                String codigoPaciente = String.valueOf(request.getSession().getAttribute("CodigoPaciente"));
                Informe_Examen_Laboratorio nuevoInforme = new Informe_Examen_Laboratorio(0, request.getParameter("descripcion"),
                        LocalDate.now(), LocalTime.now(), examenCodigo, codigoPaciente, codigoLaboratorista);
                String citaEliminar = String.valueOf(codigoCitaConsulta);
                String queryEliminar = "DELETE FROM CITA_EXAMEN_LABORATORIO WHERE codigo=?";
                PreparedStatement statement = DbConnection.getConnection().prepareStatement(queryEliminar);
                statement.setString(1, citaEliminar);
                statement.execute();
                statement.close();
                //Crea una carpeta para guardar los pdfs
                File directorio = new File(getServletContext().getRealPath(File.separator) + "/Examenes");
                if (!directorio.exists()) {
                    directorio.mkdirs();
                }
                String path = getServletContext().getRealPath(File.separator) + "/Examenes/examen" + codigoPaciente + examenCodigo + ".pdf";
                PdfWriter writer = new PdfWriter(path);
                PdfDocument pdfDoc = new PdfDocument(writer);
                Document document = new Document(pdfDoc);
                String orden_m = "Codigo del examen : " + examenCodigo;
                String doctor = "Codigo del Laboratorista que genero la orden : " + codigoLaboratorista;
                String paciente = "Codigo del paciente que debe realizar examen: " + codigoPaciente;
                String desc = "Descripcion: " + request.getParameter("descripcion");
                Paragraph para1 = new Paragraph(orden_m);
                Paragraph para2 = new Paragraph(doctor);
                Paragraph para3 = new Paragraph(paciente);
                Paragraph para4 = new Paragraph(desc);
                document.add(para1);
                document.add(para2);
                document.add(para3);
                document.add(para4);
                document.close();
                String pdfFileName = "Examenes/examen" + codigoPaciente + examenCodigo + ".pdf";
                String contextPath = getServletContext().getRealPath(File.separator);
                File pdfFile = new File(contextPath + pdfFileName);

                response.setContentType("application/pdf");
                response.addHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
                response.setContentLength((int) pdfFile.length());

                FileInputStream fileInputStream = new FileInputStream(pdfFile);
                OutputStream responseOutputStream = response.getOutputStream();
                int bytes;
                while ((bytes = fileInputStream.read()) != -1) {
                    responseOutputStream.write(bytes);
                }
                response.sendRedirect("laboratorista/MensajeExito.jsp?mensaje= Examen generado exitosamente");

            } catch (Exception e) {
            }
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

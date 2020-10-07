/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entidades.Orden_Examen;
import Entidades.Orden_PDF;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

/**
 *
 * @author jeffrey
 */
@WebServlet(name = "CrearOrden", urlPatterns = {"/CrearOrden"})
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class ServletCrearOrden extends HttpServlet {

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
            out.println("<title>Servlet CrearOrden</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrearOrden at " + request.getContextPath() + "</h1>");
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
            String codigoMedico = String.valueOf(request.getSession().getAttribute("username"));
            String codigoPaciente = String.valueOf(request.getSession().getAttribute("CodigoPaciente"));
            if (request.getParameter("nombre") != "dato") {

                try {

                    Orden_Examen nuevaOrden = new Orden_Examen(0, request.getParameter("descripcion"), codigoPaciente, codigoMedico,
                            Integer.parseInt(request.getParameter("examen")));
                    int codigoOrden = nuevaOrden.insertarOrden_Examen();
                    //Crea una carpeta para guardar los pdfs
                    File directorio = new File(getServletContext().getRealPath(File.separator) + "/Ordenes");
                    if (!directorio.exists()) {
                        directorio.mkdirs();
                    }
                    String path = getServletContext().getRealPath(File.separator) + "/Ordenes/orden" + codigoPaciente + codigoOrden + ".pdf";
                    PdfWriter writer = new PdfWriter(path);
                    PdfDocument pdfDoc = new PdfDocument(writer);
                    Document document = new Document(pdfDoc);
                    String orden_m = "Codigo de la orden : " + codigoOrden;
                    String doctor = "Codigo del medico que genero la orden : " + codigoMedico;
                    String paciente = "Codigo del paciente que debe realizar examen: " + codigoPaciente;
                    String examen = "Codigo de examen: " + Integer.parseInt(request.getParameter("examen"));
                    String desc = "Descripcion: " + request.getParameter("descripcion");
                    Paragraph para1 = new Paragraph(orden_m);
                    Paragraph para2 = new Paragraph(doctor);
                    Paragraph para3 = new Paragraph(paciente);
                    Paragraph para4 = new Paragraph(examen);
                    Paragraph para5 = new Paragraph(desc);
                    document.add(para1);
                    document.add(para2);
                    document.add(para3);
                    document.add(para4);
                    document.add(para5);
                    document.close();
                    String pdfFileName = "Ordenes/orden" + codigoPaciente + codigoOrden + ".pdf";
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
                    Orden_PDF nuevoPDF=new Orden_PDF(fileInputStream, codigoOrden);
                    response.sendRedirect("medico/MensajeExito.jsp?mensaje= Orden generada exitosamente");

                } catch (Exception e) {
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

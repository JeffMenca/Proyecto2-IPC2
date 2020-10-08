/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Logica.BuscarEnDB1;
import SQLConnector.DbConnection;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.Statement;
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
@WebServlet(name = "ServletDescargarOrden", urlPatterns = {"/ServletDescargarOrden"})
@MultipartConfig(location = "/tmp", fileSizeThreshold = 1024 * 1024, maxFileSize = 1024 * 1024 * 5, maxRequestSize = 1024 * 1024 * 5 * 5)
public class ServletDescargarOrden extends HttpServlet {

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
            out.println("<title>Servlet ServletDescargarOrden</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletDescargarOrden at " + request.getContextPath() + "</h1>");
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
        String codigoPaciente = String.valueOf(request.getSession().getAttribute("username"));
        String codigoOrden = String.valueOf(request.getParameter("ordenExamen"));
        String descripcion = "", codigoMedico = "", nombre = "";
        String queryselect = "SELECT O.*,E.nombre FROM ORDEN_EXAMEN O INNER JOIN EXAMEN_LABORATORIO E ON "
                + "E.codigo=O.examen_laboratorio_codigo WHERE O.codigo='" + codigoOrden + "' && O.paciente_codigo='" + codigoPaciente + "'";
        try {
            Statement statements = DbConnection.getConnection().createStatement();
            ResultSet resultset01 = statements.executeQuery(queryselect);
            while (resultset01.next()) {
                descripcion = resultset01.getString("descripcion");
                nombre = resultset01.getString("nombre");
                codigoMedico = resultset01.getString("medico_codigo");
            }
            //Crea una carpeta para guardar los pdfs
            File directorio = new File(getServletContext().getRealPath(File.separator) + "/OrdenesPaciente");
            if (!directorio.exists()) {
                directorio.mkdirs();
            }
            String path = getServletContext().getRealPath(File.separator) + "/OrdenesPaciente/orden" + codigoPaciente + codigoOrden + ".pdf";
            PdfWriter writer = new PdfWriter(path);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);
            String orden = "Codigo de la orden : " + codigoOrden;
            String doctor = "Codigo del medico que genero la orden : " + codigoMedico;
            String paciente = "Codigo del paciente que debe realizar examen: " + codigoPaciente;
            String examen = "Examen: " + nombre;
            String desc = "Descripcion: " + descripcion;
            Paragraph para1 = new Paragraph(orden);
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
            String pdfFileName = "OrdenesPaciente/orden" + codigoPaciente + codigoOrden + ".pdf";
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
            response.sendRedirect("paciente/MensajeExito.jsp?mensaje= Orden descargada exitosamente");
        } catch (Exception e) {
        }

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

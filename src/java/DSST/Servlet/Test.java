/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Servlet;

import DSST.Model.Model;
import DSST.Model.Project;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jab-PC
 */
public class Test extends HttpServlet {

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
//        Project pj = new Project();
//        ArrayList<Project> list = pj.getProductTable(250);
//        request.setAttribute("list", list);
//        ArrayList<Project> table = pj.getTable(250);
//        request.setAttribute("table", table);
//        getServletContext().getRequestDispatcher(response.encodeURL("/newjsp.jsp")).forward(request, response);
        
       
                        
                        double scoreA = 0.0;
                        double scoreB = 1.0;
                        if (scoreA - scoreB == 0.00) {
                            System.out.printf("1");
                        } else if (0.00 < (scoreA - scoreB) && (scoreA - scoreB) < 0.31) {
                            System.out.printf("3");
                        } else if (0.31 <= (scoreA - scoreB) && (scoreA - scoreB) < 0.51) {
                            System.out.printf("5");
                        } else if (0.51 <= (scoreA - scoreB) && (scoreA - scoreB) < 0.71) {
                            System.out.printf("7");
                        } else if (0.71 <= (scoreA - scoreB) && (scoreA - scoreB) <= 1.00) {
                            System.out.printf("9");
                        } else if (0.00 > (scoreA - scoreB) && (scoreA - scoreB) > -0.31) {
                            System.out.printf("-3");
                        } else if (-0.31 >= (scoreA - scoreB) && (scoreA - scoreB) > -0.51) {
                            System.out.printf("-5");
                        } else if (-0.51 >= (scoreA - scoreB) && (scoreA - scoreB) > -0.71) {
                            System.out.printf("-7");
                        } else if (-0.71 >= (scoreA - scoreB) && (scoreA - scoreB) >= -1.00) {
                            System.out.printf("-9");
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
        processRequest(request, response);
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

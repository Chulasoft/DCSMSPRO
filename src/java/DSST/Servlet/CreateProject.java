/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Servlet;

import DSST.Model.Member;
import DSST.Model.Model;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jab
 */
public class CreateProject extends HttpServlet {

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
        String viewAgent = "/WEB-INF/project/project_1.jsp";
        String page = request.getParameter("page");
        String msg = "";
        HttpSession ss = request.getSession();
        
        Member mem = (Member) ss.getAttribute("login");
//        if (page != null) {
//            if (page.equals("1")) {
//
//                String modelName = request.getParameter("model_name");
//                String goal = request.getParameter("goal");
//                String goal_des = request.getParameter("goal_des");
//                mo = Model.initialModel(modelName, goal, goal_des, mem.getMem_id());
//                ss.setAttribute("mo", mo);
//                viewAgent = "/WEB-INF/model/model_2.jsp";
//            }
//            else if (page.equals("2")) {
//            
//            } else if (page.equals("3")) {
//          
//            } else if (page.equals("4")) {
//
//            } else if (page.equals("5")) {
//
//            }
//        }
        getServletContext().getRequestDispatcher(response.encodeURL(viewAgent)).forward(request, response);
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Servlet;

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
 * @author Jab-PC
 */
public class EditModel extends HttpServlet {

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
        String viewAgent = "/WEB-INF/edit_model/eModel_1.jsp";
        String page = request.getParameter("page");
        HttpSession ss = request.getSession();
        if (page != null) {
            if (page.equals("1")) {
                Model em = new Model();
                if(request.getParameter("model_name")!=null){
                em.setModel_id(Integer.parseInt(ss.getAttribute("model_id") + ""));
                em.setModel_name(request.getParameter("model_name"));
                em.setModel_goal(request.getParameter("goal"));
                em.setModel_goal_des(request.getParameter("goal_des"));
                em.updateModel(em);
                }
                em = em.getModelByID(Integer.parseInt(ss.getAttribute("model_id") + ""));
                request.setAttribute("m", em);
                viewAgent = "/WEB-INF/edit_model/eModel_1.jsp";
            } else if (page.equals("2")) {
                
            } else if (page.equals("3")) {
                
            } 
        } else {
            String model_id = request.getParameter("modelId");
            Model m = new Model();
            m = m.getModelByID(Integer.parseInt(model_id));
            ss.setAttribute("model_id", model_id);
            request.setAttribute("m", m);
        }

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

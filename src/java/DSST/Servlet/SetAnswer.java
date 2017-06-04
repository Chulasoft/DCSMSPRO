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
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jab-PC
 */
public class SetAnswer extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String viewAgent = "";
        HttpSession ss = request.getSession();

        if (request.getParameter("ans") != null) {
            String ans[] = request.getParameterValues("ans");
            Model m = new Model();
            m.delAlterSpecByID(Integer.parseInt(request.getParameter("who")));
            for (int i = 0; i < ans.length; i++) {
                int colon = ans[i].indexOf(':');
                String ques_id = ans[i].substring(0, colon);
                String answer = ans[i].substring(colon + 1);
                Member login = (Member) ss.getAttribute("login");
                m.setAns(answer, login.getName(), Integer.parseInt(ques_id), Integer.parseInt(request.getParameter("who")));
            }
            ArrayList<Model> listAlter = new ArrayList();
            listAlter = m.getAlterById(Integer.parseInt(ss.getAttribute("model_id") + ""));
            request.setAttribute("listAlter", listAlter);
            viewAgent = "/WEB-INF/edit_model/eModel_6.jsp";
        } else {
            String who = request.getParameter("ra_id");
            String whoName = request.getParameter("ra");
            Model m = new Model();
            ArrayList<Model> listQuest = m.getAllQuest(Integer.parseInt(ss.getAttribute("model_id") + ""));
            request.setAttribute("listQuest", listQuest);
            request.setAttribute("whoName", whoName);
            request.setAttribute("who", who);
            viewAgent = "/WEB-INF/edit_model/eModel_define_spec.jsp";
        }
        getServletContext().getRequestDispatcher(viewAgent).forward(request, response);
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

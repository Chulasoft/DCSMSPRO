/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Servlet;

import DSST.Model.Member;
import DSST.Model.Model;
import DSST.Model.Project;
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
 * @author Jab
 */
public class ProjectMenu extends HttpServlet {

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
        String viewAgent = "/WEB-INF/project/project_main.jsp";
        String msg = "Unfinished Project";
        Project pj = new Project();
        HttpSession ss = request.getSession();
        Member user = (Member) ss.getAttribute("login");
        
        ArrayList<Project> listProjects = pj.getProject(user.getMem_id());
        if (request.getParameter("pId")!= null) {
            String pId = request.getParameter("pId");
            if (!pj.getProductTable(Integer.parseInt(pId)).isEmpty()) {
                ArrayList<Project> table = pj.getTable(Integer.parseInt(pId));
                request.setAttribute("table", table);
                ArrayList<Project> list = pj.getProductTable(Integer.parseInt(pId));
                request.setAttribute("list", list);
            } else {
                request.setAttribute("msg", msg);
            }
            pj = pj.findProject(Integer.parseInt(pId));
            request.setAttribute("pj", pj);
            request.setAttribute("listProjects", listProjects);
        }else{
            String pId = listProjects.get(0).getProj_id()+"";
            if (!pj.getProductTable(Integer.parseInt(pId)).isEmpty()) {
                ArrayList<Project> table = pj.getTable(Integer.parseInt(pId));
                request.setAttribute("table", table);
                ArrayList<Project> list = pj.getProductTable(Integer.parseInt(pId));
                request.setAttribute("list", list);
            } else {
                request.setAttribute("msg", msg);
            }
            pj = pj.findProject(Integer.parseInt(pId));
            request.setAttribute("pj", pj);
            request.setAttribute("listProjects", listProjects);
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

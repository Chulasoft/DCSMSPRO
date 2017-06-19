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
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Soft-PC
 */
public class EditProject extends HttpServlet {

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
        String viewAgent = "/WEB-INF/edit_project/eProject_1.jsp";
        String page = request.getParameter("page");
        HttpSession ss = request.getSession();
        if (page != null) {
            if (page.equals("1")) {
                Project pj = new Project();
                if (request.getParameter("proName") != null) {
                    String proName = request.getParameter("proName");
                    String proDes = request.getParameter("proDes");
                    String m_id = request.getParameter("proModel");
                    pj.updateProject(Integer.parseInt(ss.getAttribute("editProID") + ""), proName, proDes, Integer.parseInt(m_id));
                }
                pj = pj.getProjectForUpdate(Integer.parseInt(ss.getAttribute("editProID") + ""));
                request.setAttribute("pj", pj);
                Member mem = (Member) ss.getAttribute("login");
                Model m = new Model();
                ArrayList<Model> am = new ArrayList();
                try {
                    ArrayList<Model> ListAllMo = new ArrayList();
                    ListAllMo = m.getModels(Integer.parseInt(mem.getGroup()));
                    for (Model pubMo : ListAllMo) {
                        if (pubMo.isPublish()) {
                            am.add(pubMo);
                        }
                    }
                    request.setAttribute("am", am);
                } catch (Exception e) {
                    System.out.println(e);
                }
            } else if (page.equals("2")) {
                Project pj = new Project();
                if (request.getParameter("fromEditPage") != null) {
                    pj.delProAlter(Integer.parseInt(ss.getAttribute("editProID") + ""));
                    if (request.getParameter("chosenAL") != null) {

                        String chosenAL[] = request.getParameterValues("chosenAL");
                        for (int i = 0; i < chosenAL.length; i++) {
                            pj.setAlter(Integer.parseInt(chosenAL[i]), Integer.parseInt(ss.getAttribute("editProID") + ""));
                        }
                    }
                }
                ArrayList<Integer> listproAL = pj.getProAL(Integer.parseInt(ss.getAttribute("editProID") + ""));
                ArrayList<Integer> array_al_id = pj.getAL_ID(Integer.parseInt(ss.getAttribute("editProM_id") + ""));
                ArrayList<String> al_name_want = new ArrayList();
                for (int id : array_al_id) {
                    al_name_want.add(pj.getALNameByID(id));
                }
                request.setAttribute("listproAL", listproAL);
                request.setAttribute("array_al_id", array_al_id);
                request.setAttribute("al_name_want", al_name_want);
                viewAgent = "/WEB-INF/edit_project/eProject_2.jsp";
            }
        } else {
            String editProID = request.getParameter("projectId");
            Project pj = new Project();
            pj = pj.getProjectForUpdate(Integer.parseInt(editProID));
            request.setAttribute("pj", pj);
            ss.setAttribute("editProID", editProID);
            ss.setAttribute("editProM_id", pj.getProj_m_id());
            Member mem = (Member) ss.getAttribute("login");
            Model m = new Model();
            ArrayList<Model> am = new ArrayList();
            try {
                ArrayList<Model> ListAllMo = new ArrayList();
                ListAllMo = m.getModels(Integer.parseInt(mem.getGroup()));
                for (Model pubMo : ListAllMo) {
                    if (pubMo.isPublish()) {
                        am.add(pubMo);
                    }
                }
                request.setAttribute("am", am);
            } catch (Exception e) {
                System.out.println(e);
            }
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

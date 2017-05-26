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
public class CreateModel extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    Model mo = new Model();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String viewAgent = "/WEB-INF/model/model_1.jsp";
        String page = request.getParameter("page");
        String msg = "";
        HttpSession ss = request.getSession();
        
        Member mem = (Member) ss.getAttribute("login");
        if (page != null) {
            if (page.equals("1")) {

                String modelName = request.getParameter("model_name");
                String goal = request.getParameter("goal");
                String goal_des = request.getParameter("goal_des");
                mo = Model.initialModel(modelName, goal, goal_des, mem.getMem_id());
                ss.setAttribute("mo", mo);
                viewAgent = "/WEB-INF/model/model_2.jsp";
            
            } else if (page.equals("2")) {

                String cri[] = request.getParameterValues("cri");
                String criDes[] = request.getParameterValues("criDes");
                int cri_id[] = new int[cri.length];
                for (int i = 0; i < cri.length; i++) {
                    System.out.println(cri[i]);
                    cri_id[i] = mo.setCriteria(mo.getModel_id(), cri[i], criDes[i]);
                };
                ss.setAttribute("cri", cri);
                ss.setAttribute("cri_id", cri_id);
                viewAgent = "/WEB-INF/model/model_3.jsp";
            
            } else if (page.equals("3")) {

                int cri_id[] = (int[]) ss.getAttribute("cri_id");
                for (int i = 0; i < cri_id.length; i++) {
                    if (request.getParameterValues("scri" + cri_id[i]) != null) {
                        String scri[] = request.getParameterValues("scri" + cri_id[i]);
                        String scriDes[] = request.getParameterValues("scriDes" + cri_id[i]);
                        int sub_id[] = new int[scri.length];
                        for (int j = 0; j < scri.length; j++) {
                            sub_id[j] = mo.setSubCriteria(cri_id[i], scri[j], scriDes[j]);
                        }
                        ss.setAttribute("sub_id" + cri_id[i], sub_id);
                        ss.setAttribute("scri" + cri_id[i], scri);
                    }
                }
                viewAgent = "/WEB-INF/model/model_4.jsp";
            
            } else if (page.equals("4")) {
                int cri_id[] = (int[]) ss.getAttribute("cri_id");
                for (int i = 0; i < cri_id.length; i++) {
                    int sub_id[] = (int[]) ss.getAttribute("sub_id" + cri_id[i]);
                    for (int j = 0; j < sub_id.length; j++) {
                        String question[] = request.getParameterValues("question" + sub_id[j]);
                        int ques_id[] = new int[question.length];
                        for (int k = 0; k < question.length; k++) {
                                ques_id[k] = mo.setQuestion(sub_id[j], k, question[k]);
                        }
                        ss.setAttribute("ques_id" + sub_id[j], ques_id);
                        ss.setAttribute("question" + sub_id[j], question);
                    }
                }
                viewAgent = "/WEB-INF/model/model_5.jsp";
            
            } else if (page.equals("5")) {
                if (request.getParameterValues("ra") != null) {
                    String ra[] = request.getParameterValues("ra");
                    String raDes[] = request.getParameterValues("raDes");
                    int ra_id[] = new int[ra.length];
                    for (int i = 0; i < ra.length; i++) {
                        ra_id[i] = mo.setRelated(ra[i], raDes[i],mo.getModel_id());
                    };
                    ss.setAttribute("ra", ra);
                    ss.setAttribute("ra_id", ra_id);
                    viewAgent = "/WEB-INF/model/model_6.jsp";
                } else {
                    viewAgent = "/WEB-INF/model/model_7.jsp";
                }
            } else if (page.equals("6")) {
                viewAgent = "/WEB-INF/model/model_7.jsp";
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

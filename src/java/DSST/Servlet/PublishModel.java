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
 * @author 006131
 */
public class PublishModel extends HttpServlet {

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
        String viewAgent = "/ModelMenu";
        String msg = "";
        Model m = new Model();
        String m_id = request.getParameter("m_id");
        int status = 1;
        m = m.getModelByID(Integer.parseInt(m_id));
        ArrayList<Model> listCri = new ArrayList();
        ArrayList<Model> listSub = new ArrayList();
        ArrayList<Model> listQuest = new ArrayList();
        listCri = m.getModelsCriteriaByID(Integer.parseInt(m_id));
        if (listCri.size() < 2) {
            status = 0;
            msg = "Can't publish : Please insert more criteria";
        }
        for (Model mCri : listCri) {
            listSub = mCri.getSubCriteriaByID(mCri.getCri_id());
            if (listSub.size() < 2) {
                status = 0;
                if (msg == "") {
                    msg = "Can't publish : Please insert more Subcriteria";
                }
            }
        }
        listQuest = m.getAllQuest(Integer.parseInt(m_id));
        ArrayList<Model> listAlter = new ArrayList();
        listAlter = m.getAlterById(Integer.parseInt(m_id));
        if (listAlter.size() < 2) {
            status = 0;
            if (msg == "") {
                msg = "Can't publish : Please insert more alternative";
            }
        }
        for (Model mAlter : listAlter) {
            int numOfAl = m.getSpecAnsNum(mAlter.getAl_id());
            listQuest = m.getAllQuest(Integer.parseInt(m_id));
            if (numOfAl != listQuest.size()) {
                status = 0;
                if (msg == "") {
                    msg = "Can't publish : Please answer all question";
                }
            }
        }
        if(status==1){
            m.updatePublish(Integer.parseInt(m_id),true);
        }
        request.setAttribute("msg", msg);
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

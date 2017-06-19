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
 * @author Soft
 */
public class ModelMenu extends HttpServlet {

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
        String viewAgent = "/WEB-INF/model/model_main.jsp";
        HttpSession ss = request.getSession();
        Model m = new Model();
        Member user = (Member) ss.getAttribute("login");
        ArrayList<Model> am = null;
        String m_id = request.getParameter("m_id");
        int status = 1;
        try {
            am = m.getModels(Integer.parseInt(user.getGroup()));
            request.setAttribute("am", am);
            if (m_id != null) {
                ArrayList<Model> criDB = m.getModelsCriteriaByID(Integer.parseInt(m_id));
                ArrayList<Model> allSubDB = new ArrayList();
                for (Model mCriDB : criDB) {
                    ArrayList<Model> subCriDB = m.getSubCriteriaByID(mCriDB.getCri_id());
                    if (subCriDB.isEmpty()) {
                        allSubDB.add(mCriDB);
                    } else {
                        for (Model mSubDB : subCriDB) {
                            mSubDB.setCri_name(mCriDB.getCri_name());
                            allSubDB.add(mSubDB);
                        }
                    }
                }
                Model mo = new Model();
                ArrayList<Model> listAlterss = new ArrayList();
                listAlterss = mo.getAlterById(Integer.parseInt(m_id));
                request.setAttribute("listAlter", listAlterss);
                request.setAttribute("allSubDB", allSubDB);
                m = m.getModelByID(Integer.parseInt(m_id));
                ArrayList<Model> listCri = new ArrayList();
                ArrayList<Model> listSub = new ArrayList();
                ArrayList<Model> listQuest = new ArrayList();
                listCri = m.getModelsCriteriaByID(Integer.parseInt(m_id));
                if (listCri.size() < 2) {
                    status = 0;
                }
                for (Model mCri : listCri) {
                    listSub = mCri.getSubCriteriaByID(mCri.getCri_id());
                    if (listSub.size() < 2) {
                        status = 0;
                    }
                    request.setAttribute("listSub" + mCri.getCri_id(), listSub);
                }
                listQuest = m.getAllQuest(Integer.parseInt(m_id));
                ArrayList<Model> listAlter = new ArrayList();
                listAlter = m.getAlterById(Integer.parseInt(m_id));
                if (listAlter.size() < 2) {
                    status = 0;
                }
                for (Model mAlter : listAlter) {
                    int numOfAl = m.getSpecAnsNum(mAlter.getAl_id());
                    listQuest = m.getAllQuest(Integer.parseInt(m_id));
                    if (numOfAl != listQuest.size()) {
                        status = 0;
                    }
                }
                m.updateStatus(Integer.parseInt(m_id), status+"");
                m = m.getModelByID(Integer.parseInt(m_id));
                request.setAttribute("listCri", listCri);
                request.setAttribute("m", m);
            } else if (am != null) {
                ArrayList<Model> criDB = m.getModelsCriteriaByID(am.get(0).getModel_id());
                ArrayList<Model> allSubDB = new ArrayList();
                for (Model mCriDB : criDB) {
                    ArrayList<Model> subCriDB = m.getSubCriteriaByID(mCriDB.getCri_id());
                    if (subCriDB.isEmpty()) {
                        allSubDB.add(mCriDB);
                    } else {
                        for (Model mSubDB : subCriDB) {
                            mSubDB.setCri_name(mCriDB.getCri_name());
                            allSubDB.add(mSubDB);
                        }
                    }
                }
                Model mo = new Model();
                ArrayList<Model> listAlterss = new ArrayList();
                listAlterss = mo.getAlterById(am.get(0).getModel_id());
                request.setAttribute("listAlter", listAlterss);
                request.setAttribute("allSubDB", allSubDB);
                m = m.getModelByID(am.get(0).getModel_id());
                ArrayList<Model> listCri = new ArrayList();
                ArrayList<Model> listSub = new ArrayList();
                ArrayList<Model> listQuest = new ArrayList();
                listCri = m.getModelsCriteriaByID(am.get(0).getModel_id());
                if (listCri.size() < 2) {
                    status = 0;
                }
                for (Model mCri : listCri) {
                    listSub = mCri.getSubCriteriaByID(mCri.getCri_id());
                    if (listSub.size() < 2) {
                        status = 0;
                    }
                    request.setAttribute("listSub" + mCri.getCri_id(), listSub);
                }
                listQuest = m.getAllQuest(am.get(0).getModel_id());
                ArrayList<Model> listAlter = new ArrayList();
                listAlter = m.getAlterById(am.get(0).getModel_id());
                if (listAlter.size() < 2) {
                    status = 0;
                }
                for (Model mAlter : listAlter) {
                    int numOfAl = m.getSpecAnsNum(mAlter.getAl_id());
                    listQuest = m.getAllQuest(am.get(0).getModel_id());
                    if (numOfAl != listQuest.size()) {
                        status = 0;
                    }
                }
                m.updateStatus(am.get(0).getModel_id(), status+"");
                m = m.getModelByID(am.get(0).getModel_id());
                request.setAttribute("listCri", listCri);
                request.setAttribute("m", m);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("Sta : "+status);
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

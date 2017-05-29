/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Servlet;

import DSST.Model.Model;
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
                if (request.getParameter("model_name") != null) {
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
                Model m = new Model();
                ArrayList<Model> criDB = m.getModelsCriteriaByID(Integer.parseInt(ss.getAttribute("model_id") + ""));

                if (request.getParameter("criId") != null) {
                    String criId[] = request.getParameterValues("criId");
                    String cri[] = request.getParameterValues("cri");
                    String criDes[] = request.getParameterValues("criDes");

                    ArrayList<String> arrayListCriId = new ArrayList<String>(Arrays.asList(criId));
                    for (int i = 0; i < criDB.size(); i++) {
                        if (!arrayListCriId.contains(criDB.get(i).getCri_id() + "")) {
                            m.delModelCriteriaByID(criDB.get(i).getCri_id());
                        }
                    }
                    for (int i = 0; i < criId.length; i++) {
                        m.updateCri(Integer.parseInt(criId[i]), cri[i], criDes[i]);
                    }
                }
                if (request.getParameter("Ncri") != null) {
                    String Ncri[] = request.getParameterValues("Ncri");
                    String NcriDes[] = request.getParameterValues("NcriDes");
                    for (int i = 0; i < Ncri.length; i++) {
                        m.setCriteria(Integer.parseInt(ss.getAttribute("model_id") + ""), Ncri[i], NcriDes[i]);
                    }
                }
                criDB.clear();
                criDB = m.getModelsCriteriaByID(Integer.parseInt(ss.getAttribute("model_id") + ""));
                request.setAttribute("criDB", criDB);
                viewAgent = "/WEB-INF/edit_model/eModel_2.jsp";
            } else if (page.equals("3")) {
                Model m = new Model();

                ArrayList<Model> criDB = m.getModelsCriteriaByID(Integer.parseInt(ss.getAttribute("model_id") + ""));
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

                if (request.getParameter("scriIdDB") != null) {
                    String scriIdDB[] = request.getParameterValues("scriIdDB");
                    String scriDB[] = request.getParameterValues("scriDB");
                    String scriDesDB[] = request.getParameterValues("scriDesDB");
                    ArrayList<String> arrayListSubCriId = new ArrayList<String>(Arrays.asList(scriIdDB));

                    for (int i = 0; i < allSubDB.size(); i++) {
                        if (!arrayListSubCriId.contains(allSubDB.get(i).getSc_id() + "")) {
                            m.delModelSubByID(allSubDB.get(i).getSc_id());
                        }
                    }

                    for (int i = 0; i < scriIdDB.length; i++) {
                        m.updateSubCri(Integer.parseInt(scriIdDB[i]), scriDB[i], scriDesDB[i]);
                    }
                }
                if (request.getParameter("scri") != null) {
                    String scri[] = request.getParameterValues("scri");
                    String scriDes[] = request.getParameterValues("scriDes");
                    for (int i = 0; i < scri.length; i++) {
                        int colon = scri[i].indexOf(':');
                        String mc_id = scri[i].substring(0, colon);
                        String scr = scri[i].substring(colon + 1);
                        m.setSubCriteria(Integer.parseInt(mc_id), scr, scriDes[i]);
                    }
                }
                allSubDB.clear();
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

                request.setAttribute("allSubDB", allSubDB);
                viewAgent = "/WEB-INF/edit_model/eModel_3.jsp";

            } else if (page.equals("4")) {
                Model m = new Model();

                ArrayList<Model> criDB = m.getModelsCriteriaByID(Integer.parseInt(ss.getAttribute("model_id") + ""));
                ArrayList<Model> allSubDB = new ArrayList();
                for (Model mCriDB : criDB) {
                    ArrayList<Model> subCriDB = m.getSubCriteriaByID(mCriDB.getCri_id());
                    for (Model mSubDB : subCriDB) {
                        mSubDB.setCri_name(mCriDB.getCri_name());
                        allSubDB.add(mSubDB);
                    }
                }
                ArrayList<Model> allQuestDB = new ArrayList();
                for(Model subCr :allSubDB){
                    ArrayList<Model> QuestDB = m.getQuestionByID(subCr.getSc_id());
                    for(Model mQuestDB : QuestDB){
                        mQuestDB.setSc_id(subCr.getSc_id());
                        allQuestDB.add(mQuestDB);
                    }
                }
                request.setAttribute("allQuestDB", allQuestDB);
                request.setAttribute("allSubDB", allSubDB);
                viewAgent = "/WEB-INF/edit_model/eModel_4.jsp";
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

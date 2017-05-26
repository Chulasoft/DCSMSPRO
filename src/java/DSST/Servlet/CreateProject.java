/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Servlet;

import DSST.Model.Member;
import DSST.Model.Model;
import DSST.Model.Project;
import static DSST.Model.Project.round;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        Model m = new Model();
        ArrayList<Model> am = null;
        try {
            am = m.getModels(mem.getMem_id());
            request.setAttribute("am", am);
        } catch (Exception e) {
            System.out.println(e);
        }
        Project pj = new Project();

        if (page != null) {
            if (page.equals("1")) {
                String proName = request.getParameter("proName");
                String proDes = request.getParameter("proDes");
                String m_id = request.getParameter("proModel");
                int p_id = 0;
                p_id = pj.initialProject(proName, Integer.parseInt(m_id), proDes, mem.getMem_id());
                ArrayList<Model> allQuest = new ArrayList();
                allQuest = m.getAllQuest(Integer.parseInt(m_id));
                request.setAttribute("allQuest", allQuest);
                ss.setAttribute("p_id", p_id);
                ss.setAttribute("m_id", m_id);
                viewAgent = "/WEB-INF/project/project_2.jsp";
            } else if (page.equals("2")) {
                String ans[] = request.getParameterValues("ansQues");
                int p_id = Integer.parseInt(ss.getAttribute("p_id") + "");
                String m_id2 = ss.getAttribute("m_id") + "";
                int m_id = Integer.parseInt(m_id2);
                for (int i = 0; i < ans.length; i++) {
                    int colon = ans[i].indexOf(':');
                    String ques_id = ans[i].substring(0, colon);
                    String answer = ans[i].substring(colon + 1);
                    pj.setAnswer(answer, p_id, Integer.parseInt(ques_id));
                }
                ArrayList<Integer> array_al_id = pj.getAL_ID(m_id);
                ArrayList<Integer> dontWant = new ArrayList<Integer>();
                for (int a_m_id : array_al_id) {
                    ArrayList<Integer> array_ans = pj.getAnswerFrommAL_ID(a_m_id);
                    int i = 0;
                    int ii = 0;
                    for (int a_ans : array_ans) {
                        int x = a_ans;
                        int colon = ans[i].indexOf(':');
                        String answer = ans[i].substring(colon + 1);
                        int y = Integer.parseInt(answer);
                        if (y == 3 && x == 0) {
                            ii++;
                            System.out.println("ii X x Y = " + (x * y));
                        } else {
                            System.out.println("X x Y = " + (x * y));
                        }
                        i++;
                    }
                    if (ii > 0) {
                        dontWant.add(new Integer(a_m_id));
                    }
                }
                for (int number : dontWant) {
                    array_al_id.remove(new Integer(number));
                }
                ArrayList<String> al_name_want = new ArrayList();
                for (int id : array_al_id) {
                    al_name_want.add(pj.getALNameByID(id));
                }
                request.setAttribute("array_al_id", array_al_id);
                request.setAttribute("al_name_want", al_name_want);
                viewAgent = "/WEB-INF/project/project_3.jsp";
            } else if (page.equals("3")) {
                String chosenAL[] = request.getParameterValues("chosenAL");
                //--------------------
                ss.setAttribute("chosenAL", chosenAL);
                //--------------------
                String m_id = (String) ss.getAttribute("m_id");
                ArrayList<Model> allCriteria = m.getModelsCriteriaByID(Integer.parseInt(m_id));
                request.setAttribute("allCriteria", allCriteria);
                viewAgent = "/WEB-INF/project/project_4.jsp";
            } else if (page.equals("4")) {
                String listAnsCri[] = request.getParameterValues("ansCri");
                String listCriId[] = request.getParameterValues("criId");
                String stSize = request.getParameter("size");
                int size = Integer.parseInt(stSize);
                PrintWriter pw = new PrintWriter(new File("D:\\Chula\\Server\\Glassfish\\glassfish\\config\\script\\VALINPUT.csv"));
                StringBuilder sb = new StringBuilder();
                int x = 0;
                for (int i = 0; i < size; i++) {
                    System.out.println(i);
                    for (int y = i + 1; y < size; y++) {
                        if (y != i + 1) {
                            sb.append(",");
                        } else {
                            sb.append("1");
                            sb.append(",");
                        }
                        sb.append(listAnsCri[x]);
                        int colon = listCriId[x].indexOf(':');
                        String criA = listCriId[x].substring(0, colon);
                        String criB = listCriId[x].substring(colon + 1);
                        pj.setCriInten(listAnsCri[x], Integer.parseInt(criA), Integer.parseInt(criB), 1, Integer.parseInt(ss.getAttribute("p_id") + ""));
                        x++;
                    }
                    if (size - 1 == i) {
                        sb.append("1");
                    }
                    sb.append("\n");
                    if (i + 1 < size) {
                        for (int z = -1; z < i; z++) {
                            sb.append("0");
                            sb.append(",");
                        }
                    }

                }
                pw.write(sb.toString());
                pw.close();
                System.out.println("done!");
                Runtime rt = Runtime.getRuntime();
                Process pr = rt.exec("octave-cli M_CheckCR.m", null, new File("D:\\Chula\\Server\\Glassfish\\glassfish\\config\\script"));
                BufferedReader stdInput = new BufferedReader(new InputStreamReader(pr.getInputStream()));
                BufferedReader stdError = new BufferedReader(new InputStreamReader(pr.getErrorStream()));
                double cr = 0;
// read the output from the command
                System.out.println("Here is the standard output of the command:\n");
                String s = null;
                while ((s = stdInput.readLine()) != null) {
                    System.out.println(s);
                    cr = Double.parseDouble(s);
                }

// read any errors from the attempted command
                System.out.println("Here is the standard error of the command (if any):\n");
                while ((s = stdError.readLine()) != null) {
                    System.out.println(s);
                }
                String m_id = (String) ss.getAttribute("m_id");
                ArrayList<Model> allCriteria = m.getModelsCriteriaByID(Integer.parseInt(m_id));
                int p_id = Integer.parseInt(ss.getAttribute("p_id") + "");
                if (cr > 0.10) {
                    msg = "Subjective evaluation is not consistent!";
                    viewAgent = "/WEB-INF/project/project_4.jsp";
                } else {
                    int loop_id = 0;
                    pr = rt.exec("octave-cli M_FAHP.m", null, new File("D:\\Chula\\Server\\Glassfish\\glassfish\\config\\script"));
                    try {
                        TimeUnit.SECONDS.sleep(1);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(CreateProject.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    String splitBy = ",";
                    BufferedReader br = new BufferedReader(new FileReader("D:\\Chula\\Server\\Glassfish\\glassfish\\config\\script\\RESULT.csv"));
                    String line = br.readLine();
                    String linea[] = line.split(splitBy);
                    ArrayList<Double> crWeight = new ArrayList();
                    for (String cell : linea) {
                        double a = Double.parseDouble(cell);
                        pj.setCriDetail(cr, allCriteria.get(loop_id).getCri_id(),allCriteria.get(loop_id).getCri_name(), 1, a,0.0, p_id);
                        crWeight.add(a);
                        loop_id++;
                    }
                    br.close();
                    ss.setAttribute("crWeight", crWeight);
                    viewAgent = "/ComparisonSubcriteria";
                }
                request.setAttribute("allCriteria", allCriteria);
                request.setAttribute("msg", msg);

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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Servlet;

import DSST.Model.Model;
import DSST.Model.Project;
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
 * @author Jab-PC
 */
public class ProcessAlternativeResult extends HttpServlet {

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
        HttpSession ss = request.getSession();
        int p_id = Integer.parseInt(ss.getAttribute("p_id") + ""); // เอา pid จาก session
        Model m = new Model();
        Project pj = new Project();
        String examArrayALter[] = (String[])ss.getAttribute("chosenAL"); //เอา จาก chosenAlterna

        ArrayList<Model> listCri = m.getModelsCriteriaByID(Integer.parseInt(ss.getAttribute("m_id") + ""));
        for (Model cr : listCri) {
            ArrayList<Model> listSubCri = cr.getSubCriteriaByID(cr.getCri_id());
            for (Model sc : listSubCri) {
                ArrayList<Model> listQuestion = sc.getQuestionByID(sc.getSc_id());
                double productScoreDouble[] = new double[examArrayALter.length];
                for (int i = 0; i < examArrayALter.length; i++) {
                    int scProductScore = 0;
                    for (Model ques : listQuestion) {
                        int ansCus = pj.getCusAnsByID(ques.getQuest_id(), p_id);
                        int ansP = ques.getSpecAnsByID(ques.getQuest_id(), Integer.parseInt(examArrayALter[i]));
                        scProductScore = (ansCus * ansP) + scProductScore;
                    }
                    productScoreDouble[i] = scProductScore;
                }
                double max = Double.MIN_VALUE;
                for (int i = 0; i < productScoreDouble.length; i++) {
                    if (productScoreDouble[i] > max) {
                        max = productScoreDouble[i];
                    }
                }
                for (int i = 0; i < productScoreDouble.length; i++) {
                    if (max == 0) {
                        productScoreDouble[i] = 0;
                    } else {
                        productScoreDouble[i] = (double) (productScoreDouble[i] / max);
                    }
                }
                ArrayList<String> csvListScore = new ArrayList();
                for (int i = 0; i < productScoreDouble.length; i++) {
                    for (int y = i + 1; y < productScoreDouble.length; y++) {
                        double scoreA = productScoreDouble[i];
                        double scoreB = productScoreDouble[y];
                        if (scoreA - scoreB == 0) {
                            csvListScore.add("1");
                        } else if (0.0 < (scoreA - scoreB) && (scoreA - scoreB) < 0.31) {
                            csvListScore.add("3");
                        } else if (0.31 <= (scoreA - scoreB) && (scoreA - scoreB) < 0.51) {
                            csvListScore.add("5");
                        } else if (0.51 <= (scoreA - scoreB) && (scoreA - scoreB) < 0.71) {
                            csvListScore.add("7");
                        } else if (0.71 <= (scoreA - scoreB) && (scoreA - scoreB) <= 1) {
                            csvListScore.add("9");
                        } else if (-0.00 > (scoreA - scoreB) && (scoreA - scoreB) > -0.31) {
                            csvListScore.add("-3");
                        } else if (-0.31 >= (scoreA - scoreB) && (scoreA - scoreB) > -0.51) {
                            csvListScore.add("-5");
                        } else if (-0.51 >= (scoreA - scoreB) && (scoreA - scoreB) > -0.71) {
                            csvListScore.add("-7");
                        } else if (-0.71 >= (scoreA - scoreB) && (scoreA - scoreB) >= -1.0) {
                            csvListScore.add("-9");
                        }

                    }
                }

////////////////////////////////////////////////////////////////////////////////////////////////////////
                PrintWriter pw = new PrintWriter(new File("C:\\Users\\Jab-PC\\GlassFish_Server\\glassfish\\domains\\domain1\\config\\script\\VALINPUT.csv"));
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < examArrayALter.length; i++) {
                    for (int y = i + 1; y < examArrayALter.length; y++) {
                        if (y != i + 1) {
                            sb.append(",");
                        } else {
                            sb.append("1");
                            sb.append(",");
                        }
                        sb.append(csvListScore.get(i));
                    }
                    if (examArrayALter.length - 1 == i) {
                        sb.append("1");
                    }
                    sb.append("\n");
                    if (i + 1 < examArrayALter.length) {
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
                Process pr = rt.exec("octave-cli M_FAHP.m", null, new File("C:\\Users\\Jab-PC\\GlassFish_Server\\glassfish\\domains\\domain1\\config\\script"));
                
                BufferedReader stdInput = new BufferedReader(new InputStreamReader(pr.getInputStream()));
                BufferedReader stdError = new BufferedReader(new InputStreamReader(pr.getErrorStream()));
// read the output from the command
                System.out.println("Here is the standard output of the command:\n");
                String s = null;
                while ((s = stdInput.readLine()) != null) {
                    System.out.println(s);
                }

// read any errors from the attempted command
                System.out.println("Here is the standard error of the command (if any):\n");
                while ((s = stdError.readLine()) != null) {
                    System.out.println(s);
                }
                String splitBy = ",";
                BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\Jab-PC\\GlassFish_Server\\glassfish\\domains\\domain1\\config\\script\\RESULT.csv"));
                String line = br.readLine();
                String linea[] = line.split(splitBy);
                int loop_num = 0;
                for (String cell : linea) {
                    double a = Double.parseDouble(cell);
                    pj.setALDetailTable(p_id, sc.getSc_id(), Integer.parseInt(examArrayALter[loop_num]), pj.getALNameByID(Integer.parseInt(examArrayALter[loop_num])), a,m.getCriFromSub(sc.getSc_id()));
                    loop_num++;
                }
                br.close();
            }
        }
        ss.removeAttribute("chosenAL");
        response.sendRedirect("ShowResult");

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

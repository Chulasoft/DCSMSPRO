/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Servlet;

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
 * @author Jab-PC
 */
public class ComparisonSubcriteria extends HttpServlet {

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
        ArrayList<Model> allCri = new ArrayList();
        HttpSession ss = request.getSession();
        Project pj = new Project();
        if (request.getAttribute("allCriteria") != null) {
            allCri = (ArrayList<Model>) request.getAttribute("allCriteria");
        } else {
            allCri = (ArrayList<Model>) ss.getAttribute("allCri");
        }

        String viewAgent = "/WEB-INF/project/project_5.jsp";
        String msg = "";

        String listAnsSubCri[] = request.getParameterValues("ansSc");
        String listCriId[] = request.getParameterValues("criId");
        if (listAnsSubCri != null) {
            String stSize = request.getParameter("size");
            int size = Integer.parseInt(stSize);
            PrintWriter pw = new PrintWriter(new File("script/VALINPUT.csv"));
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
                    sb.append(listAnsSubCri[x]);
                    int colon = listCriId[x].indexOf(':');
                    String criA = listCriId[x].substring(0, colon);
                    String criB = listCriId[x].substring(colon + 1);
                    pj.setCriInten(listAnsSubCri[x], Integer.parseInt(criA), Integer.parseInt(criB), 2, Integer.parseInt(ss.getAttribute("p_id") + ""));
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
            Process pr = rt.exec("octave-cli M_CheckCR.m", null, new File("C:\\Users\\Jab-PC\\GlassFish_Server\\glassfish\\domains\\domain1\\config\\script"));
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

            if (cr > 0.10) {
                msg = "Subjective evaluation is not consistent!";
            } else {
                    Model cri = allCri.get(0);
                    ArrayList<Model> subCri = cri.getSubCriteriaByID(cri.getCri_id());
                    int loop_id = 0;
                    pr = rt.exec("octave-cli M_FAHP.m", null, new File("C:\\Users\\Jab-PC\\GlassFish_Server\\glassfish\\domains\\domain1\\config\\script"));
                try {
                    TimeUnit.SECONDS.sleep(1);
                } catch (InterruptedException ex) {
                    Logger.getLogger(ComparisonSubcriteria.class.getName()).log(Level.SEVERE, null, ex);
                }
                    String splitBy = ",";
                    BufferedReader br = new BufferedReader(new FileReader("C:\\Users\\Jab-PC\\GlassFish_Server\\glassfish\\domains\\domain1\\config\\script\\RESULT.csv"));
                    String line = br.readLine();
                    String linea[] = line.split(splitBy);
                    loop_id = 0;
                    ArrayList<Double> crWeight = (ArrayList)ss.getAttribute("crWeight");
                    int p_id = Integer.parseInt(ss.getAttribute("p_id") + "");
                    for (String cell : linea) {
                        double a = Double.parseDouble(cell);
                        System.out.println("double : " + a*crWeight.get(0));
                        pj.setCriDetail(cr,subCri.get(loop_id).getCri_id(),subCri.get(loop_id).getSc_name(),2,a, a*crWeight.get(0), p_id);
                        loop_id++;
                    }
                    br.close();
                    ss.setAttribute("crWeight", crWeight);                
                if (!allCri.isEmpty()) {
                    crWeight.remove(0);
                    allCri.remove(0);
                }
            }
        }

        if (!allCri.isEmpty()) {
                Model cri = allCri.get(0);
                ArrayList<Model> subCri = cri.getSubCriteriaByID(cri.getCri_id());
                request.setAttribute("subCri", subCri);
                ss.setAttribute("allCri", allCri);
                request.setAttribute("msg", msg);
        } else {
            ss.removeAttribute("allCri");
            ss.removeAttribute("crWeight");  
            viewAgent = "/ProcessAlternativeResult";
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

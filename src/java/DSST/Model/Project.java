/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

/**
 *
 * @author Jab-PC
 */
public class Project {

    private static java.sql.Timestamp getCurrentTimeStamp() {

        java.util.Date today = new java.util.Date();
        return new java.sql.Timestamp(today.getTime());

    }

    public int initialProject(String proName, int m_id, String proDes, int create_id) {
        int pro_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO PROJECT (PROJECT_NAME, PROJECT_DESCRIPTION, PROJECT_STATUS, PROJECT_CREATE_BY, PROJECT_LAST_UPDATE, M_ID) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, proName);
            stm.setString(2, proDes);
            stm.setInt(3, 0);
            stm.setInt(4, create_id);
            stm.setTimestamp(5, getCurrentTimeStamp());
            stm.setInt(6, m_id);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                pro_id = rs.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pro_id;
    }

    public int setAnswer(String cusAns, int p_id, int su_id) {
        int cr_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO PROJECT_REQUIREMENT (CUSTOMER_ANSWER, ANSWER_LAST_UPDATE, P_ID, SU_ID) VALUES (?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, cusAns);
            stm.setTimestamp(2, getCurrentTimeStamp());
            stm.setInt(3, p_id);
            stm.setInt(4, su_id);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                cr_id = rs.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return cr_id;
    }

    public int setAlter(int al_id, int p_id) {
        int pa_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO PROJECT_ALTER (AL_ID, P_ID) VALUES (?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, al_id);
            stm.setInt(2, p_id);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                pa_id = rs.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pa_id;
    }

    public ArrayList<Integer> getAnswerFrommAL_ID(int al_id) {
        ArrayList am = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT SPECIFICATION_ANSWER FROM APP.ALTERNATIVE_SPECIFICATION where AL_ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, al_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                am.add(rs.getInt("SPECIFICATION_ANSWER"));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return am;
    }

    public ArrayList<Integer> getAL_ID(int m_id) {
        ArrayList am = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT AL_ID FROM APP.ALTERNATIVE where m_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, m_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                am.add(rs.getInt("AL_ID"));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return am;
    }

    public String getALNameByID(int m_id) {
        String names = "";
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT ALTERNATIVE_NAME FROM APP.ALTERNATIVE where al_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, m_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                names = rs.getString("ALTERNATIVE_NAME");
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return names;
    }

    public int setCriInten(String inten, int cri_a, int cri_b, int type, int p_id) {
        int pci_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO PROJECT_CRITERIA_INTENSITY (CRITERIA_A, CRITERIA_B, INTENSITY_NUMBER, CRITERIA_TYPE, P_ID) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, cri_a);
            stm.setInt(2, cri_b);
            stm.setString(3, inten);
            stm.setInt(4, type);
            stm.setInt(5, p_id);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                pci_id = rs.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pci_id;
    }

    public static double round(double value, int places) {
        if (places < 0) {
            throw new IllegalArgumentException();
        }

        long factor = (long) Math.pow(10, places);
        value = value * factor;
        long tmp = Math.round(value);
        return (double) tmp / factor;
    }

    public int setCriDetail(double cr, int cri_id, String criName, int type, double local, double global, int p_id, int sc_id) {
        int pcd_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO PROJECT_CRITERIA_DETAIL (CR,CRI_ID, CRITERIA_NAME, CRI_TYPE,LOCAL_WEIGHT,GLOBAL_WEIGHT, P_ID ,SC_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setDouble(1, cr);
            stm.setInt(2, cri_id);
            stm.setString(3, criName);
            stm.setInt(4, type);
            stm.setDouble(5, local);
            stm.setDouble(6, global);
            stm.setInt(7, p_id);
            stm.setInt(8, sc_id);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                pcd_id = rs.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pcd_id;
    }

//    public int setCriDetail(double cr, int cri_id, String criName, int type, double local, int p_id) {
//        int pcd_id = 0;
//        try {
//            Connection con = ConnectionBuilder.getConnection();
//            String sql = "INSERT INTO PROJECT_CRITERIA_DETAIL (CR,CRI_ID, CRITERIA_NAME, CRI_TYPE,LOCAL_WEIGHT, GLOBAL_WEIGHT ,P_ID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
//            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
//            stm.setDouble(1, cr);
//            stm.setInt(2, cri_id);
//            stm.setString(3, criName);
//            stm.setInt(4, type);
//            stm.setDouble(5, local);
//            stm.setNull(6, Types.DOUBLE);
//            stm.setInt(7, p_id);
//            stm.executeUpdate();
//            ResultSet rs = stm.getGeneratedKeys();
//            while (rs.next()) {
//                pcd_id = rs.getInt(1);
//            }
//            con.close();
//        } catch (Exception ex) {
//            System.out.println(ex);
//        }
//        return pcd_id;
//    }
    private double CR;
    private int CRI_ID;
    private String CRITERIA_NAME;
    private int CRI_TYPE;
    private double LOCAL_WEIGHT;
    private double GLOBAL_WEIGHT;

    public double getCR() {
        return CR;
    }

    public void setCR(double CR) {
        this.CR = CR;
    }

    public int getCRI_ID() {
        return CRI_ID;
    }

    public void setCRI_ID(int CRI_ID) {
        this.CRI_ID = CRI_ID;
    }

    public String getCRITERIA_NAME() {
        return CRITERIA_NAME;
    }

    public void setCRITERIA_NAME(String CRITERIA_NAME) {
        this.CRITERIA_NAME = CRITERIA_NAME;
    }

    public int getCRI_TYPE() {
        return CRI_TYPE;
    }

    public void setCRI_TYPE(int CRI_TYPE) {
        this.CRI_TYPE = CRI_TYPE;
    }

    public double getLOCAL_WEIGHT() {
        return LOCAL_WEIGHT;
    }

    public void setLOCAL_WEIGHT(double LOCAL_WEIGHT) {
        this.LOCAL_WEIGHT = LOCAL_WEIGHT;
    }

    public double getGLOBAL_WEIGHT() {
        return GLOBAL_WEIGHT;
    }

    public void setGLOBAL_WEIGHT(double GLOBAL_WEIGHT) {
        this.GLOBAL_WEIGHT = GLOBAL_WEIGHT;
    }

    public ArrayList<Project> getRadarCriChart(int p_id, int cr_id) {
        ArrayList<Project> listProject = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT_ALTERNATIVE_TABLEDETAIL where P_ID = ? AND CR_ID = ? order by al_id,sc_id";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            stm.setInt(2, cr_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setAl_id(rs.getInt("AL_ID"));
                p.setAl_name(rs.getString("AL_NAME"));
                p.setWeight(rs.getDouble("WEIGHT"));
                listProject.add(p);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProject;
    }

    public ArrayList<Project> getChart(int p_id, int sc_id) {
        ArrayList<Project> listProject = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT_ALTERNATIVE_TABLEDETAIL where P_ID = ? AND SC_ID = ? order by al_id";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            stm.setInt(2, sc_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setAl_name(rs.getString("AL_NAME"));
                p.setWeight(rs.getDouble("WEIGHT"));
                listProject.add(p);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProject;
    }

    public ArrayList<Project> getPieChart(int p_id, int cri_id) {
        ArrayList<Project> listProject = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT_CRITERIA_DETAIL WHERE CRI_ID = ? AND P_ID = ? AND CRI_TYPE = 2";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(2, p_id);
            stm.setInt(1, cri_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setCRITERIA_NAME(rs.getString("CRITERIA_NAME"));
                p.setWeight(rs.getDouble("LOCAL_WEIGHT"));
                listProject.add(p);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProject;
    }

    public ArrayList<Project> getPieChart(int p_id) {
        ArrayList<Project> listProject = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT_CRITERIA_DETAIL WHERE P_ID = ? AND CRI_TYPE = 1";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setCRITERIA_NAME(rs.getString("CRITERIA_NAME"));
                p.setWeight(rs.getDouble("LOCAL_WEIGHT"));
                listProject.add(p);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProject;
    }

    public ArrayList<Project> getPieChartAll(int p_id) {
        ArrayList<Project> listProject = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT_CRITERIA_DETAIL WHERE P_ID = ? AND CRI_TYPE = 2";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setCRITERIA_NAME(rs.getString("CRITERIA_NAME"));
                p.setWeight(rs.getDouble("LOCAL_WEIGHT"));
                listProject.add(p);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProject;
    }

    public ArrayList<Project> getTable(int p_id) {
        ArrayList<Project> listProject = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT_CRITERIA_DETAIL where P_ID = ? order by CRI_ID,PCD_ID";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setCR(rs.getDouble("CR"));
                p.setCRI_ID(rs.getInt("CRI_ID"));
                p.setCRITERIA_NAME(rs.getString("CRITERIA_NAME"));
                p.setCRI_TYPE(rs.getInt("CRI_TYPE"));
                p.setLOCAL_WEIGHT(rs.getDouble("LOCAL_WEIGHT"));
                p.setGLOBAL_WEIGHT(rs.getDouble("GLOBAL_WEIGHT"));
                p.setSc_id(rs.getInt("SC_ID"));
                p.setProj_id(p_id);
                listProject.add(p);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProject;
    }

    public int getCusAnsByID(int su_id, int p_id) {
        int ans = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT CUSTOMER_ANSWER FROM APP.PROJECT_REQUIREMENT WHERE SU_ID = ? AND P_ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, su_id);
            stm.setInt(2, p_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ans = rs.getInt("CUSTOMER_ANSWER");
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return ans;
    }

    public int getNumOfAlter(int p_id) {
        int num = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT count(AL_ID) FROM APP.PROJECT_ALTER WHERE P_ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return num;
    }

    public void updateState(int p_id, int state) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE PROJECT SET PROJECT_STATE = ? WHERE P_ID = ? ";
            PreparedStatement ps = con.prepareStatement(sql);

            // set the preparedstatement parameters
            ps.setInt(1, state);
            ps.setInt(2, p_id);

            // call executeUpdate to execute our sql update statement
            ps.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public int setALDetailTable(int p_id, int sc_id, int al_id, String al_name, double weight, int cr_id) {
        int pcd_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO PROJECT_ALTERNATIVE_TABLEDETAIL (P_ID,SC_ID,AL_ID, AL_NAME, WEIGHT ,CR_ID) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, p_id);
            stm.setInt(2, sc_id);
            stm.setInt(3, al_id);
            stm.setString(4, al_name);
            stm.setDouble(5, weight);
            stm.setInt(6, cr_id);
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                pcd_id = rs.getInt(1);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pcd_id;
    }

    public static String getProductNameByID(int al_id) {
        String name = "";
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT ALTERNATIVE_NAME FROM APP.ALTERNATIVE WHERE AL_ID = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, al_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                name = rs.getString("ALTERNATIVE_NAME");
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return name;
    }

    private int sc_id;
    private int al_id;
    private String al_name;
    private double weight;

    public int getSc_id() {
        return sc_id;
    }

    public void setSc_id(int sc_id) {
        this.sc_id = sc_id;
    }

    public int getAl_id() {
        return al_id;
    }

    public void setAl_id(int al_id) {
        this.al_id = al_id;
    }

    public String getAl_name() {
        return al_name;
    }

    public void setAl_name(String al_name) {
        this.al_name = al_name;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public ArrayList<Project> getProductTable(int p_id) {
        ArrayList<Project> listProduct = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT_ALTERNATIVE_TABLEDETAIL where P_ID = ? order by SC_ID,AL_ID";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setSc_id(rs.getInt("SC_ID"));
                p.setAl_id(rs.getInt("AL_ID"));
                p.setAl_name(rs.getString("AL_NAME"));
                p.setWeight(rs.getDouble("WEIGHT"));
                listProduct.add(p);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProduct;
    }

    public ArrayList<Integer> getProAL(int p_id) {
        ArrayList<Integer> listProduct = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT_ALTER where P_ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listProduct.add(rs.getInt("AL_ID"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProduct;
    }
    private int proj_id;
    private String proj_name;
    private String proj_status;
    private String proj_lastUpdate;
    private int proj_state;
    private int proj_m_id;

    public int getProj_m_id() {
        return proj_m_id;
    }

    public void setProj_m_id(int proj_m_id) {
        this.proj_m_id = proj_m_id;
    }

    public int getProj_state() {
        return proj_state;
    }

    public void setProj_state(int proj_state) {
        this.proj_state = proj_state;
    }

    public int getProj_id() {
        return proj_id;
    }

    public void setProj_id(int proj_id) {
        this.proj_id = proj_id;
    }

    public String getProj_name() {
        return proj_name;
    }

    public void setProj_name(String proj_name) {
        this.proj_name = proj_name;
    }

    public String getProj_status() {
        return proj_status;
    }

    public void setProj_status(String proj_status) {
        this.proj_status = proj_status;
    }

    public String getProj_lastUpdate() {
        return proj_lastUpdate;
    }

    public void setProj_lastUpdate(String proj_lastUpdate) {
        this.proj_lastUpdate = proj_lastUpdate;
    }

    public ArrayList<Project> getProject(int mem_id) {
        ArrayList<Project> listProject = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT where PROJECT_CREATE_BY = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, mem_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Project p = new Project();
                p.setProj_id(rs.getInt("P_ID"));
                p.setProj_name(rs.getString("PROJECT_NAME"));
                p.setProj_lastUpdate(rs.getString("PROJECT_LAST_UPDATE"));
                p.setProj_status(rs.getString("PROJECT_STATUS"));
                p.setProj_state(rs.getInt("PROJECT_STATE"));
                p.setProj_m_id(rs.getInt("M_ID"));
                listProject.add(p);
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return listProject;
    }

    public Project findProject(int p_id) {
        Project pj = new Project();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.PROJECT where P_ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                pj.setProj_id(rs.getInt("P_ID"));
                pj.setProj_name(rs.getString("PROJECT_NAME"));
                pj.setProj_lastUpdate(rs.getString("PROJECT_LAST_UPDATE"));
                pj.setProj_status(rs.getString("PROJECT_STATUS"));
                pj.setProj_state(rs.getInt("PROJECT_STATE"));
                pj.setProj_m_id(rs.getInt("M_ID"));
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return pj;
    }

    public void updateStatus(int p_id) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE PROJECT SET PROJECT_STATE = 2,PROJECT_STATUS = '1' WHERE P_ID = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            stm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }

    public void updateFinal(int p_id) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE PROJECT SET PROJECT_STATUS = '2' WHERE P_ID = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            stm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
    public void updateRevert(int p_id) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE PROJECT SET PROJECT_STATE = 1 ,PROJECT_STATUS = '0' WHERE P_ID = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, p_id);
            stm.executeUpdate();
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
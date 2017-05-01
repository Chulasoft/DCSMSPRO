/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Jab
 */
public class Model {

//    private String modelName;
//    private String goal;
//    private String goal_des;
    private int model_id;
    private String model_name;
    private String model_goal;
    private int create_by_id;
    private String model_status;
    private String model_lastUpdate;

    ///////////////////////////////////////////////
    private int cri_id;
    private String cri_name;
    private int sc_id;
    private String sc_name;
    private int quest_id;
    private String quest_name;

    public int getCri_id() {
        return cri_id;
    }

    public void setCri_id(int cri_id) {
        this.cri_id = cri_id;
    }

    public String getCri_name() {
        return cri_name;
    }

    public void setCri_name(String cri_name) {
        this.cri_name = cri_name;
    }

    public int getSc_id() {
        return sc_id;
    }

    public void setSc_id(int sc_id) {
        this.sc_id = sc_id;
    }

    public String getSc_name() {
        return sc_name;
    }

    public void setSc_name(String sc_name) {
        this.sc_name = sc_name;
    }

    public int getQuest_id() {
        return quest_id;
    }

    public void setQuest_id(int quest_id) {
        this.quest_id = quest_id;
    }

    public String getQuest_name() {
        return quest_name;
    }

    public void setQuest_name(String quest_name) {
        this.quest_name = quest_name;
    }

    ///////////////////////////////////
    public int getModel_id() {
        return model_id;
    }

    public int getCreate_by_id() {
        return create_by_id;
    }

    public void setCreate_by_id(int create_by_id) {
        this.create_by_id = create_by_id;
    }

    public String getModel_status() {
        return model_status;
    }

    public void setModel_status(String model_status) {
        this.model_status = model_status;
    }

    public String getModel_lastUpdate() {
        return model_lastUpdate;
    }

    public void setModel_lastUpdate(String model_lastUpdate) {
        this.model_lastUpdate = model_lastUpdate;
    }

    public void setModel_id(int model_id) {
        this.model_id = model_id;
    }

    public String getModel_name() {
        return model_name;
    }

    public void setModel_name(String model_name) {
        this.model_name = model_name;
    }

    public String getModel_goal() {
        return model_goal;
    }

    public void setModel_goal(String model_goal) {
        this.model_goal = model_goal;
    }

//
//    public String getModelName() {
//        return modelName;
//    }
//
//    public void setModelName(String modelName) {
//        this.modelName = modelName;
//    }
//
//    public String getGoal() {
//        return goal;
//    }
//
//    public void setGoal(String goal) {
//        this.goal = goal;
//    }
//
//    public String getGoal_des() {
//        return goal_des;
//    }
//
//    public void setGoal_des(String goal_des) {
//        this.goal_des = goal_des;
//    }
//
//    public int getModel_id() {
//        return model_id;
//    }
//
//    public void setModel_id(int model_id) {
//        this.model_id = model_id;
//    }
    private static java.sql.Timestamp getCurrentTimeStamp() {

        java.util.Date today = new java.util.Date();
        return new java.sql.Timestamp(today.getTime());

    }

    public static Model initialModel(String mName, String gName, String gDes, int author) {
        Model mo = new Model();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO MODEL (MODEL_NAME, GOAL_NAME,GOAL_DESCRIPTION,MODEL_STATUS,MODEL_CREATE_BY,MODEL_LAST_UPDATE) VALUES ( ?, ?, ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, mName);
            stm.setString(2, gName);
            stm.setString(3, gDes);
            stm.setInt(4, 0);
            stm.setInt(5, author);
            stm.setTimestamp(6, getCurrentTimeStamp());
            stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                mo.setModel_id(rs.getInt(1));
            }
            con.close();
            mo.setModel_goal(gName);
            mo.setModel_name(mName);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return mo;
    }

    public int setCriteria(int m_id, String cri, String criDes) {
        int cri_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO CRITERIA (MAIN_CRITERIA_NAME, MAIN_CRITERIA_DESCRIPTION,MAIN_CRITERIA_STATUS,M_ID) VALUES ( ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, cri);
            stm.setString(2, criDes);
            stm.setInt(3, 0);
            stm.setInt(4, m_id);
            int done = stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();

            while (rs.next()) {
                cri_id = rs.getInt(1);
            }
            if (done > 0) {
                System.out.println("SetCriteria : " + cri_id + " Succesful");
            }
            con.close();

        } catch (Exception ex) {
            System.out.println(ex);
        }
        return cri_id;
    }

    public int setSubCriteria(int mc_id, String scri, String scriDes) {
        int sub_cri_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO SUB_CRITERIA (SUB_CRITERIA_NAME, SUB_CRITERIA_DESCRIPTION,SUB_CRITERIA_STATUS,MC_ID) VALUES ( ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, scri);
            stm.setString(2, scriDes);
            stm.setInt(3, 0);
            stm.setInt(4, mc_id);
            int done = stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                sub_cri_id = rs.getInt(1);
            }
            if (done > 0) {
                System.out.println("SetSubCriteria : " + sub_cri_id + " Succesful");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return sub_cri_id;
    }

    public int setQuestion(int sc_id, int ques_num, String question) {
        int q_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO SURVEY ( SURVEY_NUMBER, SURVEY_QUESTION,SC_ID) VALUES ( ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setInt(1, ques_num);
            stm.setString(2, question);
            stm.setInt(3, sc_id);
            int done = stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                q_id = rs.getInt(1);
            }
            if (done > 0) {
                System.out.println("SetQuestion : " + q_id + " Succesful");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return q_id;
    }

    public int setRelated(String al_name, String al_des, int model_id) {
        int al_id = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO ALTERNATIVE ( ALTERNATIVE_NAME, ALTERNATIVE_DESCRIPTION,ALTERNATIVE_STATUS,M_ID) VALUES ( ?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stm.setString(1, al_name);
            stm.setString(2, al_des);
            stm.setInt(3, 0);
            stm.setInt(4, model_id);
            int done = stm.executeUpdate();
            ResultSet rs = stm.getGeneratedKeys();
            while (rs.next()) {
                al_id = rs.getInt(1);
            }
            if (done > 0) {
                System.out.println("SetQuestion : " + al_id + " Succesful");
            }
            con.close();
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return al_id;
    }

    public int setAns(String ans, String by, int su_id, int al_id) {
        int done = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "INSERT INTO ALTERNATIVE_SPECIFICATION (SPECIFICATION_ANSWER, SPECIFICATION_BY, SU_ID, AL_ID) VALUES (?, ?, ?, ?)";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, ans);
            stm.setInt(2, Member.getMem_id());
            stm.setInt(3, su_id);
            stm.setInt(4, al_id);
            done = stm.executeUpdate();
            con.close();
            if (done > 0) {
                System.out.println("Ans Insert Successful");
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return done;
    }

    public ArrayList<Model> getModels(int mem_id) {
        ArrayList am = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT M_ID,MODEL_NAME,MODEL_STATUS,MODEL_CREATE_BY,MODEL_LAST_UPDATE FROM MODEL WHERE MODEL_CREATE_BY = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, mem_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Model m = new Model();
                m.setModel_id(rs.getInt(1));
                m.setModel_name(rs.getString(2));
                m.setModel_status(rs.getString(3));
                m.setCreate_by_id(rs.getInt(4));
                m.setModel_lastUpdate(rs.getString(5));
                if (m != null) {
                    am.add(m);
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return am;
    }

    public ArrayList<Model> getAllQuest(int m_id) {
        ArrayList am = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "select c.mc_id, sc.sc_id, s.su_id, main_criteria_name,sc.sub_criteria_name,s.survey_question  from survey s \n"
                    + "join sub_criteria sc\n"
                    + "on s.sc_id = sc.sc_id \n"
                    + "join criteria c\n"
                    + "on sc.mc_id = c.mc_id\n"
                    + "where m_id = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, m_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Model m = new Model();
                m.setCri_id(rs.getInt(1));
                m.setSc_id(rs.getInt(2));
                m.setQuest_id(rs.getInt(3));
                m.setCri_name(rs.getString(4));
                m.setSc_name(rs.getString(5));
                m.setQuest_name(rs.getString(6));
                if (m != null) {
                    am.add(m);
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return am;
    }
}

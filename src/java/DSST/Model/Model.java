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
    private String model_goal_des;
    private int create_by_id;
    private String model_status;
    private String model_lastUpdate;

    public String getModel_goal_des() {
        return model_goal_des;
    }

    public void setModel_goal_des(String model_goal_des) {
        this.model_goal_des = model_goal_des;
    }

    ///////////////////////////////////////////////
    private int cri_id;
    private String cri_name;
    private String cri_des;
    private int sc_id;
    private String sc_name;
    private String sc_des;
    private int quest_id;
    private String quest_name;
    private double weight;

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public String getSc_des() {
        return sc_des;
    }

    public void setSc_des(String sc_des) {
        this.sc_des = sc_des;
    }

    public String getCri_des() {
        return cri_des;
    }

    public void setCri_des(String cri_des) {
        this.cri_des = cri_des;
    }

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

    public Model getModelByID(int m_id) {
        Model m = new Model();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT M_ID,MODEL_NAME,MODEL_STATUS,MODEL_CREATE_BY,MODEL_LAST_UPDATE,GOAL_NAME,GOAL_DESCRIPTION FROM MODEL WHERE M_ID = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, m_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                m.setModel_id(rs.getInt(1));
                m.setModel_name(rs.getString(2));
                m.setModel_status(rs.getString(3));
                m.setCreate_by_id(rs.getInt(4));
                m.setModel_lastUpdate(rs.getString(5));
                m.setModel_goal(rs.getString(6));
                m.setModel_goal_des(rs.getString(7));
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return m;
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

    public ArrayList<Model> getModelsCriteriaByID(int mem_id) {
        ArrayList<Model> allCriteria = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM CRITERIA WHERE M_ID = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, mem_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Model m = new Model();
                m.setCri_id(rs.getInt(1));
                m.setCri_name(rs.getString(2));
                m.setCri_des(rs.getString(3));
                if (m != null) {
                    allCriteria.add(m);
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return allCriteria;
    }

    public ArrayList<Model> getSubCriteriaByID(int cr_id) {
        ArrayList<Model> allSubCriteria = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM SUB_CRITERIA WHERE MC_ID = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, cr_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Model m = new Model();
                m.setSc_id(rs.getInt(1));
                m.setSc_name(rs.getString(2));
                m.setSc_des(rs.getString(3));
                m.setCri_id(rs.getInt(5));
                if (m != null) {
                    allSubCriteria.add(m);
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return allSubCriteria;
    }

    public ArrayList<Model> getQuestionByID(int sc_id) {
        ArrayList am = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.SURVEY WHERE SC_ID = ? ORDER BY SU_ID";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, sc_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Model m = new Model();
                m.setQuest_id(rs.getInt("SU_ID"));
                m.setQuest_name(rs.getString("SURVEY_QUESTION"));
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

    public int getSpecAnsByID(int su_id, int al_id) {
        int ans = 0;
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT SPECIFICATION_ANSWER FROM APP.ALTERNATIVE_SPECIFICATION WHERE SU_ID = ? AND AL_ID = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, su_id);
            stm.setInt(2, al_id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                ans = rs.getInt("SPECIFICATION_ANSWER");
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return ans;
    }
    private int al_id;
    private String al_name;
    private String al_des;

    public String getAl_des() {
        return al_des;
    }

    public void setAl_des(String al_des) {
        this.al_des = al_des;
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

    public ArrayList<Model> getAlterById(int m_id) {
        ArrayList<Model> am = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "SELECT * FROM APP.ALTERNATIVE where m_id = ?";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, m_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Model m = new Model();
                m.setAl_id(rs.getInt("AL_ID"));
                m.setAl_name(rs.getString("ALTERNATIVE_NAME"));
                m.setAl_des(rs.getString("ALTERNATIVE_DESCRIPTION"));
                am.add(m);
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return am;
    }

    public void updateModel(Model m) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE MODEL SET MODEL_NAME = ?, GOAL_NAME = ?,GOAL_DESCRIPTION = ? ,MODEL_LAST_UPDATE = ? WHERE M_ID = ? ";
            PreparedStatement ps = con.prepareStatement(sql);

            // set the preparedstatement parameters
            ps.setString(1, m.getModel_name());
            ps.setString(2, m.getModel_goal());
            ps.setString(3, m.getModel_goal_des());
            ps.setTimestamp(4, getCurrentTimeStamp());
            ps.setInt(5, m.getModel_id());

            // call executeUpdate to execute our sql update statement
            ps.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void updateCri(int cr_id, String cr_name, String cr_des) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE CRITERIA SET MAIN_CRITERIA_NAME = ?, MAIN_CRITERIA_DESCRIPTION = ? WHERE MC_ID = ? ";
            PreparedStatement ps = con.prepareStatement(sql);

            // set the preparedstatement parameters
            ps.setString(1, cr_name);
            ps.setString(2, cr_des);
            ps.setInt(3, cr_id);

            // call executeUpdate to execute our sql update statement
            ps.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void updateSubCri(int scId, String scName, String scDes) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE SUB_CRITERIA SET SUB_CRITERIA_NAME = ?, SUB_CRITERIA_DESCRIPTION = ? WHERE SC_ID = ? ";
            PreparedStatement ps = con.prepareStatement(sql);

            // set the preparedstatement parameters
            ps.setString(1, scName);
            ps.setString(2, scDes);
            ps.setInt(3, scId);

            // call executeUpdate to execute our sql update statement
            ps.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void updateQuestion(int suId, String suName) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE SURVEY SET SURVEY_QUESTION = ? WHERE SU_ID = ? ";
            PreparedStatement ps = con.prepareStatement(sql);

            // set the preparedstatement parameters
            ps.setString(1, suName);
            ps.setInt(2, suId);

            // call executeUpdate to execute our sql update statement
            ps.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void updateAlter(int raId, String raName, String raDes) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "UPDATE ALTERNATIVE SET ALTERNATIVE_NAME = ?,ALTERNATIVE_DESCRIPTION = ? WHERE AL_ID = ? ";
            PreparedStatement ps = con.prepareStatement(sql);

            // set the preparedstatement parameters
            ps.setString(1, raName);
            ps.setString(2, raDes);
            ps.setInt(3, raId);

            // call executeUpdate to execute our sql update statement
            ps.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public String delByModelId(int m_id) {
        ArrayList<Integer> listSu_id = new ArrayList();
        ArrayList<Integer> listSc_id = new ArrayList();
        ArrayList<Integer> listP_id = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "select s.su_id  from survey s \n"
                    + "join sub_criteria sc\n"
                    + "on s.sc_id = sc.sc_id \n"
                    + "join criteria c\n"
                    + "on sc.mc_id = c.mc_id\n"
                    + "where m_id = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, m_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listSu_id.add(rs.getInt(1));
            }
            sql = "select mc_id  from criteria \n"
                    + "where m_id = ? ";
            stm = con.prepareStatement(sql);
            stm.setInt(1, m_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                listSc_id.add(rs.getInt(1));
            }
            for (int i : listSu_id) {
                Statement stmt = con.createStatement();
                sql = "DELETE FROM PROJECT_REQUIREMENT WHERE SU_ID = " + i;
                stmt.executeUpdate(sql);
                stmt = con.createStatement();
                sql = "DELETE FROM ALTERNATIVE_SPECIFICATION WHERE SU_ID = " + i;
                stmt.executeUpdate(sql);
                stmt = con.createStatement();
                sql = "DELETE FROM SURVEY WHERE SU_ID = " + i;
                stmt.executeUpdate(sql);
            }
            for (int i : listSc_id) {
                Statement stmt = con.createStatement();
                sql = "DELETE FROM SUB_CRITERIA WHERE MC_ID = " + i;
                stmt.executeUpdate(sql);
                stmt = con.createStatement();
                sql = "DELETE FROM CRITERIA WHERE MC_ID = " + i;
                stmt.executeUpdate(sql);
            }
            Statement stmt = con.createStatement();
            sql = "DELETE FROM ALTERNATIVE WHERE M_ID = " + m_id;
            stmt.executeUpdate(sql);

            sql = "select P_ID  from PROJECT where m_id = ? ";
            stm = con.prepareStatement(sql);
            stm.setInt(1, m_id);
            rs = stm.executeQuery();
            while (rs.next()) {
                listP_id.add(rs.getInt(1));
            }

            for (int i : listP_id) {
                stmt = con.createStatement();
                sql = "DELETE FROM PROJECT_CRITERIA_DETAIL WHERE P_ID = " + i;
                stmt.executeUpdate(sql);
                stmt = con.createStatement();
                sql = "DELETE FROM PROJECT_ALTERNATIVE_TABLEDETAIL WHERE P_ID = " + i;
                stmt.executeUpdate(sql);
                stmt = con.createStatement();
                sql = "DELETE FROM PROJECT_CRITERIA_INTENSITY WHERE P_ID = " + i;
                stmt.executeUpdate(sql);
                stmt = con.createStatement();
                sql = "DELETE FROM PROJECT WHERE P_ID = " + i;
                stmt.executeUpdate(sql);
            }

            stmt = con.createStatement();
            sql = "DELETE FROM MODEL WHERE M_ID = " + m_id;
            stmt.executeUpdate(sql);
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return "success";
    }

    public String delModelCriteriaByID(int cr_id) {
        ArrayList<Integer> listSu_id = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "select s.su_id  from survey s \n"
                    + "join sub_criteria sc\n"
                    + "on s.sc_id = sc.sc_id \n"
                    + "join criteria c\n"
                    + "on sc.mc_id = c.mc_id\n"
                    + "where c.MC_ID = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, cr_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listSu_id.add(rs.getInt(1));
            }
            for (int i : listSu_id) {
                Statement stmt = con.createStatement();
                stmt = con.createStatement();
                sql = "DELETE FROM ALTERNATIVE_SPECIFICATION WHERE SU_ID = " + i;
                stmt.executeUpdate(sql);
                stmt = con.createStatement();
                sql = "DELETE FROM SURVEY WHERE SU_ID = " + i;
                stmt.executeUpdate(sql);
            }
            Statement stmt = con.createStatement();
            sql = "DELETE FROM SUB_CRITERIA WHERE MC_ID = " + cr_id;
            stmt.executeUpdate(sql);
            stmt = con.createStatement();
            sql = "DELETE FROM CRITERIA WHERE MC_ID = " + cr_id;
            stmt.executeUpdate(sql);
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return "success";
    }

    public String delModelSubByID(int sub_id) {
        ArrayList<Integer> listSu_id = new ArrayList();
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "select su_id  from survey where SC_ID = ? ";
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, sub_id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                listSu_id.add(rs.getInt(1));
            }
            for (int i : listSu_id) {
                Statement stmt = con.createStatement();
                stmt = con.createStatement();
                sql = "DELETE FROM ALTERNATIVE_SPECIFICATION WHERE SU_ID = " + i;
                stmt.executeUpdate(sql);
                stmt = con.createStatement();
                sql = "DELETE FROM SURVEY WHERE SU_ID = " + i;
                stmt.executeUpdate(sql);
            }
            Statement stmt = con.createStatement();
            sql = "DELETE FROM SUB_CRITERIA WHERE SC_ID = " + sub_id;
            stmt.executeUpdate(sql);
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return "success";
    }

    public String delQuestByID(int quest_id) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "";
            Statement stmt = con.createStatement();
            stmt = con.createStatement();
            sql = "DELETE FROM ALTERNATIVE_SPECIFICATION WHERE SU_ID = " + quest_id;
            stmt.executeUpdate(sql);
            stmt = con.createStatement();
            sql = "DELETE FROM SURVEY WHERE SU_ID = " + quest_id;
            stmt.executeUpdate(sql);
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return "success";
    }

    public String delAlterByID(int alter_id) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            String sql = "";
            Statement stmt = con.createStatement();
            stmt = con.createStatement();
            sql = "DELETE FROM ALTERNATIVE_SPECIFICATION WHERE AL_ID = " + alter_id;
            stmt.executeUpdate(sql);
            stmt = con.createStatement();
            sql = "DELETE FROM ALTERNATIVE WHERE AL_ID = " + alter_id;
            stmt.executeUpdate(sql);
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return "success";
    }

    public String delProject(int p_id) {
        try {
            Connection con = ConnectionBuilder.getConnection();
            Statement stmt = con.createStatement();
            String sql = "DELETE FROM PROJECT_CRITERIA_DETAIL WHERE P_ID = " + p_id;
            stmt.executeUpdate(sql);
            stmt = con.createStatement();
            sql = "DELETE FROM PROJECT_ALTERNATIVE_TABLEDETAIL WHERE P_ID = " + p_id;
            stmt.executeUpdate(sql);
            stmt = con.createStatement();
            sql = "DELETE FROM PROJECT_CRITERIA_INTENSITY WHERE P_ID = " + p_id;
            stmt.executeUpdate(sql);
            stmt = con.createStatement();
            sql = "DELETE FROM PROJECT_REQUIREMENT WHERE P_ID = " + p_id;
            stmt.executeUpdate(sql);
            stmt = con.createStatement();
            sql = "DELETE FROM PROJECT WHERE P_ID = " + p_id;
            stmt.executeUpdate(sql);
            con.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return "success";
    }

    @Override
    public String toString() {
        return "Model{" + "model_id=" + model_id + ", model_name=" + model_name + ", model_goal=" + model_goal + ", create_by_id=" + create_by_id + ", model_status=" + model_status + ", model_lastUpdate=" + model_lastUpdate + ", cri_id=" + cri_id + ", cri_name=" + cri_name + ", cri_des=" + cri_des + ", sc_id=" + sc_id + ", sc_name=" + sc_name + ", sc_des=" + sc_des + ", quest_id=" + quest_id + ", quest_name=" + quest_name + '}';
    }

}

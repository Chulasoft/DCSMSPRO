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

}

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
import java.util.Date;

/**
 *
 * @author 006131
 */
public class Member {

    private String username;
    private String password;
    private int type;
    private String name;
    private static int mem_id;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static int getMem_id() {
        return mem_id;
    }

    public static void setMem_id(int mem_id) {
        Member.mem_id = mem_id;
    }

    public static Member login(String username, String password) {
        Member us = null;
        try {
            Connection conn = ConnectionBuilder.getConnection();
            String sqlCmd = "select username, password, name,type,mem_id from Member where username = ? ";
            PreparedStatement pstm = conn.prepareStatement(sqlCmd);
            pstm.setString(1, username);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                if (password.equals(rs.getString("password"))) {
                    us = new Member();
                    us.setUsername(username);
                    us.setName(rs.getString("name"));
                    us.setType(rs.getInt("type"));
                    setMem_id(rs.getInt("mem_id"));
                }
            }
            conn.close();
        } catch (SQLException ex) {
            System.err.println(ex);
        }
        return us;
    }
//
//    public static int openNewAccount(BankAccount ba, User us) {
//
//        try {
//            Connection con = ConnectionBuilder.getConnection();
//            String checkUsername = "select username from users where username = ?";
//            PreparedStatement stm = con.prepareStatement(checkUsername);
//            stm.setString(1, us.getUsername());
//            ResultSet rs = stm.executeQuery();
//            if (rs.next()) {
//                return 1;
//            } else {
//                ba.setAccountId(NEXT_ID++);
//                //ba.deposit(ba.getBalance());
//                System.out.println(ba.getAccountId());
//                ba.update(true);
//                System.out.println(ba.getAccountId());
//                String sqlAddUser = "INSERT INTO USERS (USERNAME, PASSWORD, ACCOUNT_ID) VALUES (?, ?, ?)";
//                stm = con.prepareStatement(sqlAddUser);
//                stm.setString(1, us.getUsername());
//                stm.setString(2, us.getPassword());
//                stm.setLong(3, ba.getAccountId());
//                int done = stm.executeUpdate();
//                if (done > 0) {
//                    return 2;
//                }
//            }
//        } /*catch (BankAccountException e) {
//         return "Wrong deposit amount!";
//         }*/ catch (Exception e) {
//            return 3;
//        }
//        return 3;
//    }
//
//    private static long getNewId() {
//        try {
//            Connection con = ConnectionBuilder.getConnection();
//            String sqlCmd = "select account_id from bankaccount order by account_id DESC FETCH FIRST 1 ROWS ONLY";
//            ResultSet rs = con.createStatement().executeQuery(sqlCmd);
//            if (rs.next()) {
//                return rs.getLong(1) + 1;
//            } else {
//                return -1;
//            }
//        } catch (SQLException ex) {
//            System.out.println(ex);
//            return -1;
//        }
//    }
//
//    public static boolean editAccount(long accountId, String accountName) {
//        BankAccount ba = BankAccount.findById(accountId);
//        if (ba != null) {
//            ba.setAccountName(accountName);
//            ba.update();
//            System.out.println("Account ID: " + accountId + " has update name to '" + accountName + "'");
//            return true;
//        } else {
//            System.out.println(accountId + " does not exist !!!");
//            return false;
//        }
//    }
//
//    public static boolean changePassword(long accountId, String password, String oldPassword) {
//        try {
//            Connection con = ConnectionBuilder.getConnection();
//            String sqlCmd = "select account_id, password from users where account_id = ?";
//            PreparedStatement stm = con.prepareStatement(sqlCmd);
//            stm.setLong(1, accountId);
//            ResultSet rs = stm.executeQuery();
//            if (rs.next()) {
//                if (rs.getString("password").equals(oldPassword)) {
//                    sqlCmd = "UPDATE users SET password=? WHERE account_id =?";
//                    stm = con.prepareStatement(sqlCmd);
//                    stm.setString(1, password);
//                    stm.setLong(2, accountId);
//                }else{
//                    return false;
//                }
//                int done = stm.executeUpdate();
//                if (done > 0) {
//                    return true;
//                } else {
//                    return false;
//                }
//            } else {
//                return false;
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//            return false;
//        }
//    }
//    
//    
}

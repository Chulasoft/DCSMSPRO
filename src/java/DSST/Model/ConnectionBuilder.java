/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DSST.Model;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author khaitong
 */
public class ConnectionBuilder {

     public static Connection getConnection() {
        Connection con = null;
        try {
            Context ctx = null;
            ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("jdbc/DSST");
            con = ds.getConnection();
        } catch (NamingException ex) {
            System.out.println(ex);
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return con ;
    }

}

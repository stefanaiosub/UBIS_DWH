

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class Database {
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    private static final String USER = "biblioteca";
    private static final String PASSWORD = "stefana";
    private static Connection connection =null;
    private Database() { }
    public static Connection getConnection() {

        if (connection == null) {
            createConnection();
        }
        return connection;
    }



    private static Connection createConnection() {
        try{
            Class.forName( "oracle.jdbc.driver.OracleDriver");
        }catch (ClassNotFoundException e){
            System.out.println("OracleDriver not found!");
            e.printStackTrace();
            return null;
        }
        try{
            connection= DriverManager.getConnection( URL,USER,PASSWORD);

        }catch(SQLException e){
            System.out.println("Connection Failed!");
            e.printStackTrace();
            return null;
        }
        if(connection!=null){
            System.out.println("Connection succesful!!");
            return connection;
        }else {
            System.out.println("Connection did not succeed!");
            return null;
        }
    }

    public static void closeConnection() throws SQLException {
        if (connection != null)  connection.close();
    }

    public static void commit() throws SQLException {
        if (connection != null)
        {connection.setAutoCommit(false);
            connection.commit();
        }}
    public static void rollback() throws SQLException {
        if (connection != null) {
            connection.setAutoCommit(false);
            connection.rollback();
        }
    }

}
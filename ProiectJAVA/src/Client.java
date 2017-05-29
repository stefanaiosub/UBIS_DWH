import java.sql.*;
import java.util.List;

public class Client {

        public void create(String CNP, String nume, String domiciliu, String email) throws SQLException {
            Connection con = Database.getConnection();
            if (con != null) {

                try

                        (PreparedStatement pstmt = con.prepareStatement("insert into client(CNP,nume_client,autor,domiciliu,email) values(?,?,?,?);")){
                    pstmt.setString(1, CNP);
                    pstmt.setString(2,nume);
                    pstmt.setString(3,domiciliu);
                    pstmt.setString(4, email);

                    pstmt.executeUpdate();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        public Integer findByName(String cnp) throws SQLException {
            Connection con = Database.getConnection();
            try (Statement stmt = con.createStatement()) {
                ResultSet rs = stmt.executeQuery("select * from client where CNP='" + cnp + "''");
                Integer id = rs.next() ? rs.getInt(1): null;
                rs.close();
                return id;
            }
        }
    }


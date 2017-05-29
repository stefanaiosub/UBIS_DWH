import java.sql.*;

public class Carte {

    //List<String> lista_autori =new ArrayList<String>();


    public void create(String ISBN, String title, String date, String publisher, int availability, int quantity) throws SQLException {
        Connection con = Database.getConnection();
        //lista_autori.add(authors);
        if (con != null) {

            try


                    (PreparedStatement pstmt = con.prepareStatement("insert into carte(ISBN,nume_carte,data_publicare,editura,disponibilitate,cantitate) values(?,?,?,?,?,?);")) {
                pstmt.setString(1, ISBN);
                pstmt.setString(2, title);
                pstmt.setString(3, date);
                pstmt.setString(4, publisher);
                pstmt.setInt(5, availability);
                pstmt.setInt(6, quantity);

                pstmt.executeUpdate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public String findByName(String nume_carte) throws SQLException {
        Connection con = Database.getConnection();
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery("select * from carte where nume_carte='" + nume_carte + "'");
            String id = rs.next() ? rs.getString(1) : null;
            rs.close();
            return id;
        }
    }

    public String isAvailable(String nume_carte) throws SQLException {
        Connection con = Database.getConnection();
        String s;
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery("select disponibilitate from carte where nume_carte='" + nume_carte + "'");
            int id = rs.next() ? rs.getInt(1) : null;
            rs.close();
            if (id == 0)
               s = "Cartea cautata nu este disponibila!";
            else s="Cartea cautata este disponibila!";
            return s;

        }

    }
}


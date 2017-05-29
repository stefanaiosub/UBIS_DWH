import java.sql.SQLException;

public class Main {

        public static void main(String[] args) throws SQLException {
            try {
                Carte carte=new Carte();

                //carte.create("978-99924-0-9","Ciresarii","28.jan.2001","Rao",1,13);
                //carte.create("978-99923-0-3","Harry Potter si prizonierul din Azkaban","17.mar.2006","Arte",1,12);
                //Database.commit();

// Cautam ISBN-ul dupa numele cartii; Utilizare: putem vedea in functie de asta daca respectiva carte este sau nu disponibila;

//CAZ 1: nu exista cartea;-va returna null;

                String data = carte.findByName("Poezii");
                Database.commit();

                System.out.println("Codul ISBN pentru cartea cautata este: "+data);
                System.out.println(" ");

//CAZ 2: exista cartea;- va returns codul ISBN

                String data1 = carte.findByName("Rosu si negru");
                Database.commit();

                System.out.println("Codul ISBN pentru cartea cautata este: "+data1);
                System.out.println(" ");


 //in functie de numele cartii, vedem daca este disponibila pentru imprumut sau nu:


//CAZ 1: nu este;

             System.out.println(carte.isAvailable("Antologie de poezii"));
//CAZ 2: este;
                System.out.println( carte.isAvailable("Harry Potter si Camera Secretelor"));
                Database.commit();




/*
                Client client =new Client();

                client.create("2122319826486","Iosub Stefana","Iasi","stefanaiosub@gmail.com");
                client.create("1122319812093","Luca Iustin","Suceava","lucaiustin@yahoo.com");
                client.create("1240619981235","Popescu Damian","Braila","pdamian@gmail.com");

                Database.commit();
  */


            } catch (SQLException e) {
                System.err.println(e);
                Database.rollback();
            } finally {
                Database.closeConnection();
            }
        }
    }



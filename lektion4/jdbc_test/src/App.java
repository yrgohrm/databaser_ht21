import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class App {
    public static void main(String[] args) throws Exception {
        String db = "jdbc:mysql://localhost/dbLektion4";
        String user = "root";
        String pwd = "someP4ssword";

        try (Connection conn = DriverManager.getConnection(db, user, pwd)) {

            simpleQuery(conn);
            forbiddenCode(conn, "nisse@example.com");
            forbiddenCode(conn, "nisse@example.com' AND newsletter = (SELECT COUNT(*) > 0 FROM secret WHERE id = 5) AND name <> '");
            printMatching(conn, true);
            System.out.println("new key = " + insert(conn, "xxxxyyy@example.com", false, true));

        } catch (SQLException ex) {
            System.out.println("Oh noes: " + ex.getMessage());
        }
    }

    private static void simpleQuery(Connection conn) throws SQLException {
        final String query = "SELECT id, email, newsletter, spam FROM contacts";
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
                String email = rs.getString("email");
                boolean news = rs.getBoolean("newsletter");
                boolean spam = rs.getBoolean("spam");
                System.out.printf("%d %s %b %b%n", id, email, news, spam);
            }
        }
    }

    private static void forbiddenCode(Connection conn, String email) throws SQLException {
        final String query =
                "SELECT id, newsletter, spam FROM contacts WHERE email = '" + email + "';";
        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);

            while (rs.next()) {
                int id = rs.getInt("id");
                boolean news = rs.getBoolean("newsletter");
                boolean spam = rs.getBoolean("spam");
                System.out.printf("%d %b %b%n", id, news, spam);
            }
        }
    }

    private static void printMatching(Connection conn, boolean newsletter) throws SQLException {
        String query = "SELECT email FROM contacts WHERE newsletter=?";
        try (PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setBoolean(1, newsletter);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                String email = rs.getString("email");
                System.out.printf("%s %b%n", email, newsletter);
            }
        }
    }

    private static long insert(Connection conn, String email, boolean news, boolean spam)
            throws SQLException {
        String insertStmt = "INSERT INTO contacts (email, newsletter, spam)" + " VALUES (?, ?, ?)";
        try (PreparedStatement stmt =
                conn.prepareStatement(insertStmt, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, email);
            stmt.setBoolean(2, news);
            stmt.setBoolean(3, spam);
            stmt.executeUpdate();
            ResultSet keys = stmt.getGeneratedKeys();
            if (keys.next()) {
                return keys.getLong(1);
            }

            throw new RuntimeException("oops!");
        }
    }

}

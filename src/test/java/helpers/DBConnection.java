package helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    private static final String connectionURL = "jdbc:sqlite:/Users/krunalb/Library/DBeaverData/workspace6/.metadata/sample-database-sqlite-1/Chinook.db";

    public static void addNewEmployee(int empID, String lastName, String firstName, String jobTitle) {
        try (Connection connection = DriverManager.getConnection(connectionURL)) {
            connection.createStatement().execute("INSERT into Employee (EmployeeId,LastName,FirstName,Title,BirthDate) values ("+empID+","+lastName+","+firstName+","+jobTitle+",\"1991-10-28 00:00:00\");");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

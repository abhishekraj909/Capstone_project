<%@page import="com.project.ConnectionProvider"%>
<%@ page import="java.sql.*"%>

<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String mobilenumber = request.getParameter("phonenumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String password = request.getParameter("password");
String address = "";
String city = "";
String state = "";
String country = "";

// Perform basic validation on user input
if (name == null || name.trim().isEmpty() ||
    email == null || email.trim().isEmpty() ||
    mobilenumber == null || mobilenumber.trim().isEmpty() ||
    securityQuestion == null || securityQuestion.trim().isEmpty() ||
    answer == null || answer.trim().isEmpty() ||
    password == null || password.trim().isEmpty()) {
    response.sendRedirect("signup.jsp?msg=invalid");
    return;
}

// Sanitize user input to prevent SQL injection attacks
name = name.trim();
email = email.trim();
mobilenumber = mobilenumber.trim();
securityQuestion = securityQuestion.trim();
answer = answer.trim();
password = password.trim();

// Insert user registration data into the "users" table
try (Connection con = ConnectionProvider.getCon();
     PreparedStatement ps = con.prepareStatement("INSERT INTO users (name, email, mobilenumber, security_question, answer, password, address, city, state, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
    ps.setString(1, name);
    ps.setString(2, email);
    ps.setString(3, mobilenumber);
    ps.setString(4, securityQuestion);
    ps.setString(5, answer);
    ps.setString(6, password);
    ps.setString(7, address);
    ps.setString(8, city);
    ps.setString(9, state);
    ps.setString(10, country);
    ps.executeUpdate();
    response.sendRedirect("signup.jsp?msg=valid");
} catch (SQLException e) {
    System.err.println("Error inserting user registration data: " + e.getMessage());
    response.sendRedirect("signup.jsp?msg=invalid");
}
%>
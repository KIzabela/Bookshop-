<%-- 
    Document   : rejestracjadanych
    Created on : 2015-05-25, 17:40:02
    Author     : Izabela
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
import java.sql.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@ page language="java" import="java.sql.*" %>
<% // pobieranie parametrów
String login = request.getParameter("login");
String haslo = request.getParameter("haslo");
String imie = request.getParameter("imie");
String nazwisko = request.getParameter("nazwisko");
String miejscowosc = request.getParameter("miejscowosc");
String kod = request.getParameter("kod");
String ulica=request.getParameter("ulica");
String email=request.getParameter("email");

 Connection conn = null;
        try {
            String driverName = "oracle.jdbc.driver.OracleDriver"; //przypisanie sterowników do zmiennej typu String
            Class.forName(driverName); // Ładowanie sterownika
            String url = "jdbc:oracle:thin:@localhost:1521:test"; //przypisanie adresu URL do zmiennej typu String
            String username = "system"; //przypisanie nazwy uzytkownika do zmiennej typu String
            String password = "KITest33"; //przypisanie hasła uzytkownika do zmiennej typu String
            conn = DriverManager.getConnection(url, username, password); //nawiązanie połączenia z bazą
            
        } catch (ClassNotFoundException e) { // wychwytywanie i obsługa wyjątków
            out.println("Nie moge znalesc sterownika" + e.getMessage());
        } catch (SQLException e) {
            out.println("Nie moge sie polaczyc" + e.getMessage());
        }
        
       
CallableStatement stmt = conn.prepareCall("{call nowy_klient(?,?,?,?,?,?,?,?)}"); // wywolanie procedury dodajacej klienta do bazy danych


//parametry funkcji
stmt.setString(1, login);
stmt.setString(2, haslo);
stmt.setString(3, imie);
stmt.setString(4, nazwisko);
stmt.setString(5, miejscowosc);
stmt.setString(6, kod);
stmt.setString(7, ulica);
stmt.setString(8, email);

stmt.execute(); //wykonanie
stmt.close(); // zamknięcie obiektu stmt


 out.println("<font style=' color: #990000'> Rejestracja online została pomyślnie zakończona.<br/>Od teraz możesz zamawiać  książki, korzystajac ze swojego konta online.<br/> <a href='index.jsp'>Przejdz do logowania</a></font>");
%>
    </body>
</html>

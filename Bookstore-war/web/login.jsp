<%-- 
    Document   : login
    Created on : 2015-05-27, 00:50:36
    Author     : Izabela
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<html>
    
    <body text="#5f5f5f"  link="#999999" vlink="#999999" alink="#999999">
        
<%
   // pobieranie parametrow
    String login = request.getParameter("login");
    String haslo = request.getParameter("haslo");
    
   Connection conn = null;
   String driverName = "oracle.jdbc.driver.OracleDriver"; // przypisanie sterownikow do zmiennej typu String
   Class.forName(driverName); // załadowanie sterownika
   String url = "jdbc:oracle:thin:@localhost:1521:test";  // przypisanie adresu url do zmiennej typu String
   String username = "system"; // przypisanie nazwy uzytkownika do zmiennej typu String
   String password = "KITest33"; // przypisanie hasla uzytkownika do zmiennej typu String
            conn = DriverManager.getConnection(url, username, password); // nawiazywanie polaczenia z baza
            
    Statement st = conn.createStatement();
    ResultSet rs; // utworzenie obiektu przechowujacego wynik zapytania sql
    rs = st.executeQuery("SELECT * FROM KLIENCI where LOGIN='" + login + "' and HASLO='" + haslo + "'");
    if (rs.next()) {
        session.setAttribute("login", login);
        session.setAttribute("haslo", password);
        response.sendRedirect("koszyk.jsp"); // przekierowanie do konta klienta
    } else {
        out.println ("Błąd!<br/>"); 
        out.println(" <font style='color:red'> Hasło </font>lub <font style='color:red'>login</font> został wprowadzony niepoprawnie, <a href='index.jsp'>Sprubuj ponownie</a>, lub skorzystaj z darmowej <a href='rejestracja.jsp'>rejestracji</a> online jesli nie posiadasz konta ");
    }
       
%>
        
    </body></html>
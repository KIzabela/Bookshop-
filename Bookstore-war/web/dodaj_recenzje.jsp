<%-- 
    Document   : dodaj_recenzje
    Created on : 2015-06-04, 17:23:54
    Author     : IZA
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@ page language="java" import="java.sql.*" %>
<%
// poranie parametrow
String idksiazki = request.getParameter("idk");
String recenzja = request.getParameter("tekst");

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
        
        
        Object log = session.getAttribute( "login" );
      
       CallableStatement st = conn.prepareCall("{ ? = call zwroc_id(?)}"); // wywolanie funkcji zwracajacej id klienta
        
        st.setObject(2, log); // parametr funkcji
        
       st.registerOutParameter(1, Types.INTEGER); // informacja o typie zwracanym przez funkcje
       
       
       st.execute(); // wykonanie
       int x = st.getInt(1); // pobranie parametru zwracanego przez funkcje
       st.close(); // zamkniecie obiektu st
       
     
        
        
        int idks=Integer.parseInt(idksiazki); // rzutowanie
        
        CallableStatement stmt = conn.prepareCall("{call dodaj_recenzje(?,?,?)}"); // wywolanie procedury wstawiajacej recenzje klienta do tabeli recenzje
        
        //parametry procedury
        stmt.setString(1, recenzja);
        stmt.setInt(2, x);
        stmt.setString(3, idksiazki);
        
        stmt.execute();// wykonanie
        stmt.close(); // zamkniecie obiektu stmt


 out.println("<font style=' color: #990000'> Dziekujemy za dodanie recenzji.<br/> <a href='index.jsp'>Przejdz do strony głównej</a></font>");
%>
    </body>
</html>

        
        

<%-- 
    Document   : aktualizacjadanych
    Created on : 2015-06-04, 18:31:33
    Author     : IZA
--%>

<%@page import="java.sql.*"%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@ page language="java" import="java.sql.*" %>
<%

    


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
        
        
            
String hasloo = request.getParameter("haslo"); // Pobranie parametru


        Object log = session.getAttribute( "login" ); // rzutowanie
      
       CallableStatement st = conn.prepareCall("{ ? = call zwroc_id(?)}"); // wywolanie funkcji zwracajacej id klienta
        
        st.setObject(2, log); // parametr funkcji
        
       st.registerOutParameter(1, Types.INTEGER); // informacja o typie parametru zwracanego przez fukncje
       
       
       st.execute(); // wykonanie
       int x = st.getInt(1); // pobieranie zwracanej wartosci przez funkcje
       st.close(); // zamkniecie obiekty st
        
       
       
CallableStatement stmt = conn.prepareCall("{ call nowehaslo(?,?)}"); // wywolanie funkcji aktualizujacej hasło

        stmt.setInt(1, x); // parametr funkcji
        stmt.setString(2, hasloo); // parametr funkcji
        
        stmt.execute(); // wykonanie
        stmt.close(); // zamkniecie obiekty st
        
 out.println("<font style=' color: #990000'> Hasło zostało zaktualizowane.<br/></font> <a href='index.jsp'>Przejdz do strony głównej</a>");

%>

    </body></html>


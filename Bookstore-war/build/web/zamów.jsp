<%-- 
    Document   : zamów
    Created on : 2015-06-03, 18:54:39
    Author     : IZA
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
           <div style="clear:both">
            
        </div>
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
        
        
      Object log = session.getAttribute( "login" );
      
       CallableStatement stmt = conn.prepareCall("{ ? = call zwroc_id(?)}"); // wywolanie funkcji zwracajacej id klienta
        
        stmt.setObject(2, log); // przypisanie parametru
        
       stmt.registerOutParameter(1, Types.INTEGER); // informacja o typie parametru zwracanego przez funkcje
       
       
       stmt.execute(); //wykonanie
       int x = stmt.getInt(1); // pobranie wartosci zwracanej przez funkcje
       stmt.close(); // zamkniecie obiektu stmt
       
     CallableStatement st = conn.prepareCall("{ ? = call zamow(?)}"); // wywolanie funkcji wstawiajacej dane do tabeli zamowienia
     
     st.setInt(2, x); // parametr funkcji
     st.registerOutParameter(1, Types.INTEGER); // informacja o typie parametru zwracanego przez funkcje
     
   st.execute(); // wykonaj
   int y = st.getInt(1); // pobranie parametru zwracanego przez funkcje
   st.close(); // zamykanie obiektu st
   
    %>
   
<div>
    
    <form  action="zamów_ksiazke.jsp"  method="post">
         <input type="hidden" name="idzamm" value="<%=y%>" /> 
       Kontynuuj zamówienie: <INPUT TYPE="SUBMIT" VALUE="Kontynuuj">
         
       
        </form>
       
        Przerwij zamówienie: <input type="button" name="mojeksiazki" value="zakończ" onclick="window.location='koszyk.jsp'"/>

   
</div>
    </body>
</html>


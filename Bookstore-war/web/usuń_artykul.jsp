<%-- 
    Document   : usuń_artykul
    Created on : 2015-06-05, 22:32:05
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
        
        // pobieranie i rzutowanie parametrow
         String idzam = request.getParameter("idzam");
             int y= Integer.parseInt(idzam);
             
             String idk = request.getParameter("idk");
             int x= Integer.parseInt(idk);
             
             String z = request.getParameter("ilosc");
             int ilosc= Integer.parseInt(z);
             
            CallableStatement stmt = conn.prepareCall("{ call usun_artykul(?,?,?)}"); // wywolanie procedury usuwającej artykul z tabeli artykuly

            //parametry funkcji
             stmt.setInt(1, x);
              stmt.setInt(2, y);
              stmt.setInt(3, ilosc);
              
          
            stmt.execute(); // wykonanie
            stmt.close(); // zamkniecie obiektu stmt
         
        %>
        Artykuł został usunięty z zamówienia.<br/>
        <br/> <form  action="wartosc_koszyka.jsp"  method="post">
             <input type="hidden" name="idzamm" value="<%=idzam%>">
            
             <INPUT TYPE="SUBMIT" VALUE="Wróć do koszyka">
        </form>
             
             <form  action="zamów_ksiazke.jsp"  method="post">
         <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
       Kontynułuj zamówienie: <INPUT TYPE="SUBMIT" VALUE="Kontynułuj">
         
       
        </form>
       
        Przerwij zamówienie: <input type="button" name="mojeksiazki" value="zakończ" onclick="window.location='koszyk.jsp'"/>

    </body>
</html>

<%-- 
    Document   : wiecejinfo
    Created on : 2015-06-01, 21:32:06
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
        
        
            // pobieranie parametrow
String ilosc = request.getParameter("ilosc");
String idksiazki = request.getParameter("idksiazki");
String idzam = request.getParameter("idzam");

// konwersacja 
int il = Integer.parseInt(ilosc);
int idk = Integer.parseInt(idksiazki);
int zam = Integer.parseInt(idzam);

        
CallableStatement stmt = conn.prepareCall("{ ? = call wstaw_artykuly(?,?,?)}"); // wywolanie funkcji wstawiajacej dane do tabeli artykuly

    // parametry funkcji
        stmt.setInt(2, idk);
        stmt.setInt(3, il);
        stmt.setInt(4, zam);
        
        
        
       stmt.registerOutParameter(1, Types.INTEGER); // okreslenie typu zwracanego przez funkcje
       
       stmt.execute(); // wykonanie
       int x = stmt.getInt(1); // pobranie parametru zwracanego przez funkcje
       
       stmt.close(); // zamkniecie obiektu stmt
       
       if(x==1){ 
           %>
           <form action="zamów_ksiazke.jsp" method="post"> 
            <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
            Kontynuuj zamówienie:
            <INPUT TYPE="SUBMIT" VALUE="Kontunuuj">
           
           </form>
            Sprawdz zawartość swojego koszyka:
         <form action="wartosc_koszyka.jsp" method="post"> 
            <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
            <INPUT TYPE="SUBMIT" VALUE="Twój koszyk">
           
           </form>
            
                 Zakończ zamówienie:
 <input type="button" name="mojeksiazki" value="Zamawiam" onclick="window.location='koszyk.jsp'"/>
           <%
       }
       else
       { %>
       Przepraszamy!<br/>
       Brak takiej ilości na magazynie.<br/>
        <form action="zamów_ksiazke.jsp" method="post"> 
            <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
            Kontynułuj zamówienie:
            <INPUT TYPE="SUBMIT" VALUE="Kontunuluj">
           
           </form>
                             Zakończ zamówienie:
 <input type="button" name="mojeksiazki" value="Zakończ" onclick="window.location='koszyk.jsp'"/>
           <%
       }
%>
    </body>
 </html>
    
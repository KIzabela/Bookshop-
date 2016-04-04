<%-- 
    Document   : zmien_ilosc
    Created on : 2015-06-05, 21:16:43
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
             
             String il= request.getParameter("ilosc");
             int z= Integer.parseInt(il);
             
              String akt= request.getParameter("aktualnailosc");
             int aktil= Integer.parseInt(akt);
             
             
             CallableStatement stmt = conn.prepareCall("{ ?=call zmienilosc(?,?,?,?)}"); // wywolanie funkcji zmieniajaca ilosc egzemplarzy danej ksiazki w koszyku klienta

             //parametry funkcji
             stmt.setInt(2, y);
              stmt.setInt(3, x);
               stmt.setInt(4, z);
               stmt.setInt(5, aktil);
           stmt.registerOutParameter(1, Types.INTEGER); //informacja o typie parametru zwracajacego przez funkcje
       
       stmt.execute(); //wykonanie
       int xx = stmt.getInt(1); // pobranie parametru zwracanego przez funkcje
       
       stmt.close(); // zamkniecie obiektu stmt
        
              if(xx==1){ // jesli parametr zwracany przez funkcje jest rowny 1 ...
           %>
           Ilość została zmieniona.<br/>
           <form action="zamów_ksiazke.jsp" method="post"> 
            <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
            Kontynułuj zamówienie:
            <INPUT TYPE="SUBMIT" VALUE="Kontunuluj">
           
           </form>
            Wróć do koszyka:
         <form action="wartosc_koszyka.jsp" method="post"> 
            <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
            <INPUT TYPE="SUBMIT" VALUE="Twój koszyk">
           
           </form>
            
                 Zakończ zamówienie:
 <input type="button" name="mojeksiazki" value="Zamawiam" onclick="window.location='koszyk.jsp'"/>
           <%
       }
           if(xx==2){ // ... jesli 2
               %>
                       Podałeś tą samą ilość.<br/>
           <form action="zamów_ksiazke.jsp" method="post"> 
            <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
            Kontynułuj zamówienie:
            <INPUT TYPE="SUBMIT" VALUE="Kontunuluj">
           
           </form>
            Wróć do koszyka:
         <form action="wartosc_koszyka.jsp" method="post"> 
            <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
            <INPUT TYPE="SUBMIT" VALUE="Twój koszyk">
           
           </form>
            
                 Zakończ zamówienie:
 <input type="button" name="mojeksiazki" value="Zamawiam" onclick="window.location='koszyk.jsp'"/>
               
               <%
           }
       if(xx==-1) // ... jesli -1
       {%>
           Ilość nie została zmieniona. 
           <br/>Brak takiej ilości na magazynie.<br/> Przepraszamy!<br/>
           <form  action="wartosc_koszyka.jsp"  method="post">
             <input type="hidden" name="idzamm" value="<%=idzam%>">
            
             <INPUT TYPE="SUBMIT" VALUE="Wróć do koszyka">
        </form>
             <form  action="zamów_ksiazke.jsp"  method="post">
         <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
       Kontynułuj zamówienie: <INPUT TYPE="SUBMIT" VALUE="Kontynułuj">
         
       
        </form>
       
        Przerwij zamówienie: <input type="button" name="mojeksiazki" value="zakończ" onclick="window.location='koszyk.jsp'"/>

           
           <%
       }
%>
        <br/> 
    </body>
</html>

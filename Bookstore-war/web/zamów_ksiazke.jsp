<%-- 
    Document   : zamów_ksiazke
    Created on : 2015-06-04, 12:00:38
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
        
        // popranie i rzutowanie parametrow
        String idzam = request.getParameter("idzamm");
        int y= Integer.parseInt(idzam);
        
    Statement stt = conn.createStatement();  
    ResultSet rs; // utworzenie obiektu rs przechowujacego wynik zapytania sql
    rs = stt.executeQuery("SELECT IDKSIAZKI,TYTUL,CENA FROM KSIAZKI");
    
    int i=1;
    while (rs.next())
        
     
{ %>
   
<div>
    <table style='background-color: #f1f1f1; table-layout: fixed; width: 70%; text-align: center ' align='center' border='1' cellspacing='0'>
<tr>
  
  
    <td>
            <%out.print(rs.getString(2));%>

    </td>
    <td>
            <%out.print(rs.getString(3));%>

    </td>
    
    <td>
        <form  action="dodaj_artykul.jsp"  method="post">
        Dodaj do koszyka.<br/>
     <input type="hidden" name="idksiazki" value="<%=rs.getString(1)%>">
        <input type="hidden" name="idzam" value="<%=y%>" /> 
    Liczba sztuk:<br/>
    <INPUT TYPE="TEXT" NAME="ilosc"><br/>
    <INPUT TYPE="SUBMIT" VALUE="Dodaj">
         
       
        </form>

             
    </td> 
  </tr>
    </table>
        </div>
<%

               i++;
 
}

    %>
        Sprawdz zawartość swojego koszyka:
         <form action="wartosc_koszyka.jsp" method="post"> 
            <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
            <INPUT TYPE="SUBMIT" VALUE="Twój koszyk">
           
           </form>
    </body>
</html>


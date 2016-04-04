<%-- 
    Document   : wartosc_koszyka
    Created on : 2015-06-05, 16:38:47
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
        
        // pobieranie i rzutowanie parametru
             String idzam = request.getParameter("idzamm");
             int y= Integer.parseInt(idzam);
             
             CallableStatement stmt = conn.prepareCall("{ ? = call cena_zakupu(?)}"); // wywolanie funkcji zwracajacej łączną cene artykułów znajdujących sie w koszyku

        stmt.setInt(2, y); // parametr funkcji
        
        
        
       stmt.registerOutParameter(1, Types.FLOAT); // informacja o zwracanym typie
       
       stmt.execute(); //wykonanie
       float x = stmt.getFloat(1); // pobieranie wartosci zwracanej przez funkcje
       
       
       stmt.close(); // zakmniecie obiektu stmt
       
       
             
            %>
            <div>
                <h1><font style=" color: #990000">Wartość Twojego koszyka wynosi: <%=x%></font></h1> <br></br>
            </div>
            <div style="clear:both">
            <table style='background-color: #f1f1f1; table-layout: fixed; width: 70%; text-align: center ' align='center' border='1' cellspacing='0'>
                <tr>
                    
                    <td>Tytuł książki</td>
                    <td>Cena</td>
                    <td>Ilość sztuk</td>
                    <td>Usuń z koszyka</td>
                </tr>
                
            </table>
        </div>
            
            <%
             
                 Statement st = conn.createStatement();  
    ResultSet rs; // utworzenie obiektu rs przechowujacego wynik zapytania sql
    rs = st.executeQuery("SELECT IDKSIAZKI,TYTUL,CENA,SZTUK FROM KSIAZKI NATURAL JOIN ARTYKULY WHERE IDZAMOWIENIA= "+y+"");
    
    int i=1;
    while (rs.next())
        
     
{ %>
<div>
    <table style='background-color: #f1f1f1; table-layout: fixed; width: 70%; text-align: center ' align='center' border='1' cellspacing='0'>
<tr>
  
    <td>
        <font style=" color: #990000"> <%out.print(rs.getString(2));%> </font>

    </td>
    <td>
        <font style=" color: #990000"> <%out.print(rs.getString(3));%> </font>

    </td>
    <td>
        <font style=" color: #990000"><%out.print(rs.getString(4));%></font><br/><br/>
            
             Zmień ilość.<br/>
             <form  action="zmien_ilosc.jsp"  method="post">
             <input type="hidden" name="idzam" value="<%=idzam%>">
             <input type="hidden" name="idk" value="<%=rs.getString(1)%>">
             <input type="hidden" name="aktualnailosc" value="<%=rs.getString(4)%>">
              Wstaw nową wartość:
             <INPUT TYPE="TEXT" NAME="ilosc"><br/>
   
             <INPUT TYPE="SUBMIT" VALUE="Zmień">
         
       
        </form>

            
            

    </td>
    
    <td>
        <form  action="usuń_artykul.jsp"  method="post">
        Zrezygnuj z tego zamówienia.<br/>
       <input type="hidden" name="idzam" value="<%=y%>">
       <input type="hidden" name="idk" value="<%=rs.getString(1)%>">
        <input type="hidden" name="ilosc" value="<%=rs.getString(4)%>">
   
       <INPUT TYPE="SUBMIT" VALUE="Usuń z koszyka">
         
       
        </form>

             
    </td> 
  </tr>
      
            </table>
        
  
        <%

               i++;
 
}

    %>
    
    
    kontynuuj zamówienie:
         <form action="zamów_ksiazke.jsp" method="post"> 
            <input type="hidden" name="idzamm" value="<%=idzam%>" /> 
            <INPUT TYPE="SUBMIT" VALUE="Kontynuuj">
           
           </form>
        Zakończ zamówienie:
 <input type="button" name="mojeksiazki" value="Zamawiam" onclick="window.location='koszyk.jsp'"/>

    </body>
</html>

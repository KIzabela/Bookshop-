<%-- 
    Document   : aktualizuj_dane
    Created on : 2015-06-04, 18:24:13
    Author     : IZA
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Witaj na stronie naszej Księgarni</title>
        <script type="text/javascript" src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/jss.js"></script> 
        <link rel="stylesheet" href="css/style.css" type="text/css" />
        <link rel="stylesheet" id="css/camera-css"  href="css/camera.css" type="text/css" media="all">  
    </head>

    <body bgcolor="white" text="#5f5f5f"  link="#999999" vlink="#999999" alink="#999999" >
        <div>

            <div style="float: left; width: 300px">  </br></div>
            <div style="float: left"> <img src="pictures/logo1.jpg"></div>

            <div style="float: left">
                <h1>"Kto czyta książki, żyje podwójnie"</h1>
                - Umberto Eco
                
            </div>
            <div style="clear: both"></div>
            <div id="menu">
                <ul class="nav">
                    <li><a href="index.jsp">Strona glowna</a></li>
                    <li><a href="logowanie.jsp">Zaloguj się/Załóż konto</a></li>
                    <li><a href="baza.jsp">Baza książek</a>

                    <li><a href="wydawnictwa.jsp">Wydawnictwa</a></li>
                    <li><a href="koszyk.jsp">Twoje konto</a></li>
                    <li><a href="kontakt.jsp">Kontakt</a></li>

                </ul>
            </div>

        </div>
       
        <div style="clear: both">
            
                
         <br/><br/><br/><br/><br/>
         
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
      
       CallableStatement stmt = conn.prepareCall("{ ? = call zwroc_id(?)}"); // wywolanie parametru zwracajacego id klienta
        
        stmt.setObject(2, log); // parametr funkcji
        
       stmt.registerOutParameter(1, Types.INTEGER); // informacja o typie wartosci zwracanej przez funkcje
       
       
       stmt.execute(); // wykonanie
       int x = stmt.getInt(1); // pobranie parametru
       stmt.close(); // zamkniecie obiektu stmt
       %>
        </div>
         <div id="1" style='float: left; width: 550px' ></div>
        <div id="2" style='float: left'>
        
            <h1><font style=" color: #990000">Zmień swoje hasło</font></h1> <br></br>
                 <br/><br/>
                  Podaj nowe hasło dla użytkownika:<%= session.getAttribute("login" )%> <br/><br/>
                  
        <form  action="aktualizacjadanych.jsp"  method="post">
 
    Podaj nowe hasło:
    <INPUT TYPE="TEXT" NAME="haslo"><br/>
    <INPUT TYPE="SUBMIT" VALUE="Zmień">
         
       
        </form>
        </div>
    </body>
</html>
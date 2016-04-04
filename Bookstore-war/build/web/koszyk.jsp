<%-- 
    Document   : koszyk
    Created on : 2015-05-27, 00:52:29
    Author     : Izabela
--%>

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
     
        <div> <br/><br/><br/><br/><br/><br/></div><div style="text-align: center">
        <% Object log = session.getAttribute("login");
            if (log == null){
            
                %>
        Nie jesteś zalogowanym użytkownikiem. <a href='logowanie.jsp'>Zaloguj się</a> lub <a href='rejestracja.jsp'>Załóż konto</a>
    <%} else{
                %>
        
    <font style="color: red"> Zalogowany uzytkownik: <%= session.getAttribute("login" )%> </font>
              <%    
        out.println("<a href='logout.jsp'>Wyloguj</a>");   
              %><br/><br/>
           <form name="przyciski" method="get">
                 
                  <input type="button" name="lista" value="Dodaj recenzje" onclick="window.location='recenzje.jsp'" ><br/>
                  <br></br>
              <input type="button" name="zamow" value="Złóż zamówienie" onclick="window.location='zamów.jsp'" ><br/>
              <br></br>
      <input type="button" name="mojeksiazki" value="Archiwum zamówień" onclick="window.location='twoje_zamowienia.jsp'"/><br/>
      <br></br>
   
     
      <input type="button" name="update" value="Zmień hasło" onclick="window.location='aktualizuj_dane.jsp'"/><br/>
      <br></br>
              </form>
    <% } %>
        </div>
    </body>
</html>

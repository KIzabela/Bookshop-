<%-- 
    Document   : rejestracja
    Created on : 2015-05-17, 17:35:58
    Author     : Izabela
--%>

<%-- 
    Document   : index
    Created on : 2015-05-02, 00:52:04
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
        
        <div style="float: left; width: 300px">  </br></div>
	
        <div style="clear: both" align="center">
          <h1>Rejestracja</h1><br/><br/>
        <form action="rejestracjadanych.jsp" method="post">
         Login: <input  type="text" name="login" value="" /><br/><br/>
         Hasło: <input   type="text" name="haslo" value="" /><br/><br/>
         Imie: <input type="text" name="imie" value="" /><br/><br/>
         Nazwisko: <input type="text" name="nazwisko" value="" /><br/><br/>
         Miejscowosc: <input type="text" name="miejscowosc" value="" /><br/><br/>
         Kod: <input type="text" name="kod" value="" /><br/><br/>
         Ulica: <input type="text" name="ulica" value="" /><br/><br/><br/>
         E-mail: <input type="text" name="email" value="" /><br/><br/><br/>
         
       <input type="submit" value="Wyślij" />
       <input type="reset" value="Resetuj" /><br/>
        </form></div>
         <div id="3" style="clear: both"><a href='index.jsp'>Powrót do strony głównej</a></div>
    </body>
</html>

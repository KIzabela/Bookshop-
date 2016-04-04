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
        
        
        
        
  
        <div id="2" style=" clear: both; text-align: center">
        <form id="asd" action="login.jsp"  method="post"> <br/><br/><br/>
            <h1>Księgarnia</h1>
            <br/><br/><br/>
            Login:  <input type="text" name="login" value="" />
    <br/> <br/>
 Hasło: <input type="password" name="haslo" value="" />
<br><br/>
<input   type="submit" value="Zaloguj" />
        </form>
        
    
        <br/><br/> 
        Jeśli nie posiadasz konta w naszej księgarni, możesz zarejestrować sie online.
        <br /><a href="rejestracja.jsp">Rejestracja</a>
        </div>
        <div id="3" style="clear: both"></div>
    </body>
</html>

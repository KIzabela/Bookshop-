<%-- 
    Document   : autor
    Created on : 2015-06-06, 02:05:14
    Author     : IZA
--%>

<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
            <div style="clear:both"> <br/><br/><br/>
            <table style='background-color: #f1f1f1; table-layout: fixed; width: 70%; text-align: center ' align='center' border='1' cellspacing='0'>
                <tr>
                    <td> Imie </td>
                    <td>Nazwisko</td>
                    <td>Rok urodzenia</td>
                    <td> Miejsce zamieszkania </td>
                    <td>Obywatelstwo</td>
                    
                    
                </tr>
                
            </table>
        </div>

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
        
         String id = request.getParameter("info"); // pobranie parametru
         int idd = Integer.parseInt(id); // konwersacja
        
    Statement st = conn.createStatement();  
    ResultSet rs; // utworzenie obiektu rs przechowyjacego wynik zapytania sql umieszczonego ponizej
    rs = st.executeQuery("select imie, nazwisko, rok_urodzenia, miejsce_zamieszkania, obywatelstwo from autorzy natural join autor_ksiazka where idksiazki="+idd+"");
    
    int i=1;
    while (rs.next())
        
     
{ %>
<div>
    <table style='background-color: #f1f1f1; table-layout: fixed; width: 70%; text-align: center ' align='center' border='1' cellspacing='0'>
<tr>
  
 
    <td>
            <%out.print(rs.getString(1));%>

    </td>
    <td>
            <%out.print(rs.getString(2));%>

    </td>
    
    <td>
            <%out.print(rs.getString(3));%>

    </td>
    <td>
            <%out.print(rs.getString(4));%>

    </td>
    <td>
            <%out.print(rs.getString(5));%>

    </td>
  </tr>
        </div>
            </table>
<%

               i++;
 
}

    %>
    <div>
              <br/><br/><br/>
    <a href='baza.jsp'>Powrót</a>
    </div>
        
    </body>
</html>


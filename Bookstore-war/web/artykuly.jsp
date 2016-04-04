
<%@page contentType="text/html" pageEncoding="UTF-8"%>
import java.sql.*;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@ page language="java" import="java.sql.*" %>
<%

String ilosc = request.getParameter("ilosc"); // pobranie parametru
String idksiazki = request.getParameter("idksiazki"); // pobranie parametru

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
        
        
        CallableStatement stmt = conn.prepareCall("{ ?=call wstaw_artykuly(?,?)}"); // wywolanie funkcji wstawiajacej dane do tabeli artykuly
        
        stmt.setString(2, ilosc); // parametry funkcji
        stmt.setString(3, idksiazki);
       stmt.registerOutParameter(1, Types.BOOLEAN); // typ wartosci zwracanej przez funkcje
       
       stmt.execute(); // wykonanie
       Boolean x = stmt.getBoolean(1); // pobranie parametru zwracajacego przez funkcje
       stmt.close(); // zamkniecie obiektu stmt
       
       if(x){ // jesli funkcja zwroci true..
           out.println ("Dodano do koszyka<br/>"); 
       }
       else
       {
           out.println ("Błąd!<br/>"); 
            out.println(" <font style='color:red'> Najprawdopodobniej zamówienie nie może zostać zrealizowane z powodu braku wybranej przez Ciebie książki w magazynie <a href='index.jsp'>Przejdz do koszyka w celu dalszego realizowania zamówienia</a>, lub skontaktuj się z naszym biurem<a href='rejestracja.jsp'>kontakt</a>");
        
       }}
%>
        
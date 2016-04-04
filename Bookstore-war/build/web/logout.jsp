<%-- 
    Document   : logout
    Created on : 2015-06-01, 20:54:26
    Author     : IZA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    // wylogowanie uzytkownika z sesji i przekierowanie na strone główną
session.setAttribute("logi", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
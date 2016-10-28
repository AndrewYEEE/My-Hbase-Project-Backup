<%-- 
    Document   : createtable
    Created on : Mar 23, 2016, 11:16:38 AM
    Author     : hadoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hbase.createtable"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <h1>Successful CreateTable.</h1>
        <%
        request.setCharacterEncoding("UTF-8");
        String tablename = request.getParameter("tablename");
        String family1 = request.getParameter("family1");
        String family2 = request.getParameter("family2");
        String family3 = request.getParameter("family3");
        String family4 = request.getParameter("family4");
        String family5 = request.getParameter("family5");
        
        createtable c = new createtable();
        c.createTable(tablename, family1,family2,family3,family4,family5);
        
        
        %>
    </body>
</html>

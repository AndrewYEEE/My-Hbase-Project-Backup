<%-- 
    Document   : String_test
    Created on : Apr 11, 2016, 10:57:34 PM
    Author     : hadoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("utf-8");
            String name=request.getParameter("name");
            out.println(name);
            out.println("Helloworld!!");
        %>
    </body>
</html>

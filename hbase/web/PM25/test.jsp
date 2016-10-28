<%-- 
    Document   : test_javascript_to_jsp
    Created on : Apr 11, 2016, 1:27:35 PM
    Author     : hadoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
        </script>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            String strget=request.getParameter("mc");
            
            if(strget==null){
                out.println("error");
            }else{
                out.println(strget);
            }
            
        %>
        
    </body>
</html>

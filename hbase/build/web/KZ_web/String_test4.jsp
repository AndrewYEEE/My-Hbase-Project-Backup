<%-- 
    Document   : String_test4
    Created on : Apr 26, 2016, 3:44:41 PM
    Author     : hadoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            String myJson;
            JSONObject obj = new JSONObject();
            obj.put("A", "aaa");
            obj.put("B", 123);
            obj.put("C", 1.2345);
            obj.put("D", true);

            JSONArray list = new JSONArray();
            list.put("E");
            list.put("F");
            list.put("G");
            list.put(obj);            
            /*JSONObject m = new JSONObject();
            //Map m = new HashMap();
            m.put("X", "xxx");
            m.put("Y", "yyy");
            m.put("Z", "zzz");*/

            //list.put(m);

            //obj.put("Messages", m);

            myJson = list.toString();

            out.println(myJson);
            
        %>
        
    </body>
</html>

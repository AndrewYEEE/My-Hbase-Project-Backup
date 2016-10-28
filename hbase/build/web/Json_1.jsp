<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%
                JSONObject obj = new JSONObject();
                obj.put("A", "aaa");
                obj.put("B", 123);
                obj.put("C", 1.2345);
                obj.put("D", true);
                
                JSONArray list = new JSONArray();
                list.put(obj);
                list.put(obj);
                out.println(list);
                response.setHeader("Access-Control-Allow-Origin", "*");
%>
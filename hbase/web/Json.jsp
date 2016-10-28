<%-- 
    Document   : String_test3.jsp
    Created on : Apr 25, 2016, 10:27:56 PM
    Author     : hadoop
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%
            /*String myJson;
            JSONObject obj = new JSONObject();
            obj.put("A", "aaa");
            obj.put("B", 123);
            obj.put("C", 1.2345);
            obj.put("D", true);

            /*JSONArray list = new JSONArray();
            list.put("E");
            list.put("F");
            list.put("G");
            */
            
            /*        
            JSONObject m = new JSONObject();
            */
            //Map m = new HashMap();
            /*
            m.put("X", "xxx");
            m.put("Y", "yyy");
            m.put("Z", "zzz");
            */
            //list.put(m);
            /*
            obj.put("Messages", m);

            myJson = obj.toString();

            out.println(myJson);
            */
            String myJson;
             JSONObject obj = new JSONObject();
                obj.put("A", "aaa");
                obj.put("B", 123);
                obj.put("C", 1.2345);
                obj.put("D", true);
                
                JSONObject obj2 = new JSONObject();
                obj2.put("A", "aaa");
                obj2.put("B", 123);
                obj2.put("C", 1.2345);
                obj2.put("D", true);

                JSONArray list = new JSONArray();
                list.put(obj2);
                list.put(obj2);
                list.put(obj2);

                Map m = new HashMap();
                m.put("X", "xxx");
                m.put("Y", "yyy");
                m.put("Z", "zzz");

                //list.put(m);

                obj.put("Messages", obj2);

                //myJson = obj.toString();
                JSONObject Json = obj;
                out.println(list);
        %>
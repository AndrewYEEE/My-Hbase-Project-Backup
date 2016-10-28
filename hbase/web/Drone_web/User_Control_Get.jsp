<%-- 
    Document   : User_Control_Get
    Created on : Aug 9, 2016, 5:12:48 PM
    Author     : hadoop
--%>
<%@page import="org.apache.hadoop.hbase.client.Result"%>
<%@page import="org.apache.hadoop.hbase.KeyValue"%>
<%@page import="org.apache.hadoop.hbase.client.Get"%>
<%@page import="org.apache.hadoop.hbase.client.HBaseAdmin"%>
<%@page import="org.apache.hadoop.conf.Configuration"%>
<%@page import="org.apache.hadoop.hbase.HBaseConfiguration"%>
<%@page import="org.apache.hadoop.hbase.client.Put"%>
<%@page import="org.apache.hadoop.hbase.util.Bytes"%>
<%@page import="org.apache.hadoop.hbase.client.HTable"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
            JSONObject obj = new JSONObject();
    
            
            Configuration conf =null;
            conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
            conf.set("hbase.zookeeper.quorum", "Master");
            String rowkey="now";
            HTable table = new HTable(conf, "Drone_function");
            Get get = new Get(rowkey.getBytes());
            Result rs = table.get(get);
            for(KeyValue kv : rs.raw()){
                /*
                out.print(new String(kv.getRow()) + " " );
                out.print(new String(kv.getFamily()) + ":" );
                out.print(new String(kv.getQualifier()) + " " );
                out.print(kv.getTimestamp() + " " );
                out.println(new String(kv.getValue()));
                out.println("<br/>");
                */
                
                obj.put(new String(kv.getQualifier()), new String(kv.getValue()));
                
                
            }
            //out.println("<hr/>");
            table.close();
%>
<%
                JSONArray list = new JSONArray();
                list.put(obj);
                out.println(list);
                response.setHeader("Access-Control-Allow-Origin", "*");
%>

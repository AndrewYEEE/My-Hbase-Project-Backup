<%-- 
    Document   : User_Login_check
    Created on : Sep 14, 2016, 7:31:42 PM
    Author     : hadoop
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.apache.hadoop.hbase.client.Result"%>
<%@page import="org.apache.hadoop.hbase.KeyValue"%>
<%@page import="org.apache.hadoop.hbase.client.Get"%>
<%@page import="org.apache.hadoop.hbase.client.HBaseAdmin"%>
<%@page import="org.apache.hadoop.conf.Configuration"%>
<%@page import="org.apache.hadoop.hbase.HBaseConfiguration"%>
<%@page import="org.apache.hadoop.hbase.client.Put"%>
<%@page import="org.apache.hadoop.hbase.util.Bytes"%>
<%@page import="org.apache.hadoop.hbase.client.HTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            request.setCharacterEncoding("UTF-8");
            response.setHeader("Access-Control-Allow-Origin", "*");
            String Account= request.getParameter("Account");
            String Password= request.getParameter("Password");
            
            if(Account!=null && Password!=null){
                String family="temp1";
                String Rowkey=Account;
                String qualify1="Password";
                
                Configuration conf =null;
                conf = HBaseConfiguration.create();
            //如果沒有配置文件，一定要記得手動宣告

                conf.set("hbase.zookeeper.quorum", "Master");
                HTable table = new HTable(conf, "User_Table");
                Get get = new Get(Rowkey.getBytes());
                Result rs = table.get(get);
                
                String Value="";
                for(KeyValue kv : rs.raw()){
                    
                    Value=new String(kv.getValue());
                    
                }
                table.close();
                
                 if(Value.equals(Password)){
                     out.println("true");
                 }else{
                     out.println("false");
                 }
                
            }else{
                out.println("null null");
            }

    
%>

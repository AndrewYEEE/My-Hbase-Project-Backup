<%-- 
    Document   : Drone_Station_Reset
    Created on : Sep 28, 2016, 9:55:37 PM
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
                String family="Drone_station";
                String[] Station={"drone1","drone2","drone3","drone4"};
                String Rowkey=new String();
                String qualify1="Enable";
                String qualify2="User";
                Configuration conf =null;
                conf = HBaseConfiguration.create();
            //如果沒有配置文件，一定要記得手動宣告

                conf.set("hbase.zookeeper.quorum", "Master");
                HTable table = new HTable(conf, "Drone_station");
                
                for(int i=0;i<Station.length;i++){
                    Rowkey=Station[i];
                    byte[] row = Bytes.toBytes(Rowkey);
                    byte[] fam = Bytes.toBytes(family);
                    byte[] Enable_col = Bytes.toBytes(qualify1);                  
                    byte[] Enable_val = Bytes.toBytes("true");
                    byte[] User_col = Bytes.toBytes(qualify2);                  
                    byte[] User_val = Bytes.toBytes("null");
                    Put p = new Put(row);
                    p.add(fam,Enable_col,Enable_val);
                    table.put(p);
                    p.add(fam,User_col,User_val);
                    table.put(p);
                }
                
                table.close();
                out.println("Reset Station Successful!");
    
%>

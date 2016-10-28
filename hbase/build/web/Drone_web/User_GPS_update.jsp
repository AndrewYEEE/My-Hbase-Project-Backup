<%-- 
    Document   : User_GPS_update
    Created on : Jul 30, 2016, 12:48:13 PM
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
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            String Lat= request.getParameter("Lat");
            String Lng= request.getParameter("Lng");
            String tablename="Drone_function";
            String family="Drone_follow";
            String Rowkey="now";
            String qualify1="Lat";
            String qualify2="Lng";
            
            //out.println("helloWorld.");
            if(Lat!=null&&Lng!=null){
                Configuration conf =null;
                conf = HBaseConfiguration.create();
            //如果沒有配置文件，一定要記得手動宣告

                conf.set("hbase.zookeeper.quorum", "Master");
                HTable table = new HTable(conf, tablename);
                       byte[] row = Bytes.toBytes(Rowkey);
                       byte[] fam = Bytes.toBytes(family);
                       byte[] Lat_col = Bytes.toBytes(qualify1);
                       byte[] Lng_col = Bytes.toBytes(qualify2);
                       byte[] v_Lat = Bytes.toBytes(Lat);
                       byte[] v_Lng = Bytes.toBytes(Lng);


                       Put p = new Put(row);
                       p.add(fam,Lat_col,v_Lat);
                       table.put(p);
                       p.add(fam,Lng_col,v_Lng);
                       table.put(p);
                       out.println("insert user GPS latlng: " + Lat+" "+Lng+ " to family " + family +" ok.");
                 table.close();
            }else{
                        out.println("Lat: "+Lat);
                        out.println("Lng: "+Lng);
            }
            
         
            
        %>
    </body>
</html>

<%-- 
    Document   : auto_Direction_update
    Created on : Aug 9, 2016, 10:24:19 PM
    Author     : hadoop
--%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            response.setHeader("Access-Control-Allow-Origin", "*");
            String lat= request.getParameter("lat");
            String lng= request.getParameter("lng");
            /*
            JSONObject obj = new JSONObject(te);
            out.println(obj.getString("Command"));
            */
            out.println("Lat: "+lat);
            out.println("Lng: "+lng);
            out.println("<br>");
            if(lat!=null && lng!=null){
                /*
                String family="Drone_temp2";
                String Rowkey="";
                String qualify1="Lat";
                String qualify2="Lng";
                String qualify3="Point";
                int pointsumtemp=0;
                
                Configuration conf =null;
                conf = HBaseConfiguration.create();
                //如果沒有配置文件，一定要記得手動宣告

                conf.set("hbase.zookeeper.quorum", "Master");
                HTable table = new HTable(conf, "Drone_function");
                byte[] fam = Bytes.toBytes(family);
               
                
                
                for(int i=0,tempnum=0;i<lat.length();i++){
                    tempnum=lat.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    out.println(String.valueOf(lat.subSequence(i,tempnum)));
                    pointsumtemp++;
                    byte[] Lat_col = Bytes.toBytes(qualify1);                       
                    byte[] v_Lat = Bytes.toBytes(String.valueOf(lat.subSequence(i,tempnum)));
                    Rowkey=pointsumtemp+"";
                    byte[] row = Bytes.toBytes(Rowkey);
                    Put p = new Put(row);
                    p.add(fam,Lat_col,v_Lat);
                    table.put(p);
                    
                    i=tempnum;
                    tempnum++;
                }
                pointsumtemp=0;
                for(int i=0,tempnum=0;i<lng.length();i++){
                    tempnum=lng.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    out.println(String.valueOf(lng.subSequence(i,tempnum)));
                    pointsumtemp++;
                    byte[] Lnt_col = Bytes.toBytes(qualify2);                       
                    byte[] v_Lnt = Bytes.toBytes(String.valueOf(lng.subSequence(i,tempnum)));
                    Rowkey=pointsumtemp+"";
                    byte[] row = Bytes.toBytes(Rowkey);
                    Put p = new Put(row);
                    p.add(fam,Lnt_col,v_Lnt);
                    table.put(p);
                    
                    i=tempnum;
                    tempnum++;
                }
                table.close();
            }
            */
                String family="Drone_temp2";
                String Rowkey="now";
                String qualify1="Lat";
                String qualify2="Lng";
                String qualify3="PointNum";
                int pointsumtempLat=0,pointsumtempLng=0;
                
                for(int i=0,tempnum=0;i<lat.length();i++){
                    tempnum=lat.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    out.println(String.valueOf(lat.subSequence(i,tempnum)));
                    pointsumtempLat++;                   
                    i=tempnum;
                    tempnum++;
                }
                for(int i=0,tempnum=0;i<lng.length();i++){
                    tempnum=lng.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    out.println(String.valueOf(lng.subSequence(i,tempnum)));
                    pointsumtempLng++;
                    i=tempnum;
                    tempnum++;
                }
                Configuration conf =null;
                conf = HBaseConfiguration.create();
            //如果沒有配置文件，一定要記得手動宣告

                conf.set("hbase.zookeeper.quorum", "Master");
                HTable table = new HTable(conf, "Drone_function");
                       byte[] row = Bytes.toBytes(Rowkey);
                       byte[] fam = Bytes.toBytes(family);
                       byte[] Lat_col = Bytes.toBytes(qualify1);                  
                       byte[] v_Lat = Bytes.toBytes(lat);
                       byte[] Lng_col = Bytes.toBytes(qualify2);                  
                       byte[] v_Lng = Bytes.toBytes(lng);
                       byte[] Value_col = Bytes.toBytes(qualify3);                  
                       byte[] v_Value= Bytes.toBytes(pointsumtempLat+"");
                       Put p = new Put(row);
                       p.add(fam,Lat_col,v_Lat);
                       table.put(p);
                       p.add(fam,Lng_col,v_Lng);
                       table.put(p);
                       p.add(fam,Value_col,v_Value);
                       table.put(p);
                table.close();
                
            }
            
            
        %>
    </body>
</html>

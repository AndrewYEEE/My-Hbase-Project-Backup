<%-- 
    Document   : User_Control_Update
    Created on : Aug 7, 2016, 12:15:19 PM
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
            String Command= request.getParameter("Command");
            
            String tablename="Drone_function";
            String family="Drone_temp1";
            String Rowkey="now";
            String qualify1="Command";
            if(Command!=null){
                Configuration conf =null;
                conf = HBaseConfiguration.create();
            //如果沒有配置文件，一定要記得手動宣告

                conf.set("hbase.zookeeper.quorum", "Master");
                HTable table = new HTable(conf, tablename);
                       byte[] row = Bytes.toBytes(Rowkey);
                       byte[] fam = Bytes.toBytes(family);
                       byte[] Command_col = Bytes.toBytes(qualify1);
                       
                       byte[] v_Command = Bytes.toBytes(Command);
                       


                       Put p = new Put(row);
                       p.add(fam,Command_col,v_Command);
                       table.put(p);
                       out.println("Success GET User Command : "+Command+" in Drone_function.");
                 table.close();
            }else{
                       out.println("Can't GET User Command : "+Command);
            }
        %>
    </body>
</html>

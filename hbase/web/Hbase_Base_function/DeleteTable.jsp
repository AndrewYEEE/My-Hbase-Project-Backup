<%-- 
    Document   : DeleteTable.jsp
    Created on : Mar 24, 2016, 8:55:43 PM
    Author     : hadoop
--%>

<%@page import="org.apache.hadoop.hbase.client.HBaseAdmin"%>
<%@page import="org.apache.hadoop.conf.Configuration"%>
<%@page import="org.apache.hadoop.hbase.HBaseConfiguration"%>
<%@page import="org.apache.hadoop.hbase.client.Put"%>
<%@page import="org.apache.hadoop.hbase.util.Bytes"%>
<%@page import="org.apache.hadoop.hbase.client.HTable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="hbase.deleteTable"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String tablename=request.getParameter("tablename");
                
            Configuration conf =null;
            conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
            conf.set("hbase.zookeeper.quorum", "Master");
            HBaseAdmin admin = new HBaseAdmin(conf);
            admin.disableTable(tablename);
            admin.deleteTable(tablename);
            System.out.println("delete table " + tablename + " ok.");
        %>
        <h1>Successful DeleteTable.</h1>
    </body>
</html>

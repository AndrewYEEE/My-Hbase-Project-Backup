<%-- 
    Document   : addRecord
    Created on : Mar 23, 2016, 11:51:33 AM
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
        <h1>Successful Insert.</h1>
        <%
            request.setCharacterEncoding("UTF-8");
            String tablename=request.getParameter("tablename");
            String rowkey=request.getParameter("rowkey");
            String family=request.getParameter("family");
            String qualify=request.getParameter("qualify");
            String value=request.getParameter("value");
            
            out.println(tablename+" "+rowkey+" "+family+" "+qualify+" "+value);
            
            Configuration conf =null;
            conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
        
            conf.set("hbase.zookeeper.quorum", "Master");
            HTable table = new HTable(conf, tablename);
                   byte[] row = Bytes.toBytes(rowkey);
                   byte[] fam = Bytes.toBytes(family);
	           byte[] col = Bytes.toBytes(qualify);
                   byte[] val = Bytes.toBytes(value);
            
            
                   Put p = new Put(row);
                   p.add(fam,col,val);
                   table.put(p);
                   out.println("insert recored " + rowkey + " to table " + tablename +" ok.");
             table.close();

        %>
        <h1>Hello World!</h1>
    </body>
</html>

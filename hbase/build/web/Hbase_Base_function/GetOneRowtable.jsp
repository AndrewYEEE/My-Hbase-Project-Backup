<%-- 
    Document   : GetOneRowtable
    Created on : Mar 28, 2016, 6:44:23 PM
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Get Successful!</h1>
        <%
            String tablename=request.getParameter("tablename");
            String rowkey=request.getParameter("rowkey");
            
            out.println("Tablename :"+tablename+"\n");
            %><hr/>
            
            <%Configuration conf =null;
            conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
            conf.set("hbase.zookeeper.quorum", "Master");
            
            HTable table = new HTable(conf, tablename);
            Get get = new Get(rowkey.getBytes());
            Result rs = table.get(get);
            for(KeyValue kv : rs.raw()){
                out.print(new String(kv.getRow()) + " " );
                out.print(new String(kv.getFamily()) + ":" );
                out.print(new String(kv.getQualifier()) + " " );
                out.print(kv.getTimestamp() + " " );
                out.println(new String(kv.getValue()));
                out.println("<br/>");
            }
            out.println("<hr/>");
            table.close();
        %>
    </body>
</html>

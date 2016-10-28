<%-- 
    Document   : CarPointAllTableReturn
    Created on : May 22, 2016, 7:59:48 PM
    Author     : hadoop
--%>

<%@page import="java.util.ArrayList"%>
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
            ArrayList<String> tablearr=new ArrayList<String>();
            tablearr.add("MapPoint_Taipei");
            tablearr.add("MapPoint_Douliu");
            tablearr.add("MapPoint_Dounan");
            ArrayList<String> rowkeyarr=new ArrayList<String>();
            rowkeyarr.add("1");
            
            Configuration conf =null;
            conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
            conf.set("hbase.zookeeper.quorum", "Master");
            for(int j=0;j<rowkeyarr.size();j++){
                for(int i=0;i<tablearr.size();i++){
                    //out.println(tablearr.get(i)+"<br/>");
                    HTable table = new HTable(conf, tablearr.get(i));
                    Get get = new Get(rowkeyarr.get(j).getBytes());
                    Result rs = table.get(get);
                    for(KeyValue kv : rs.raw()){
                        //out.print(new String(kv.getRow()) + " " );
                        //out.print(new String(kv.getFamily()) + ":" );
                        //out.print(new String(kv.getQualifier()) + " " );
                        //out.print(kv.getTimestamp() + " " );
                        out.println(new String(kv.getValue()));
                        out.println("<br/>");
                    }
                    //out.println("<hr/>");
                    //out.println("<br/>");
                    table.close();
                }
            }
            
            
            
        %>
    </body>
</html>

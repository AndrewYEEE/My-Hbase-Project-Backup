<%-- 
    Document   : TestTableGetPost1
    Created on : May 9, 2016, 6:25:58 PM
    Author     : hadoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");
            String Tablename="TestTable1";
            //String RowKey=request.getParameter("time");
            String RowKey="Timetest1";
            String City=request.getParameter("city");
            String Para=request.getParameter("para");
            //out.println("Table:"+Tablename+" "+"Rowtime: "+RowKey+"Qualifier: "+City+"Value: "+Para+"<br>");
            if(Tablename!=null){
                Configuration conf =null;
                conf = HBaseConfiguration.create();
            //如果沒有配置文件，一定要記得手動宣告
                conf.set("hbase.zookeeper.quorum", "Master");

                HTable table = new HTable(conf, Tablename);
                Get get = new Get(RowKey.getBytes());
                Result rs = table.get(get);
                
                String myJson;
                String tampStr;
                JSONObject obj = new JSONObject();
                JSONObject obj2 = new JSONObject();
            /*for(KeyValue kv : rs.raw()){
                tampStr=new String(kv.getFamily());
                /*if(tampStr.toString()==City.toString()){
                    out.println("hello");
                }*/
                
                        /*
                JSONObject obj2 = new JSONObject();
                for(KeyValue kv2 : rs.raw()){
                   if(new String(kv.getFamily())==new String(kv2.getFamily())){
                    obj2.put(new String(kv2.getQualifier()), new String(kv2.getValue()));
                   }
                   out.println("1"+new String(kv.getFamily())+"1");
                   out.println("1"+new String(kv2.getFamily())+"1");
                }
                obj.put(new String(kv.getFamily()),obj2);
            }*/

            for(KeyValue kv : rs.raw()){
                out.print(new String(kv.getFamily()) + ":" );
                out.print(new String(kv.getQualifier()) + ":" );
                out.println(new String(kv.getValue())+":");
                out.println("<br/>");
            }
            out.println("<hr/>");
            table.close();
            
                        
            
            
            table.close();
 
            }else{
                out.println("Tablename or rowkey can not null!");
            }
            
            
        %>
    </body>
</html>

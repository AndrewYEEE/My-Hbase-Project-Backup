<%-- 
    Document   : KZ_createtable
    Created on : May 22, 2016, 6:16:21 PM
    Author     : hadoop
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.hadoop.hbase.HColumnDescriptor"%>
<%@page import="org.apache.hadoop.hbase.TableName"%>
<%@page import="org.apache.hadoop.hbase.HTableDescriptor"%>
<%@page import="org.apache.hadoop.hbase.client.HBaseAdmin"%>
<%@page import="org.apache.hadoop.hbase.HBaseConfiguration"%>
<%@page import="org.apache.hadoop.conf.Configuration"%>
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
        String tablename = request.getParameter("tablename");
        String family1 = request.getParameter("family1");
        String family2 = request.getParameter("family2");
        String family3 = request.getParameter("family3");
        String family4 = request.getParameter("family4");
        String family5 = request.getParameter("family5");
        ArrayList<String> familyarr=new ArrayList<String>();
        
        if(family1.length()!=0){
            familyarr.add(family1);
        }
        if(family2.length()!=0){
            familyarr.add(family2);
        }
        if(family3.length()!=0){
            familyarr.add(family3);
        }
        if(family4.length()!=0){
            familyarr.add(family4);
        }
        if(family5.length()!=0){
            familyarr.add(family5);
        }
            
            
        
        Configuration conf = null;
        conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
        conf.set("hbase.zookeeper.quorum", "Master");
        HBaseAdmin admin = new HBaseAdmin(conf);
            if (admin.tableExists(tablename)) {
                out.println("table already exists!");
            } else {
                HTableDescriptor tableDesc = new HTableDescriptor(TableName.valueOf(tablename));
                for(int i=0;i<familyarr.size();i++){
                    tableDesc.addFamily(new HColumnDescriptor(familyarr.get(i)));
                } 
                admin.createTable(tableDesc);
                admin.close();
                out.println("create table " + tablename + " ok.");
            }
        
        %>
    </body>
</html>

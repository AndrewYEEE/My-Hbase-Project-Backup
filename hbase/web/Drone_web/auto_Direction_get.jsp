<%-- 
    Document   : auto_Direction_get
    Created on : Aug 13, 2016, 12:18:41 PM
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
            
            Configuration conf =null;
            conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
            conf.set("hbase.zookeeper.quorum", "Master");
            String rowkey="now";
            HTable table = new HTable(conf, "Drone_function");
            Get get = new Get(rowkey.getBytes());
            Result rs = table.get(get);
            String Lat="";
            String Lng="";
            String Value="";
            for(KeyValue kv : rs.raw()){
                /*
                out.print(new String(kv.getRow()) + " " );
                out.print(new String(kv.getFamily()) + ":" );
                out.print(new String(kv.getQualifier()) + " " );
                out.print(kv.getTimestamp() + " " );
                out.println(new String(kv.getValue()));
                out.println("<br/>");
                */
                String temp=new String(kv.getFamily());
                if(temp.equals("Drone_temp2")){
                    if(new String(kv.getQualifier()).equals("Lat")){
                        Lat=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("Lng")){
                        Lng=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("PointNum")){
                        Value=new String(kv.getValue());
                    }
                }

            }
            //out.println("<hr/>");
            table.close();
            //================================================
            List<String> latlist=new ArrayList();
            for(int i=0,tempnum=0;i<Lat.length();i++){
                    tempnum=Lat.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    latlist.add(String.valueOf(Lat.subSequence(i,tempnum)));
                    i=tempnum;
                    tempnum++;
            }
            List<String> lnglist=new ArrayList();
            for(int i=0,tempnum=0;i<Lng.length();i++){
                    tempnum=Lng.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    lnglist.add(String.valueOf(Lng.subSequence(i,tempnum)));
                    i=tempnum;
                    tempnum++;
            }
            //================================================
            JSONObject tempobj2 = new JSONObject();
            tempobj2.put("value",Value);   
            JSONArray list = new JSONArray();
            list.put(tempobj2); //tempobj2(value) must put first position in json
            
            int index=Integer.valueOf(Value);
            for(int i=1;i<=index;i++){
                JSONArray finalobj = new JSONArray();
                JSONObject tempobj = new JSONObject();
                tempobj.put("Lat",latlist.get(i-1));
                tempobj.put("Lng",lnglist.get(i-1));
                
                finalobj.put(tempobj);
                list.put(finalobj);
            }
            out.println(list);
            response.setHeader("Access-Control-Allow-Origin", "*");
        %>


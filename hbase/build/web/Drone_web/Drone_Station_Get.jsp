<%-- 
    Document   : Drone_Station_Get
    Created on : Sep 18, 2016, 8:57:18 PM
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
            //JSONObject obj = new JSONObject(); 
            Configuration conf =null;
            conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
            conf.set("hbase.zookeeper.quorum", "Master");
            HTable table = new HTable(conf, "Drone_station");
            //=================drone1======================
            String rowkey="drone1";
            Get get = new Get(rowkey.getBytes());
            Result rs = table.get(get);
            JSONArray list = new JSONArray();
            JSONObject obj1 = new JSONObject(); 
            String Lat="";
            String Lng="";
            String Value="";
            String User="";
            
            for(KeyValue kv : rs.raw()){
                String temp=new String(kv.getFamily());
                if(temp.equals("Drone_station")){
                    if(new String(kv.getQualifier()).equals("Lat")){
                        Lat=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("Lng")){
                        Lng=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("Enable")){
                        Value=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("User")){
                        User=new String(kv.getValue());
                    }
                }

            }
            obj1.put("Station", "drone1");
            obj1.put("Lat", Lat);
            obj1.put("Lng", Lng);
            obj1.put("Enable",Value);
            obj1.put("User",User);
            list.put(obj1);
            
            //==================drone2==================
            
            Lat="";
            Lng="";
            Value="";
            User="";
            rowkey="drone2";
            get = new Get(rowkey.getBytes());
            rs = table.get(get);
            obj1 = new JSONObject(); 
            for(KeyValue kv : rs.raw()){
                String temp=new String(kv.getFamily());
                if(temp.equals("Drone_station")){
                    if(new String(kv.getQualifier()).equals("Lat")){
                        Lat=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("Lng")){
                        Lng=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("Enable")){
                        Value=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("User")){
                        User=new String(kv.getValue());
                    }
                }

            }
            obj1.put("Station","drone2");
            obj1.put("Lat", Lat);
            obj1.put("Lng", Lng);
            obj1.put("Enable",Value);
            obj1.put("User",User);
            list.put(obj1);
            //==================drone3==================
            
            Lat="";
            Lng="";
            Value="";
            User="";
            rowkey="drone3";
            get = new Get(rowkey.getBytes());
            rs = table.get(get);
            obj1 = new JSONObject(); 
            for(KeyValue kv : rs.raw()){
                String temp=new String(kv.getFamily());
                if(temp.equals("Drone_station")){
                    if(new String(kv.getQualifier()).equals("Lat")){
                        Lat=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("Lng")){
                        Lng=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("Enable")){
                        Value=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("User")){
                        User=new String(kv.getValue());
                    }
                }

            }
            obj1.put("Station","drone3");
            obj1.put("Lat", Lat);
            obj1.put("Lng", Lng);
            obj1.put("Enable",Value);
            obj1.put("User",User);
            list.put(obj1);
            //==================drone4==================
            
            Lat="";
            Lng="";
            Value="";
            User="";
            rowkey="drone4";
            get = new Get(rowkey.getBytes());
            rs = table.get(get);
            obj1 = new JSONObject(); 
            for(KeyValue kv : rs.raw()){
                String temp=new String(kv.getFamily());
                if(temp.equals("Drone_station")){
                    if(new String(kv.getQualifier()).equals("Lat")){
                        Lat=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("Lng")){
                        Lng=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("Enable")){
                        Value=new String(kv.getValue());
                    }
                    if(new String(kv.getQualifier()).equals("User")){
                        User=new String(kv.getValue());
                    }
                }

            }
            obj1.put("Station","drone4");
            obj1.put("Lat", Lat);
            obj1.put("Lng", Lng);
            obj1.put("Enable",Value);
            obj1.put("User",User);
            list.put(obj1);
            
            
            table.close();
            out.println(list);
            


%>
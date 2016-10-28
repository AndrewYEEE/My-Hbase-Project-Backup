package org.apache.jsp.Drone_005fweb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;
import org.apache.hadoop.hbase.client.HTable;

public final class Drone_005fStation_005fGet_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

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
            



    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

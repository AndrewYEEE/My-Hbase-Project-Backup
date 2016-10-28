package org.apache.jsp.Drone_005fweb;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
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

public final class auto_005fDirection_005fupdate_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            request.setCharacterEncoding("UTF-8");
            response.setHeader("Access-Control-Allow-Origin", "*");
            String lat= request.getParameter("lat");
            String lng= request.getParameter("lng");
            /*
            JSONObject obj = new JSONObject(te);
            out.println(obj.getString("Command"));
            */
            out.println("Lat: "+lat);
            out.println("Lng: "+lng);
            out.println("<br>");
            if(lat!=null && lng!=null){
                /*
                String family="Drone_temp2";
                String Rowkey="";
                String qualify1="Lat";
                String qualify2="Lng";
                String qualify3="Point";
                int pointsumtemp=0;
                
                Configuration conf =null;
                conf = HBaseConfiguration.create();
                //如果沒有配置文件，一定要記得手動宣告

                conf.set("hbase.zookeeper.quorum", "Master");
                HTable table = new HTable(conf, "Drone_function");
                byte[] fam = Bytes.toBytes(family);
               
                
                
                for(int i=0,tempnum=0;i<lat.length();i++){
                    tempnum=lat.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    out.println(String.valueOf(lat.subSequence(i,tempnum)));
                    pointsumtemp++;
                    byte[] Lat_col = Bytes.toBytes(qualify1);                       
                    byte[] v_Lat = Bytes.toBytes(String.valueOf(lat.subSequence(i,tempnum)));
                    Rowkey=pointsumtemp+"";
                    byte[] row = Bytes.toBytes(Rowkey);
                    Put p = new Put(row);
                    p.add(fam,Lat_col,v_Lat);
                    table.put(p);
                    
                    i=tempnum;
                    tempnum++;
                }
                pointsumtemp=0;
                for(int i=0,tempnum=0;i<lng.length();i++){
                    tempnum=lng.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    out.println(String.valueOf(lng.subSequence(i,tempnum)));
                    pointsumtemp++;
                    byte[] Lnt_col = Bytes.toBytes(qualify2);                       
                    byte[] v_Lnt = Bytes.toBytes(String.valueOf(lng.subSequence(i,tempnum)));
                    Rowkey=pointsumtemp+"";
                    byte[] row = Bytes.toBytes(Rowkey);
                    Put p = new Put(row);
                    p.add(fam,Lnt_col,v_Lnt);
                    table.put(p);
                    
                    i=tempnum;
                    tempnum++;
                }
                table.close();
            }
            */
                String family="Drone_temp2";
                String Rowkey="now";
                String qualify1="Lat";
                String qualify2="Lng";
                String qualify3="PointNum";
                int pointsumtempLat=0,pointsumtempLng=0;
                
                for(int i=0,tempnum=0;i<lat.length();i++){
                    tempnum=lat.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    out.println(String.valueOf(lat.subSequence(i,tempnum)));
                    pointsumtempLat++;                   
                    i=tempnum;
                    tempnum++;
                }
                for(int i=0,tempnum=0;i<lng.length();i++){
                    tempnum=lng.indexOf(",",tempnum);
                    if(tempnum==-1){
                        break;
                    }
                    out.println(String.valueOf(lng.subSequence(i,tempnum)));
                    pointsumtempLng++;
                    i=tempnum;
                    tempnum++;
                }
                Configuration conf =null;
                conf = HBaseConfiguration.create();
            //如果沒有配置文件，一定要記得手動宣告

                conf.set("hbase.zookeeper.quorum", "Master");
                HTable table = new HTable(conf, "Drone_function");
                       byte[] row = Bytes.toBytes(Rowkey);
                       byte[] fam = Bytes.toBytes(family);
                       byte[] Lat_col = Bytes.toBytes(qualify1);                  
                       byte[] v_Lat = Bytes.toBytes(lat);
                       byte[] Lng_col = Bytes.toBytes(qualify2);                  
                       byte[] v_Lng = Bytes.toBytes(lng);
                       byte[] Value_col = Bytes.toBytes(qualify3);                  
                       byte[] v_Value= Bytes.toBytes(pointsumtempLat+"");
                       Put p = new Put(row);
                       p.add(fam,Lat_col,v_Lat);
                       table.put(p);
                       p.add(fam,Lng_col,v_Lng);
                       table.put(p);
                       p.add(fam,Value_col,v_Value);
                       table.put(p);
                table.close();
                
            }
            
            
        
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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

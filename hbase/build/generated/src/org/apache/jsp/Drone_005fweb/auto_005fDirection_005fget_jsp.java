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

public final class auto_005fDirection_005fget_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("        ");

            
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
        
      out.write('\n');
      out.write('\n');
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

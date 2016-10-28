<%-- 
    Document   : json_test
    Created on : Mar 28, 2016, 8:01:49 PM
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
<%@page import="org.json.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js">
        </script>
    </head>
    <body>
        <script type="text/javascript">
            $(document).ready(function(){
                $.ajax({
                    type: "POST",
                    url: "http://opendata2.epa.gov.tw/AOX.json",
                    //data: {type: "i", txtUserId: $("#txtUserId").val(), txtUserName: $("#txtUserName").val()}, 
                    //dataType: "text",
                    //dataType: "html",
                    dataType: "jsonp",
                    success: function(response){
                        out.println("<hr/>");
                        var data = $.parseJSON(response);
                        alert(response);
                        for(var test in data){
                            out.println(" CO : "+test["CO"]);
                            out.println("<br/>");
                        }
                    },
                    error: function(response)
                    { 
                        alert("error"); 
                    }

                });
            });
        </script>
        <h1>Hello World!</h1>
        <form  >
            <input type="button" value="submit" onClick="submit()"/>
        </form>
        <hr/>
    </body>
</html>

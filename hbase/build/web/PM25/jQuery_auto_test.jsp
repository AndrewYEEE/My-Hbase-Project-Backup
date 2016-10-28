<%-- 
    Document   : jQuery_auto_test
    Created on : Apr 8, 2016, 11:12:32 PM
    Author     : hadoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="text-utils.js"> </script>
        <script type="text/javascript" src="jquery-1.12.3.js"> </script>
         <script  type="text/javascript">
		var num=0;
		var subtest=function(){
			$.ajax({
				type: "POST",
				url: "http://opendata.epa.gov.tw/webapi/api/rest/datastore/355000000I-000001/?format=json",
				dataType: "jsonp",
				success: function(response) {
					var data =response;
					var teststring="";
					for(i=0;i<=data.result.records.length;i=i+1){
						for(var key in data.result.records[i]){
                                                        //if(key=="SiteName"){
                                                            teststring+=key+" : "+data.result.records[i][key]+"</br>";
                                                        //}
						}
						teststring+="\n";
					}
					teststring+="</br>"+num+"</br>";
					//var sss="PM2.5";
					
                                        $("#data").append(teststring);
					//alert(data.result.records[1].County+data.result.records[1].PM2.5+data.result.records[1].PublishTime);
					//var Country=data.result.records[1].County;
					//var PM25=data.result.records[1].this.sss; //2.5的"."會有問題啦
					//var Time=data.result.records[1].PublishTime;
					//var newTotal=Country+" "+Time;
					
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert(errorThrown);
					console.log(errorThrown);
				},
			});
			console.log(num);
			num=num+1;
			//setTimeout("subtest()",10000);
		}
		
		var count=function(){
			if(num<20){
				console.log(num);
				num=num+1;
				setTimeout("subtest()",1000);// setTimeout中第一個參數一定要加 " " ,不然後面的秒數設定會失效
			}
		}
        </script>
    </head>
    <body>
       
        <form >
            <input type="button" value="submit" onClick="subtest()"/>
        </form>
        <div id="data">
            
        </div>
        <%
            String getstr=request.getParameter("");
            

        %>
        
    </body>
</html>

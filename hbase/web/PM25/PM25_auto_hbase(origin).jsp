<%-- 
    Document   : test_javascript_form_put_data
    Created on : Apr 11, 2016, 1:34:24 PM
    Author     : hadoop
--%>
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
        <script type="text/javascript" src="text-utils.js"> </script>
        <script type="text/javascript" src="jquery-1.12.3.js"> </script>
        <!--<meta http-equiv="refresh" content="7"/>-->
        <script >
            var insertclick=function(){
                  var1 ="helloWorld!";
                  //document.forms["insertForm"].mc.value = var1 + document.forms["insertForm"].mc.value ;
                  //document.insertForm.submit();
                  var newtest = document.getElementById("test");
                  document.forms["insertForm"].mc.value = var1 + document.forms["insertForm"].mc.value
                  replaceText(newtest, var1);
                  document.insertForm.submit();
            }
            //===================auto_get_PM2.5=================
                var num=0;
                var subtest=function(){
			$.ajax({
				type: "POST",
				url: "http://opendata.epa.gov.tw/webapi/api/rest/datastore/355000000I-000001/?format=json",
				dataType: "jsonp",
				success: function(response) {
					var data =response; 
					var teststring=""; //sitename
                                        var County="";
                                        var PSI="";
                                        var SO2="";
                                        var MajorPollutant="";
                                        var Status="";
                                        var CO="";
                                        var O3="";
                                        var PM10="";
                                        var PM25="";
                                        var NO2="";
                                        var WindSpeed="";
                                        var WindDirec="";
                                        var FPMI="";
                                        var NOx="";
                                        var NO="";
                                        var PublishTime="";
					for(i=0;i<=data.result.records.length;i=i+1){
						for(var key in data.result.records[i]){
                                                        if(key=="SiteName"){
                                                            teststring+=key+" : "+data.result.records[i][key]+" ";
                                                            teststring+="\n";
                                                        }else if(key=="County"){
                                                            County+=key+" : "+data.result.records[i][key]+" ";
                                                            County+="\n";
                                                        }else if(key=="PSI"){
                                                            PSI+=key+" : "+data.result.records[i][key]+" ";
                                                            PSI+="\n";
                                                        }else if(key=="MajorPollutant"){
                                                            MajorPollutant+=key+" : "+data.result.records[i][key]+" ";
                                                            MajorPollutant+="\n";
                                                        }else if(key=="Status"){
                                                            Status+=key+" : "+data.result.records[i][key]+" ";
                                                            Status+="\n";
                                                        }else if(key=="SO2"){
                                                            SO2+=key+" : "+data.result.records[i][key]+" ";
                                                            SO2+="\n";
                                                        }else if(key=="CO"){
                                                            CO+=key+" : "+data.result.records[i][key]+" ";
                                                            CO+="\n";
                                                        }else if(key=="O3"){
                                                            O3+=key+" : "+data.result.records[i][key]+" ";
                                                            O3+="\n";
                                                        }else if(key=="PM10"){
                                                            PM10+=key+" : "+data.result.records[i][key]+" ";
                                                            PM10+="\n";
                                                        }else if(key=="PM2.5"){
                                                            PM25+=key+" : "+data.result.records[i][key]+" ";
                                                            PM25+="\n";
                                                        }else if(key=="NO2"){
                                                            NO2+=key+" : "+data.result.records[i][key]+" ";
                                                            NO2+="\n";
                                                        }else if(key=="WindSpeed"){
                                                            WindSpeed+=key+" : "+data.result.records[i][key]+" ";
                                                            WindSpeed+="\n";
                                                        }else if(key=="WindDirec"){
                                                            WindDirec+=key+" : "+data.result.records[i][key]+" ";
                                                            WindDirec+="\n";
                                                        }else if(key=="FPMI"){
                                                            FPMI+=key+" : "+data.result.records[i][key]+" ";
                                                            FPMI+="\n";
                                                        }else if(key=="NOx"){
                                                            NOx+=key+" : "+data.result.records[i][key]+" ";
                                                            NOx+="\n";
                                                        }else if(key=="NO"){
                                                            NO+=key+" : "+data.result.records[i][key]+" ";
                                                            NO+="\n";
                                                        }else if(key=="PublishTime"){
                                                            PublishTime+=key+" : "+data.result.records[i][key]+" ";
                                                            PublishTime+="\n";
                                                        }
						}                                             
					}
					teststring+="</br>"+num+"</br>";
					//var sss="PM2.5";
					console.log(data.result);
					//alert(data.result.records[1].County+data.result.records[1].PM2.5+data.result.records[1].PublishTime);
					//var Country=data.result.records[1].County;
					//var PM25=data.result.records[1].this.sss; //2.5的"."會有問題啦
					//var Time=data.result.records[1].PublishTime;
					//var newTotal=Country+" "+Time;
					//var newtest = document.getElementById("test");
					//replaceText(newtest, teststring);
                                        $("#site").val(teststring);
                                        $("#County").val(County);
                                        $("#PSI").val(PSI);
                                        $("#SO2").val(SO2);
                                        $("#MajorPollutant").val(MajorPollutant);
                                        $("#Status").val(Status);
                                        $("#CO").val(CO);
                                        $("#O3").val(O3);
                                        $("#PM10").val(PM10);
                                        $("#PM25").val(PM25);
                                        $("#NO2").val(NO2);
                                        $("#WindSpeed").val(WindSpeed);
                                        $("#WindDirec").val(WindDirec);
                                        $("#FPMI").val(FPMI);
                                        $("#NOx").val(NOx);
                                        $("#NO").val(NO);
                                        $("#PublishTime").val(PublishTime);
                                        //document.forms["insertForm"].mc.value =teststring ;
                                        
                                        document.insertForm.action="PM25_auto_hbase(origin).jsp";
                                        document.insertForm.submit();
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
    <body onload='setTimeout("subtest()",15000)'>
    <!--<body>-->
        <form name="insertForm" method="post" >
            <input name="site" value="" id="site"></input>
            <input name="County" value="" id="County"></input>
            <input name="PSI" value="" id="PSI"></input>
            <input name="MajorPollutant" value="" id="MajorPollutant"></input>
            <input name="Status" value="" id="Status"></input>
            <input name="SO2" value="" id="SO2"></input>
            <input name="CO" value="" id="CO"></input>
            <input name="O3" value="" id="O3"></input>
            <input name="PM10" value="" id="PM10"></input>
            <input name="PM25" value="" id="PM25"></input>
            <input name="NO2" value="" id="NO2"></input>
            <input name="WindSpeed" value="" id="WindSpeed"></input>
            <input name="WindDirec" value="" id="WindDirec"></input>
            <input name="FPMI" value="" id="FPMI"></input>
            <input name="NOx" value="" id="NOx"></input>
            <input name="NO" value="" id="NO"></input>
            <input name="PublishTime" value="" id="PublishTime"></input>
            <input type="button" value="提交" onclick="subtest()"></input>
        </form>
        <div id="data">
        </div>
        <%
            request.setCharacterEncoding("UTF-8");
            String site=request.getParameter("site");
            String County=request.getParameter("County");
            String PSI=request.getParameter("PSI");
            String MajorPollutant=request.getParameter("MajorPollutant");
            String Status=request.getParameter("Status");
            String SO2=request.getParameter("SO2");
            String CO=request.getParameter("CO");
            String O3=request.getParameter("O3");
            String PM10=request.getParameter("PM10");
            String PM25=request.getParameter("PM25");
            String NO2=request.getParameter("NO2");
            String WindSpeed=request.getParameter("WindSpeed");
            String WindDirec=request.getParameter("WindDirec");
            String FPMI=request.getParameter("FPMI");
            String NOx=request.getParameter("NOx");
            String PublishTime=request.getParameter("PublishTime");
            
            if(site==null){
                out.println("error");
            }else{
               int temp;
               //out.println(strget.length());
               //String str="helloworld";
               //out.println(site);
               //out.println(County);
               //out.println(PSI);
               //out.println(MajorPollutant);
               out.println(Status);
               out.println(SO2);
               out.println(CO);
               out.println(O3);
               out.println(PM10);
               out.println(PM25);
               out.println(NO2);
               out.println(WindSpeed);
               out.println(WindDirec);
               out.println(FPMI);
               out.println(NOx);
               out.println(PublishTime); 
               
               
               //num=strget.indexOf("麥寮",12);
               //out.println(num);
               //============HbaseConfig+Open===============
               
               Configuration conf =null;
               conf = HBaseConfiguration.create();
               //如果沒有配置文件，一定要記得手動宣告
               conf.set("hbase.zookeeper.quorum", "Master");
               HTable table = new HTable(conf, "PM2.5_real"); //TableName
               
               //===================================
               int total=0;
               String siteS;
               int Countynum=0,PSInum=0,MajorPollutantnum=0,Statusnum=0,SO2num=0,PublishTimenum=0,COnum=0,O3num=0,PM10num=0,PM25num=0;
               int NO2num=0,WindSpeednum=0,WindDirecnum=0,FPMInum=0,NOxnum=0;
               String CountyS="";
               String PSIS="";
               String MajorPollutantS="";
               String StatusS="";
               String SO2S="";
               String COS="";
               String O3S="";
               String PM10S="";
               String PM25S="";
               String NO2S="";
               String WindSpeedS="";
               String WindDirecS="";
               String FPMIS="";
               String NOxS="";
               String PublishTimeS="";
               for(int i=0,sitenum=0;sitenum>=0;i++){
                   sitenum=site.indexOf("SiteName",sitenum);
                   if(sitenum==-1){                 //check sitename is exist
                       break;
                   }else{
                       //==================get_family_and_row======================
                       siteS=String.valueOf(site.subSequence(sitenum+11,sitenum+13));
                       out.println(siteS);
                       sitenum++;
                       total++;
                       //=====PublishTime=====
                       PublishTimenum=PublishTime.indexOf("PublishTime",PublishTimenum);
                       if(PublishTimenum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           PublishTimeS=String.valueOf(PublishTime.subSequence(PublishTimenum+14,PublishTimenum+31));
                           out.println(PublishTimeS);
                       }
                       PublishTimenum++;
                       
                       
                       
                       //===================col_cells===================
                       //=====county=======
                       Countynum=County.indexOf("County",Countynum);
                       if(Countynum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           CountyS=String.valueOf(County.subSequence(Countynum+9,Countynum+12));
                           out.println(CountyS);
                       }
                       Countynum++;
                       
                            byte[] row = Bytes.toBytes(PublishTimeS);
                            byte[] fam = Bytes.toBytes(siteS);
                            byte[] col = Bytes.toBytes("County");
                            byte[] val = Bytes.toBytes(CountyS);
            
            
                            Put p = new Put(row);
                            p.add(fam,col,val);
                            table.put(p);
                        
                       //=====PSI==========
                       PSInum=PSI.indexOf("PSI",PSInum);
                       if(PSInum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           PSIS=String.valueOf(PSI.subSequence(PSInum+6,PSInum+9));
                           out.println(PSIS);
                       }
                       PSInum++;
                       
                       
                            col = Bytes.toBytes("PSI");
                            val = Bytes.toBytes(PSIS);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       
                       //=====MajorPollutant=======
                       MajorPollutantnum=MajorPollutant.indexOf("MajorPollutant",MajorPollutantnum);
                       if(MajorPollutantnum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           MajorPollutantS=String.valueOf(MajorPollutant.subSequence(MajorPollutantnum+17,MajorPollutantnum+22));
                           out.println(MajorPollutantS);
                       }
                       MajorPollutantnum++;
                       
                            col = Bytes.toBytes("MajorPollutant");
                            val = Bytes.toBytes(MajorPollutantS);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====Status=======
                       Statusnum=Status.indexOf("Status",Statusnum);
                       if(Statusnum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           StatusS=String.valueOf(Status.subSequence(Statusnum+9,Statusnum+11));
                           out.println(StatusS);
                       }
                       Statusnum++;
                            
                            col = Bytes.toBytes("Status");
                            val = Bytes.toBytes(StatusS);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====SO2==========
                       SO2num=SO2.indexOf("SO2",SO2num);
                       if(SO2num==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           SO2S=String.valueOf(SO2.subSequence(SO2num+6,SO2num+10));
                           out.println(SO2S);
                       }
                       SO2num++;
                            col = Bytes.toBytes("SO2");
                            val = Bytes.toBytes(SO2S);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====CO===========
                       COnum=CO.indexOf("CO",COnum);
                       if(COnum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           COS=String.valueOf(CO.subSequence(COnum+5,COnum+9));
                           out.println(COS);
                       }
                       COnum++;
                            col = Bytes.toBytes("CO");
                            val = Bytes.toBytes(COS);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====O3===========
                       O3num=O3.indexOf("O3",O3num);
                       if(O3num==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           O3=String.valueOf(O3.subSequence(O3num+6,O3num+9));
                           out.println(O3S);
                       }
                       O3num++;
                            col = Bytes.toBytes("O3");
                            val = Bytes.toBytes(O3S);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====PM10=========
                       PM10num=PM10.indexOf("PM10",PM10num);
                       if(PM10num==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           PM10S=String.valueOf(PM10.subSequence(PM10num+7,PM10num+10));
                           out.println(PM10S);
                       }
                       PM10num++;
                            col = Bytes.toBytes("PM10");
                            val = Bytes.toBytes(PM10S);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====PM25=========
                       PM25num=PM25.indexOf("PM2.5",PM25num);
                       if(PM25num==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           PM25S=String.valueOf(PM25.subSequence(PM25num+7,PM25num+10));
                           out.println(PM25S);
                       }
                       PM25num++;
                       
                            col = Bytes.toBytes("PM2.5");
                            val = Bytes.toBytes(PM25S);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====NO2=========
                       NO2num=NO2.indexOf("NO2",NO2num);
                       if(NO2num==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           NO2S=String.valueOf(NO2.subSequence(NO2num+6,NO2num+9));
                           out.println(NO2S);
                       }
                       NO2num++;
                       
                            col = Bytes.toBytes("NO2");
                            val = Bytes.toBytes(NO2S);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====WindSpeedS=========
                       WindSpeednum=WindSpeed.indexOf("WindSpeed",WindSpeednum);
                       if(WindSpeednum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           WindSpeedS=String.valueOf(WindSpeed.subSequence(WindSpeednum+12,WindSpeednum+16));
                           out.println(WindSpeedS);
                       }
                       WindSpeednum++;
                       
                            col = Bytes.toBytes("WindSpeed");
                            val = Bytes.toBytes(WindSpeedS);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====WindDirec=========
                       WindDirecnum=WindDirec.indexOf("WindDirec",WindDirecnum);
                       if(WindDirecnum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           WindDirecS=String.valueOf(WindDirec.subSequence(WindDirecnum+12,WindDirecnum+15));
                           out.println(WindDirecS);
                       }
                       WindDirecnum++;
                       
                            col = Bytes.toBytes("WindDirec");
                            val = Bytes.toBytes(WindDirecS);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====FPMI=========
                       FPMInum=FPMI.indexOf("FPMI",FPMInum);
                       if(FPMInum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           FPMIS=String.valueOf(FPMI.subSequence(FPMInum+7,FPMInum+9));
                           out.println(FPMIS);
                       }
                       FPMInum++;
                       
                            col = Bytes.toBytes("FPMI");
                            val = Bytes.toBytes(FPMIS);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       //=====NOxS=========
                       NOxnum=NOxS.indexOf("NOx",FPMInum);
                       if(NOxnum==-1){                 //check sitename is exist
                           out.println("NULL");
                       }else{
                           NOxS=String.valueOf(NOx.subSequence(NOxnum+6,NOxnum+12));
                           out.println(NOxS);
                       }
                       NOxnum++;
                       
                            col = Bytes.toBytes("NOx");
                            val = Bytes.toBytes(NOxS);
            
            
                            p.add(fam,col,val);
                            table.put(p);
                       
                   }
                  
                   
                   
               }
               table.close();
               out.println(total);
            }
            
        %>
    </body>
</html>

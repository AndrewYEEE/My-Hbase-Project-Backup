<%-- 
    Document   : index
    Created on : May 22, 2016, 6:12:43 PM
    Author     : hadoop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Create Table</h1>
        (Least one family.)
        <form action="KZ_createtable.jsp" method="POST">
            Table name:
            <input type="text" name="tablename" value="" />(Ex:PM2.5)<br/>
            Family1:
            <input type="text" name="family1" value="" />(Ex:Taipei)<br/>
            Family2:
            <input type="text" name="family2" value="" />(Ex:Tainan)<br/>
            Family3:
            <input type="text" name="family3" value="" /><br/>
            Family4:
            <input type="text" name="family4" value="" /><br/>
            Family5:
            <input type="text" name="family5" value="" /><br/>
            <input type="submit" value="submit" />      
        </form>
        <hr/>
        <h1>Insert Data</h1>
        <form action="KZ_addRecord.jsp" method="POST" >
            Table name:
            <input type="text" name="tablename" value="" />(Ex:PM2.5)<br/>
            RowKey:
            <input type="text" name="rowkey" value="" />(20160522)<br/>
            Family:
            <input type="text" name="family" value="" />(Taipei)<br/>
            Column:
            <input type="text" name="qualify" value="" />(Lat)<br/>
            Value:
            <input type="text" name="value" value="" />23.123456<br/>
            <input type="submit" value="submit" />
        </form>
    </body>
</html>

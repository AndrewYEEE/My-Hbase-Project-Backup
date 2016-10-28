<%-- 
    Document   : index
    Created on : Mar 23, 2016, 11:11:54 AM
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
        <form action="Hbase_Base_function/createtable.jsp" method="POST">
            Table name:
            <input type="text" name="tablename" value="" /><br/>
            Family1:
            <input type="text" name="family1" value="" /><br/>
            Family2:
            <input type="text" name="family2" value="" /><br/>
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
        <form action="Hbase_Base_function/addRecord.jsp" method="POST" >
            Table name:
            <input type="text" name="tablename" value="" /><br/>
            RowKey:
            <input type="text" name="rowkey" value="" /><br/>
            Family:
            <input type="text" name="family" value="" /><br/>
            Column:
            <input type="text" name="qualify" value="" /><br/>
            Value:
            <input type="text" name="value" value="" /><br/>
            <input type="submit" value="submit" />
        </form>
        <hr/>
        <h1>Search Row Data</h1>
        <form action="Hbase_Base_function/GetOneRowtable.jsp" method="POST" >
            Table name:
            <input type="text" name="tablename" value="" /><br/>
            RowKey:
            <input type="text" name="rowkey" value="" /><br/>
            <input type="submit" value="submit" />
        </form>
        <hr/>
        
        <h1>Delete Data</h1>
        <form action="Hbase_Base_function/DeleteTable.jsp" method="POST" >
            Table name:
            <input type="text" name="tablename" value="" /><br/>
            <input type="submit" value="submit" />
        </form>
        <hr/>
        
        
    </body>
</html>

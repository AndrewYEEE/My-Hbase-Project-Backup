package javaapplication1;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.MasterNotRunningException;
import org.apache.hadoop.hbase.ZooKeeperConnectionException;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.filter.Filter;
import org.apache.hadoop.hbase.filter.FilterList;
import org.apache.hadoop.hbase.filter.SingleColumnValueFilter;
import org.apache.hadoop.hbase.filter.CompareFilter.CompareOp;
import org.apache.hadoop.hbase.util.Bytes;

public class Hbase {
	public static Configuration configuration;
    static {
        configuration = HBaseConfiguration.create();
        //configuration.set("hbase.zookeeper.property.clientPort", "2181");
        //configuration.set("hbase.zookeeper.quorum", "192.168.1.100");
        //configuration.set("hbase.master", "192.168.1.100:600000");
    }
    public static void main(String[] args) {
        createTable("test5");
        //insertData("test1");  
        // QueryAll("wujintao");  
        // QueryByCondition1("wujintao");  
        // QueryByCondition2("wujintao");  
        //QueryByCondition3("wujintao");  
        //deleteRow("wujintao","abcdef");  
        //deleteByCondition("wujintao","abcdef"); 
    	//dropTable("test1");
    	
    }
    
    public static void createTable(String tableName) {  
        System.out.println("start create table ......");  
        try {  
            HBaseAdmin hBaseAdmin = new HBaseAdmin(configuration);  
            if (hBaseAdmin.tableExists(tableName)) {// ???????????????????  
                hBaseAdmin.disableTable(tableName);  
                hBaseAdmin.deleteTable(tableName);  
                System.out.println(tableName + " is exist,detele....");  
            }  
            HTableDescriptor tableDescriptor = new HTableDescriptor(tableName);  
            tableDescriptor.addFamily(new HColumnDescriptor("column1"));  
            tableDescriptor.addFamily(new HColumnDescriptor("column2"));  
            tableDescriptor.addFamily(new HColumnDescriptor("column3"));  
            hBaseAdmin.createTable(tableDescriptor);  
        } catch (MasterNotRunningException e) {  
            e.printStackTrace();  
        } catch (ZooKeeperConnectionException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        System.out.println("end create table ......");  
    }  
    
    public static void insertData(String tableName) {  
    	try { 
    		System.out.println("start insert data ......");  
    		HTable table = new HTable(configuration,tableName);  
    		Put put = new Put("testRow1".getBytes());  
    		put.add("column1".getBytes(), Bytes.toBytes("qual1"), "val1".getBytes());
    		put.add("column2".getBytes(), Bytes.toBytes("qual1"), "val2".getBytes());
    		put.add("column3".getBytes(), Bytes.toBytes("qual1"), "val3".getBytes());
            table.put(put);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        System.out.println("end insert data ......");  
    }  
    
    public static void dropTable(String tableName) {  
        try {  
            HBaseAdmin admin = new HBaseAdmin(configuration);  
            admin.disableTable(tableName);  
            admin.deleteTable(tableName);  
            admin.close();
        } catch (MasterNotRunningException e) {  
            e.printStackTrace();  
        } catch (ZooKeeperConnectionException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
  
    }
    
    public static void deleteRow(String tablename, String rowkey)  {  
        try {  
            HTable table = new HTable(configuration, tablename);  
            List list = new ArrayList();  
            Delete d1 = new Delete(rowkey.getBytes());  
            list.add(d1);  
              
            table.delete(list);  
            System.out.println("?????!");  
              
        } catch (IOException e) {  
            e.printStackTrace();  
        }
    }
}
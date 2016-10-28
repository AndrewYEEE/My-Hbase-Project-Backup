/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hbase;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.MasterNotRunningException;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.ZooKeeperConnectionException;
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HBaseAdmin;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.client.Result;
import org.apache.hadoop.hbase.client.ResultScanner;
import org.apache.hadoop.hbase.client.Scan;
import org.apache.hadoop.hbase.util.Bytes;

public class HBaseTest {
    private static Configuration conf = null;

    /**
     * 初始化配置
     */
    static {
        conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告

        conf.set("hbase.zookeeper.quorum", "Master");
    }

    /**
     * 建立表格
     * @param tablename
     * @param cfs
     */
    public static  void main(String arg[]){
        delRecord("test2","today");
    }
    
    public static void createTable(String tablename, String cfs){
        try {
            HBaseAdmin admin = new HBaseAdmin(conf);
            if (admin.tableExists(tablename)) {
                System.out.println("table already exists!");
            } else {
                HTableDescriptor tableDesc = new HTableDescriptor(TableName.valueOf(tablename));
                
                tableDesc.addFamily(new HColumnDescriptor(cfs));
                
                admin.createTable(tableDesc);
                admin.close();
                System.out.println("create table " + tablename + " ok.");
            }
        } catch (MasterNotRunningException e) {
            e.printStackTrace();
        } catch (ZooKeeperConnectionException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 刪除表格
     * @param tablename
     */
    public static void deleteTable(String tablename){   
        try {
            HBaseAdmin admin = new HBaseAdmin(conf);
            admin.disableTable(tablename);
            admin.deleteTable(tablename);
            System.out.println("delete table " + tablename + " ok.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 新增一筆資料
     * @param tableName
     * @param rowKey
     * @param family
     * @param qualifier
     * @param value
     */
    public static void addRecord (String tableName, String rowKey, String family, String qualifier, String value){
        try {
            HTable table = new HTable(conf, tableName);
            Put put = new Put(Bytes.toBytes(rowKey));
            put.add(Bytes.toBytes(family),Bytes.toBytes(qualifier),Bytes.toBytes(value));
            table.put(put);
            System.out.println("insert recored " + rowKey + " to table " + tableName +" ok.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 刪除一筆資料
     * @param tableName
     * @param rowKey
     */
    public static void delRecord (String tableName, String rowKey){
        try {
            HTable table = new HTable(conf, tableName);
            List list = new ArrayList();
            Delete del = new Delete(rowKey.getBytes());
            list.add(del);
            table.delete(list);
            System.out.println("del recored " + rowKey + " ok.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 取得一筆資料
     * @param tableName
     * @param rowKey
     */
    public static void getOneRecord (String tableName, String rowKey){         
        try {
            HTable table = new HTable(conf, tableName);
            Get get = new Get(rowKey.getBytes());
            Result rs = table.get(get);
            for(KeyValue kv : rs.raw()){
                System.out.print(new String(kv.getRow()) + " " );
                System.out.print(new String(kv.getFamily()) + ":" );
                System.out.print(new String(kv.getQualifier()) + " " );
                System.out.print(kv.getTimestamp() + " " );
                System.out.println(new String(kv.getValue()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 取得所有資料
     * @param tableName
     */
    public static void getAllRecord (String tableName) {         
        try{
            HTable table = new HTable(conf, tableName);
            Scan s = new Scan();
            ResultScanner ss = table.getScanner(s);         
            for(Result r:ss){
                for(KeyValue kv : r.raw()){
                    System.out.print(new String(kv.getRow()) + " ");
                    System.out.print(new String(kv.getFamily()) + ":");
                    System.out.print(new String(kv.getQualifier()) + " ");
                    System.out.print(kv.getTimestamp() + " ");
                    System.out.println(new String(kv.getValue()));
                }
            }
        } catch (IOException e){
            e.printStackTrace();
        }
    }


    /*public static void main(String[] args) {
        try {         
            String tablename = "scores";
            String[] familys = {"grade", "course"};         
            HBaseTest.createTable(tablename, familys);

            //add record zkb         

            HBaseTest.addRecord(tablename,"zkb","grade","","5");
            HBaseTest.addRecord(tablename,"zkb","course","","90");
            HBaseTest.addRecord(tablename,"zkb","course","math","97");
            HBaseTest.addRecord(tablename,"zkb","course","art","87");
            //add record  baoniu         

            HBaseTest.addRecord(tablename,"baoniu","grade","","4");
            HBaseTest.addRecord(tablename,"baoniu","course","math","89");

            System.out.println("===========get one record========");
            HBaseTest.getOneRecord(tablename, "zkb");

            System.out.println("===========show all record========");
            HBaseTest.getAllRecord(tablename);

            System.out.println("===========del one record========");
            HBaseTest.delRecord(tablename, "baoniu");
            HBaseTest.getAllRecord(tablename);

            System.out.println("===========show all record========");
            HBaseTest.getAllRecord(tablename);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
*/
}

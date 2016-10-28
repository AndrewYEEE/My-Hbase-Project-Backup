/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hbase;

import java.io.IOException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.HColumnDescriptor;
import org.apache.hadoop.hbase.HTableDescriptor;
import org.apache.hadoop.hbase.MasterNotRunningException;
import org.apache.hadoop.hbase.TableName;
import org.apache.hadoop.hbase.ZooKeeperConnectionException;
import org.apache.hadoop.hbase.client.HBaseAdmin;

/**
 *
 * @author hadoop
 */
public class createtable {
        private static Configuration conf = null;

    /**
     * 初始化配置
     */
    static {
        conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
        conf.set("hbase.zookeeper.quorum", "Master");
    }
 
    
    public void createTable(String tablename,String cfs1,String cfs2,String cfs3,String cfs4,String cfs5){
        try {
            HBaseAdmin admin = new HBaseAdmin(conf);
            if (admin.tableExists(tablename)) {
                System.out.println("table already exists!");
            } else {
                HTableDescriptor tableDesc = new HTableDescriptor(TableName.valueOf(tablename));
                
                    tableDesc.addFamily(new HColumnDescriptor(cfs1));
                    tableDesc.addFamily(new HColumnDescriptor(cfs2));
                    tableDesc.addFamily(new HColumnDescriptor(cfs3));
                    tableDesc.addFamily(new HColumnDescriptor(cfs4));
                    tableDesc.addFamily(new HColumnDescriptor(cfs5));
                    
                    
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
    
}

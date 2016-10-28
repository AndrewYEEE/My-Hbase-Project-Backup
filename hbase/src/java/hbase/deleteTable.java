/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hbase;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
public class deleteTable {
    private static Configuration conf = null;

    /**
     * 初始化配置
     */
    static {
        conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
        conf.set("hbase.zookeeper.quorum", "Master");
    }
    public  void deleteTable(String tablename){   
        try {
            HBaseAdmin admin = new HBaseAdmin(conf);
            admin.disableTable(tablename);
            admin.deleteTable(tablename);
            System.out.println("delete table " + tablename + " ok.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

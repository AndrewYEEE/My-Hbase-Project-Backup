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
import org.apache.hadoop.hbase.client.Delete;
import org.apache.hadoop.hbase.client.HTable;

/**
 *
 * @author hadoop
 */
public class DelRowkeyAllData {
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
}

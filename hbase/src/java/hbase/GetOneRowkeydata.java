/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hbase;

import java.io.IOException;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.hbase.HBaseConfiguration;
import org.apache.hadoop.hbase.KeyValue;
import org.apache.hadoop.hbase.client.Get;
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Result;

/**
 *
 * @author hadoop
 */
public class GetOneRowkeydata {
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
}

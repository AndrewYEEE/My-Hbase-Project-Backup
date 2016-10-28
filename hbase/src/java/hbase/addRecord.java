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
import org.apache.hadoop.hbase.client.HTable;
import org.apache.hadoop.hbase.client.Put;
import org.apache.hadoop.hbase.util.Bytes;

/**
 *
 * @author hadoop
 */
public class addRecord {
        private static Configuration conf = null;

    /**
     * 初始化配置
     */
    static {
        conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告

        conf.set("hbase.zookeeper.quorum", "Master");
    }
        
       /*public static  void main(String arg[])
        {
            //addRecord("PM-2.5","2016/03/23/00:00","Taipei","PM","20");
            //addRecord("PM-2.5","2016/03/23/00:00","Taipei","Longitude","25:03");
            //addRecord("PM-2.5","2016/03/23/06:00","Taipei","Latitue","121:34");
            //addRecord("PM-2.5","2016/03/23/06:00","Taipei","Altitude","19.5M");
            //addRecord("PM-2.5","2016/03/23/06:00","Taipei","Address","臺北市松山區八德路四段746號");
            //addRecord("PM-2.5","2016/03/23/06:00","Taipei","Stations","松山");
            //addRecord("PM-2.5","2016/03/23/00:00","Taipei","Field","20");
            
            //addRecord("PM-2.5","2016/03/23/06:00","Douliu","PM","63");
            //addRecord("PM-2.5","2016/03/23/06:00","Douliu","Longitude","23:42");
            //addRecord("PM-2.5","2016/03/23/05:00","Douliu","Latitue","120:32");
            //addRecord("PM-2.5","2016/03/23/06:00","Douliu","Altitude","14.5M");
            //addRecord("PM-2.5","2016/03/23/06:00","Douliu","Address","雲林縣斗六市民生路224號");
            //addRecord("PM-2.5","2016/03/23/00:00","Douliu","Field","20");
            
            //addRecord("PM-2.5","2016/03/23/00:00","Kaohsiung","PM","82");
            //addRecord("PM-2.5","2016/03/23/00:00","Kaohsiung","Longitude","22:37");
            //addRecord("PM-2.5","2016/03/23/00:00","Kaohsiung","Latitue","120:17");
            //addRecord("PM-2.5","2016/03/23/00:00","Kaohsiung","Altitude","16.5M");
            //addRecord("PM-2.5","2016/03/23/00:00","Kaohsiung","Address","高雄市前金區河南二路196號");
            //addRecord("PM-2.5","2016/03/23/00:00","Kaohsiung","Field","20");
            
            //addRecord("PM-2.5","2016/03/23/06:00","Taichung","PM","27");
            //addRecord("PM-2.5","2016/03/23/06:00","Taichung","Longitude","24:09");
            //addRecord("PM-2.5","2016/03/23/06:00","Taichung","Latitue","120:38");
            //addRecord("PM-2.5","2016/03/23/06:00","Taichung","Altitude","17.5M");
            //addRecord("PM-2.5","2016/03/23/06:00","Taichung","Address","臺中市南屯區公益路二段296號");
            //addRecord("PM-2.5","2016/03/23/06:00","Taichung","Stations","忠明");
            //addRecord("PM-2.5","2016/03/23/00:00","Taichung","Field","20");
            
            //addRecord("PM-2.5","2016/03/23/00:00","Hsinchu","PM","27");
            //addRecord("PM-2.5","2016/03/23/00:00","Hsinchu","Longitude","24:48");
            //addRecord("PM-2.5","2016/03/23/00:00","Hsinchu","Latitue","120:58");
            //addRecord("PM-2.5","2016/03/23/00:00","Hsinchu","Altitude","15.5M");
            //addRecord("PM-2.5","2016/03/23/00:00","Hsinchu","Address","新竹市民族路33號");
            //addRecord("PM-2.5","2016/03/23/01:00","Hsinchu","Stations","新竹");
            //addRecord("PM-2.5","2016/03/23/00:00","Hsinchu","Field","20");
        }*/
        
    
        public void addRecord (String tableName, String rowKey, String family, String qualifier, String value){
        try {
            
       
            HTable table = new HTable(conf, tableName);
            byte[] row = Bytes.toBytes(rowKey);
            byte[] fam = Bytes.toBytes(family);
	    byte[] col = Bytes.toBytes(qualifier);
            byte[] val = Bytes.toBytes(value);
            
            
            Put put = new Put(row);
            put.add(fam,col,val);
            table.put(put);
            System.out.println("insert recored " + rowKey + " to table " + tableName +" ok.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

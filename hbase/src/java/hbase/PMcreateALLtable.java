package hbase;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import static hbase.HBaseTest.delRecord;
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
public class PMcreateALLtable {
        private static Configuration conf = null;

    /**
     * 初始化配置
     */
    static {
        conf = HBaseConfiguration.create();
        //如果沒有配置文件，一定要記得手動宣告
        conf.set("hbase.zookeeper.quorum", "Master");
        
    }
    
    public static  void main(String arg[]){
        String[] site={"基隆","汐止","萬里","新店","土城","板橋","新莊","菜寮","林口","淡水","士林","中山",
"萬華","古亭","松山","大同","桃園","大園","觀音","平鎮","龍潭","湖口","竹東","新竹","頭份","苗栗",
"三義","豐原","沙鹿","大里","忠明","西屯","彰化","線西","二林","南投","斗六","崙背","新港","朴子",
"臺西","嘉義","新營","善化","安南","臺南","美濃","橋頭","仁武","鳳山","大寮","林園","楠梓","左營",
"前金","前鎮","小港","屏東","潮州","恆春","臺東","花蓮","陽明","宜蘭","冬山","三重","中壢","竹山",
"永和","復興","埔里","馬祖","金門","馬公","關山","麥寮"};
        createTable("PM2.5_test",site);
    }
    public static void createTable(String tablename,String[] site){
        try {
            HBaseAdmin admin = new HBaseAdmin(conf);
            if (admin.tableExists(tablename)) {
                System.out.println("table already exists!");
            } else {
                HTableDescriptor tableDesc = new HTableDescriptor(TableName.valueOf(tablename));
                
                for(int i=0;i<site.length;i++){
                    tableDesc.addFamily(new HColumnDescriptor(site[i]));
                }
            
                    
                    
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

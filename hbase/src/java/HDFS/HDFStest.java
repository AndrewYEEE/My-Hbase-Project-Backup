package HDFS;
import java.io.IOException;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.FileStatus;  
import org.apache.hadoop.conf.*;

import java.net.URI;

public class HDFStest{
	public static void main(String[] args) throws IOException {  
		//HDFS_create_File("/user/hadoop/data/20130709");
		//CopyFromLocalFile("/home/hadoop/hue_office_install_file","/user/hadoop/data/");
		HDFS_Download_file("/user/hadoop/data/hue_office_install_file","/home/hadoop/Downloads");
		//HDFS_Get_ChildFile("/user/hadoop/data/");
	}
	
	public static void HDFS_create_File(String str){
		try{
			Configuration conf = new Configuration();  
	        FileSystem fs = FileSystem.get(URI.create("hdfs://Master:9000/"),conf);  
	        Path path = new Path(str);
	        //fs=path.getFileSystem(conf);
	        fs.create(path);  
	        fs.close();
	        System.out.print("create file sucessful.....\n");
		}catch (IOException e)
                {
                                System.out.print("create file error.....\n");
                    e.printStackTrace();
                }
	}
	public static void CopyFromLocalFile(String str,String dstr){
		try{
			Configuration conf = new Configuration();  
	        FileSystem fs = FileSystem.get(URI.create("hdfs://Master:9000/"),conf);  
	        Path src = new Path(str);  
	        Path dst = new Path(dstr);  
	        fs.copyFromLocalFile(src, dst);  
	        fs.close();
	        System.out.print("Upload file successful.....\n");
		}catch (IOException e)
                {
                                System.out.print("Upload file error.....\n");
                    e.printStackTrace();
                }
	}
	public static void HDFS_Download_file(String src,String dst){
		try{
			Configuration conf = new Configuration();
			Path dstPath = new Path(src);
			FileSystem hdfs = FileSystem.get(URI.create("hdfs://Master:9000/"),conf);
			//hdfs=dstPath.getFileSystem(conf);
			hdfs.copyToLocalFile(false, new Path(src),new Path(dst));
		}catch(IOException e){
			System.out.print("Download file error.....\n");
                        e.printStackTrace();
                        return;
		}
		System.out.print("Download file successful.....\n");
	}
	public static void HDFS_Get_ChildFile(String str){	//need getFile()
		try{
			Configuration conf = new Configuration(); 
			FileSystem fs = FileSystem.get(URI.create("hdfs://Master:9000/"),conf);  
                        Path path = new Path(str);
                        getFile(path,fs);

		}catch(IOException e){
			System.out.print("Read Direction error.....\n");
                        e.printStackTrace();
                        return ;
		}
		System.out.print("Read Direction successful.....\n");
	}

	@SuppressWarnings("deprecation")
	private static void getFile(Path path, FileSystem fs) throws IOException{ //throws IOException must add
		// TODO Auto-generated method stub
		FileStatus[] fileStatus = fs.listStatus(path);  
                for(int i=0;i<fileStatus.length;i++){  
                    if(fileStatus[i].isDir()){  
                        Path p = new Path(fileStatus[i].getPath().toString());  
                        getFile(p,fs);  //is a recurcive
                    }else{  
                        System.out.println(fileStatus[i].getPath().toString());  
                    }  
                }  
	}
}
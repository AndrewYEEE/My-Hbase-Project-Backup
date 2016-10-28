/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SocketPractice;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.util.logging.Level;
import java.util.logging.Logger;
import static java.lang.System.out;
/**
 *
 * @author hadoop
 */
public class ChatSocket extends Thread {
    
    Socket socket;
    public ChatSocket(Socket s){
        this.socket=s;
    }
    
    public void out(String Sout){
        try {
            socket.getOutputStream().write(Sout.getBytes("UTF-8"));
            out.println("Output:"+Sout);
        } catch (IOException ex) {
            Logger.getLogger(ChatSocket.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void run(){
        try {
            BufferedReader br=new BufferedReader(new InputStreamReader(socket.getInputStream(),"UTF-8"));
            String line=null;
            while((line=br.readLine())!=null){
                out.println("Input: "+line);
                ChatManager.getChatManager().publish(this,line);
            }
            br.close();
        } catch (IOException ex) {
            Logger.getLogger(ChatSocket.class.getName()).log(Level.SEVERE, null, ex);
        }
        

    }
    
}

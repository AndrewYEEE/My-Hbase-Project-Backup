/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SocketPractice;

import java.io.IOException;
import static java.lang.System.out;
import java.net.ServerSocket;
import java.net.Socket;
import static java.time.Clock.system;
import javax.swing.JOptionPane;

/**
 *
 * @author hadoop
 */
public class ServerListener extends Thread{
    
    @Override
    public void run(){
        try{
            ServerSocket serverSocket = new ServerSocket(12345);
            while(true){
                //block
                Socket socket=serverSocket.accept();
                //set up connect
                //JOptionPane.showMessageDialog(null,"Connected in Server port 12345!!");
                //Send Socket to New Thread
                ChatSocket cs=new ChatSocket(socket);
                
                cs.start(); //start chatsocket
               out.println("ya");
                ChatManager.getChatManager().add(cs);
            }
            
        }catch(IOException e){
            e.printStackTrace();
        }
    }
    
}

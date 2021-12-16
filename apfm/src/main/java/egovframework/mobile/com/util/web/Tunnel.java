package egovframework.mobile.com.util.web;

import com.jcraft.jsch.*;

public class Tunnel {

//	 public static void main(String[] args){
//	      Tunnel t=new Tunnel();
//	      try{
//	          t.go();
//	      } catch(Exception e){
//	          System.out.println("error Tunnel");
//	      }
//	  }
//	  public void go() throws Exception{
//	      String host="127.0.0.1";
//	      String user="root";
//	      String password="1234";
//	      int port=22;
//	      
//	      int tunnelLocalPort=8080;
//	      String tunnelRemoteHost="127.0.0.1";
//	      int tunnelRemotePort=8080;
//	      
//	      JSch jsch=new JSch();
//	      Session session=jsch.getSession(user, host, port);
//	      session.setPassword(password);
//	      localUserInfo lui=new localUserInfo();
//	      session.setUserInfo(lui);
//	      session.connect();
//	      session.setPortForwardingL(tunnelLocalPort,tunnelRemoteHost,tunnelRemotePort);
//	      System.out.println("Connected@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	  
//	  }
	  
//	class localUserInfo implements UserInfo{
//	  String passwd;
//	  public String getPassword(){ return passwd; }
//	  public boolean promptYesNo(String str){return true;}
//	  public String getPassphrase(){ return null; }
//	  public boolean promptPassphrase(String message){return true; }
//	  public boolean promptPassword(String message){return true;}
//	  public void showMessage(String message){}
//	}     
	
}

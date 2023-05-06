import java.net.*;
import java.io.*;
class Server
{
    public static void main(String a[]) throws Exception
    {
      System.out.println("Server Application is runnining...");
      ServerSocat ssobj = new ServerSocat(2100);
      System.out.println("server is running at port no : 2100");

      Socat s= ssobj.accept();
      System.out.println("server ans clint connection is succesfull");
    }
}
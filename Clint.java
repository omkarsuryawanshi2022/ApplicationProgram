import java.net.*;
import java.io.*;
class Clint
{
    public static void main(String a[]) throws Exception
    {
      System.out.println("Clint Application is runnining...");

      Socket s= new Socket("localhost",2100);
      System.out.println(" clint is waiting for connection:");
    }
}
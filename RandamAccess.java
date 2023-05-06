import java.io.*;

class RandamAccess
{
    public static void main(String A[]) throws Exception
{
    RandamAccessFile fobj = new RandamAccessFile("Infosystems.txt","rx");

    fobj.writeUTF("abcdefghi");
}
    
}
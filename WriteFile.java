import java.io.*;

class WriteFile
{
    public static void main(String a[]) throws Exception{
        FileOutPutStream fobj =new FileOutPutStream("Infosystem.txt");
        String str ="India is my country";

        byte Arr[] = str.getBytes();
        fobj.Write(Arr);
        fobj.Close();
    }
}
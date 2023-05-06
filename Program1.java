import java.util.*;
class Program1
{
    public static void main(String Arg[])
    {
       // int iNo1=0,iNo2=0;
       //int iAns=0;
        System.out.println(" enter the number..");
        Scanner sobj= new Scanner(System.in);
         int iNo1=sobj.nextInt();

        System.out.println("enter the second number...");
         int iNo2=sobj.nextInt();

        int iAns=iNo1+iNo2;

        System.out.println(" Addition is:"+iAns);
    }
}

class Marvellous{
    public int no1;
    public int no2;
    public Marvellous()
    {
        no1=0;
        no2=0;
    }
    public Marvellous(int a,int b)
    {
        System.out.println("inside parametarised constructer");
        no1=a;
        no2=b;
    }
    protected void finalize()
    {
        System.out.println("Inside finalise method");
    }
}
class FinalizeDemo
{
    public static void main(String A[])
    {
        Marvellous mobj1 = new Marvellous();
        Marvellous mobj2 = new Marvellous(11,21);
        System.gc();
    }
}
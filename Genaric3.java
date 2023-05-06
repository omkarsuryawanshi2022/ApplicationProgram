clsss Demo <T>
{
    public T Value;

    public void Accept(T No)
    {
        Value=No;
    }
    public void Display()
    {
        System.out.println(Value);
    }
}
class Genaric3
{
    public static void main(String Arg[])
    {
        Demo <Integer> obj1 =new Demo<Integer>();
        obj1.Accept(11);
        obj1.Display();

        Demo <Integer> obj2 =new Demo<Double>();
        obj2.Accept(10.56);
        obj2.Display();
    }
}
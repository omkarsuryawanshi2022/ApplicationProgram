
class Student implements cloneable
{
    public String name;
    public int marks;
    public int age;

    public Student(String str,int a,int b)
    {
        this.name=str;
        this.marks=a;
        this.age=b;
    }
    public object clone()throws Exception
{
    return super.clone();
}
}
class CloneDemo
{
    public static void main(String a[])
    {
        Student obj = new Student("Amit,87,27");
    }
}
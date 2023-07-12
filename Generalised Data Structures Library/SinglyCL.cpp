//SinglyCL
#include<iostream>
using namespace std;

typedef class node
{
    public:
        int data;
        node *next;
        node *prev;
    
        node()
        {
            data = 0;
            next = NULL;
        }

        node(int value)
        {
            data = value;
            next = NULL;
        }

}NODE, *PNODE;

class LinkedList
{
    public:
        PNODE First;
        PNODE Last;
        int iCount;

        LinkedList()
        {
            First = NULL;
            Last=NULL;
            iCount = 0;
        }

        virtual void InsertFirst(int ino) = 0;
        virtual void InsertLast(int ino) = 0;
        virtual void InsertAtPos(int ino, int ipos) = 0;

        virtual void DeleteFirst() = 0;
        virtual void DeleteLast() = 0;
        virtual void DeleteAtPos(int ipos) = 0;

        void Display()
        {
            PNODE temp = First;

            cout<<"Elements of Linked List are : "<<"\n";

            for(int icnt = 1; icnt <= iCount; icnt++)
            {
                cout<<"| "<<temp->data<<" |-> ";
                temp = temp -> next;
            }
            cout<<"\n";
        }

        int Count()
        {
            return iCount;
        }
};

class SinglyCL: public LinkedList
{
    public:
        SinglyCL();
        ~SinglyCL();

        void InsertFirst(int no);
        void InsertLast(int no);
        void InsertAtPos(int no, int ipos);
        
        void DeleteFirst();
        void DeleteLast();
        void DeleteAtPos(int ipos);
};

void SinglyCL:: InsertFirst(int no)
{
    PNODE newn = NULL;

    newn = new NODE(no);    // newn = (PNODE)malloc(sizeof(NODE));

    if((First == NULL)&&(Last==NULL))   // LL is empty
    {
        First = newn;
        Last = newn;
    }
    else    // LL contains atleast one node in it
    {
        newn->next = First;
        First = newn;
    }
    Last->next=First;
    iCount++;
}

void SinglyCL:: InsertLast(int no)
{
    PNODE newn = NULL;

    newn = new NODE(no);    // newn = (PNODE)malloc(sizeof(NODE));

    if((First == NULL)&&(Last==NULL))   // LL is empty
    {
        First = newn;
        Last = newn;
    }
    else    // LL contains atleast one node in it
    {
       Last->next=newn;
       Last=Last->next;
    }
    Last->next=First;
    iCount++;
}

void SinglyCL:: DeleteFirst()
{
     if((First == NULL)&&(Last==NULL))         // Empty LL
    {
        return;
    }
    else if(First == Last)    // Single node in LL
    {
        delete First;       // free(First);
        First = NULL;
        Last=NULL;
    }
    else        // More than one node in LL
    {
        PNODE temp = First;

        First = First -> next;
        delete temp;
        Last->next=First;
    }
    iCount--;
}

void SinglyCL:: DeleteLast()
{
    if((First == NULL)&&(Last==NULL))         // Empty LL
    {
        return;
    }
    else if(First == Last)    // Single node in LL
    {
        delete First;       // free(First);
        First = NULL;
        Last=NULL;
    }
    else        // More than one node in LL
    {
        PNODE temp = First;

        while(temp->next!=Last)
        {
            temp=temp->next;
        }
        delete Last;
    }
    iCount--;
    }

SinglyCL:: SinglyCL()
{
    cout<<"Inside constructor\n";

    First = NULL;
    iCount = 0;
}

SinglyCL:: ~SinglyCL()
{
    cout<<"Inside destructor\n";
    PNODE temp = First;

    for(int iCnt = 1; iCnt <= iCount; iCnt++)
    {
        temp = First;
        First = First -> next;
        delete temp;
    }
}

void SinglyCL:: InsertAtPos(int no, int ipos)
{
   if((ipos < 1) || (ipos > iCount+1))
    {
        cout<<"Invalid position\n";
        return;
    }
    
    if(ipos == 1)
    {
        InsertFirst(no);
    }
    else if(ipos == iCount+1)
    {
        InsertLast(no);
    }
    else
    {
        PNODE temp = First;

        for(int icnt = 1; icnt < ipos -1; icnt++)
        {
            temp = temp->next;
        }

        PNODE newn = new NODE(no);

        newn->next = temp->next;
        temp->next->prev = newn;

        temp->next = newn;
        newn->prev = temp;

        iCount++;
    }
}



void SinglyCL:: DeleteAtPos(int ipos)
{
    if((ipos < 1) || (ipos > iCount))
    {
        cout<<"Invalid position\n";
        return;
    }
    
    if(ipos == 1)
    {
        DeleteFirst();
    }
    else if(ipos == iCount)
    {
        DeleteLast();
    }
    else
    {
        PNODE temp = First;

        for(int icnt = 1; icnt < ipos -1; icnt++)
        {
            temp = temp->next;
        }

        temp->next = temp->next->next;
        delete temp->next->prev;
        temp->next->prev = temp;

        iCount--;
    }
}

int main()
{
   int iRet = 0;

    SinglyCL obj1;
    

    obj1.InsertFirst(51);
    obj1.InsertFirst(21);
    obj1.InsertFirst(11);
    obj1.InsertLast(101);
    obj1.InsertLast(111);

    obj1.InsertAtPos(55,4);
    obj1.Display();

    obj1.DeleteAtPos(4);

    obj1.Display();
    iRet=obj1.Count();

    cout<<"Number of linked list are:"<<iRet<<"\n";

    obj1.DeleteFirst();
    obj1.DeleteLast();
 
    obj1.Display();
    iRet=obj1.Count();

    cout<<"Number of linked list are:"<<iRet<<"\n";


    return 0;
}
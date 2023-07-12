//doubly Linear Linkeked list

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
            prev = NULL;
        }

        node(int value)
        {
            data = value;
            next = NULL;
            prev = NULL;
        }

}NODE, *PNODE;

class LinkedList
{
    public:
        PNODE First;
        int iCount;

        LinkedList()
        {
            First = NULL;
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
                cout<<"| "<<temp->data<<" |<=> ";
                temp = temp -> next;
            }
            cout<<"NULL"<<"\n";
        }

        int Count()
        {
            return iCount;
        }
};

class DoublyLL : public LinkedList
{
    private:
        PNODE Last;

    public:
        DoublyLL();
        ~DoublyLL();

        void InsertFirst(int ino);
        void InsertLast(int ino);
        void InsertAtPos(int ino, int ipos);

        void DeleteFirst();
        void DeleteLast();
        void DeleteAtPos(int ipos);
};

DoublyLL:: DoublyLL()
{
    Last = NULL;
}

DoublyLL:: ~DoublyLL()
{}

void DoublyLL::InsertFirst(int no)
{
     PNODE newn = NULL;

    newn = new node;

    newn->data = no;
    newn->next = NULL;
    newn->prev = NULL;      // #

    if(First == NULL)       // LL is empty
    {
        First = newn;
    }
    else                    // LL contains atleast one node in it
    {
        First->prev = newn;       // #
        newn->next = First;
        First = newn;
    }
     iCount++;
}
void DoublyLL::InsertLast(int no)
{
     PNODE newn = NULL;

    newn = new node;

    newn->data = no;
    newn->next = NULL;
    newn->prev = NULL;      // #

    if(First == NULL)       // LL is empty
    {
        First = newn;
    }
    else                    // LL contains atleast one node in it
    { 
        PNODE temp = First;

         while(temp->next != NULL)   // type 2
        {
            temp = temp -> next;
        }

        temp->next = newn;
        newn->prev = temp;      // #
    }
    
     iCount++;
}
void DoublyLL::DeleteFirst()
{
    if(First==NULL)
    {
        return;
    }
    else if(First->next==NULL)
    {
        delete First;
        First = NULL;

    }
    else
    {
        First = First -> next;
        delete First->prev;        // #
        First -> prev = NULL;  
    }
    iCount --;
}
void DoublyLL::DeleteLast()
{
     if(First==NULL)
    {
        return;
    }
    else if(First->next==NULL)
    {
        delete First;
        First = NULL;

    }
    else
    {
        PNODE temp = First;

       while(temp -> next -> next != NULL)     // Type 3
        {
            temp = temp -> next;
        }

        delete temp->next;
        temp->next = NULL;
    }
    iCount --;
}


void DoublyLL::InsertAtPos(int no,int iPos)
{
    if((iPos<1)||(iPos>iCount+1))
    {
        cout<<"Invalid position\n";
        return;
    }

    if(iPos==1)
    {
        InsertFirst(no);
    }
    else if(iPos==iCount+1)
    {
        InsertLast(no);
    }
    else
    {
        PNODE temp = First;

        for(int iCnt=1;iCnt < iPos-1;iCnt++)
        {
            temp=temp->next;
        }
        
        PNODE newn = new NODE;
        newn->data=no;
        newn->next=NULL;
        newn->prev = NULL; 

        newn->next=temp->next;
        temp->next->prev = newn;   
        temp->next=newn;
        newn->prev = temp;

        iCount++;
    }
   
}
void DoublyLL:: DeleteAtPos(int iPos)
{
    if((iPos<1)||(iPos>iCount))
    {
        cout<<"Invalid position\n";
        return;
    }

    if(iPos==1)
    {
        DeleteFirst();
    }
    else if(iPos==iCount)
    {
        DeleteLast();
    }
    else
    {
        PNODE temp = First;
       

        for(int iCnt=1;iCnt < iPos-1;iCnt++)
        {
            temp=temp->next;
        }

        
        temp->next=temp->next->next;
        delete temp->next->prev;
        temp->next->prev=temp;

        iCount--;
    }

}
int main()

{
    int iRet = 0;

    DoublyLL obj1;
    

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

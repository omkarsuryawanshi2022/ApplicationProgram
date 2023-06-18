#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<unistd.h>
#include<iostream>
//#include<io.h>

#define MAXINODE 50

#define READ 1
#define WRITE 2

#define MAXFILESIZE 2048

#define REGULAR 1
#define SPECIAL 2

#define START 0
#define CURRENT 1
#define END 2

typedef struct SuperBlock
{
	int TotalInodes;
	int FreeInode;

}SUPERBLOCK,*PSUPERBLOCK;

typedef struct inode
{
	char FileName[50];
	int InodeNumber;
	int FileSize;
	int FileActualSize;
	int FileType;
	char *Buffer;
	int LinkCount;
	int ReferenceCount;
	int Permission;//1  23
	struct inode *next;

}INODE,*PINODE,**PPINODE;

typedef struct filetable
{
	int readoffset;
	int writeoffset;
	int count;
	int mode;//1 2 3
	PINODE ptrinode;

}FILETABLE,*PFILETABLE;

typedef struct ufdt
{
	PFILETABLE ptrfiletable;
}UFDT;

UFDT UFDTArr[50];
SUPERBLOCK SUPERBLOCKobj;
PINODE head = NULL;

void man(char *name)
{
 if(name==NULL)
 return;
 
 if(strcmp(name,"create")==0)
 {
 	printf(" Description : used to create new Regular file\n");
 	printf("usage : create file_name permission\n");
 }
 else if(strcmp(name,"read")==0)
 {
 	printf("Description:used to read data from regular file\n ");
 	printf("usage : read file_name no_of_byte_to_read\n");
 }
 else if(strcmp(name,"write")==0)
 {
 	printf("Description : used tow write into regular file\n");
 	printf("usage : write file_name\n after this enter data that we want to write\n");
 
 }
 else if(strcmp(name,"ls")==0)
 {
 	printf("Description : used to list all information of files\n");
 	printf("usage : ls\n");
 }
 
 else if(strcmp(name,"stat")==0)
 {
 	printf("Description : used to Display of files\n");
 	printf("usage : stat file_name\n");
 }
 
 else if(strcmp(name,"fstat")==0)
 {
 	printf("Description : used to Display information of files\n");
 	printf("usage : state file_Descriptor\n");
 }
 
 else if(strcmp(name,"truncate")==0)
 {
 	printf("Description : used to Remove data from file\n");
 	printf("usage : truncate file_name\n");
 }
 
 else if(strcmp(name,"open")==0)
 {
 	printf("Description : used to open existing  files\n");
 	printf("usage : open file_name mode\n");
 }
 
 else if(strcmp(name,"close")==0)
 {
 	printf("Description : used to close opened the files\n");
 	printf("usage : close file_name\n");
 }
 
 else if(strcmp(name,"closeall")==0)
 {
 	printf("Description : used to closed all opened  files\n");
 	printf("usage : closeall\n");
 }
 
 else if(strcmp(name,"lseek")==0)
 {
 	printf("Description : used to change file offset\n");
 	printf("usage : lseek file_name changeoffset StartPoint \n");
 }
 
 else if(strcmp(name,"rm")==0)
 {
 	printf("Description : used to Delete the file\n");
 	printf("usage : rm File_Name\n");
 }
 else 
 {
 	printf("ERROR : no manual entry available\n");
}
}
void DisplayHelp()
{	
printf("ls : To List out all file\n");
printf("clear : to Clear Console\n");
printf("open : To Open the file \n");
printf("close : to close the file file\n");
printf("closeall : to close all opened  files\n");
printf("read : to read the contents from file\n");
printf("write : to write the contants into file\n");
printf("exit : to terminate file system\n");
printf("stat : to display information of file using name\n");
printf("fstat : to Display information of file using file descriptor\n");
printf("truncate : to remove the dat from the file\n");
printf("rm : to Delete the file\n");	
}
int GetFDFromName(char *name)
{
 int i=0;
 while(i<50)
 {
 	if(UFDTArr[i].ptrfiletable!=NULL)
 	if(strcmp((UFDTArr[i].ptrfiletable->ptrinode->FileName),name)==0)
 	break;
 	i++;
 }
 if(i == 50)
 return -1;
 else
 return i;
}

PINODE Get_Inode(char *name)
{
   PINODE temp=head;
   int i=0;
   
   if(name==NULL)
   return NULL;
   
   while(temp!=NULL)
   {
   	if(strcmp(name,temp->FileName)==0)
   	break;
   	temp = temp->next;
   }
   return temp;
}
void CreateDILB()
{
int i=1;
PINODE newn = NULL;
PINODE temp = head;

while(i<=MAXINODE)
{
	newn= (PINODE)malloc(sizeof(INODE));
	
	newn->LinkCount=0;
	newn->ReferenceCount=0;
	newn->FileType=0;
	newn->FileSize=0;
	
	newn->Buffer=NULL;
	newn->next= NULL;
	
	newn->InodeNumber=i;
	
	if(temp==NULL)
	{
		head=newn;
		temp=head;
	}
	else
	{
		temp->next=newn;
		temp = temp->next;
	}
	i++;
}
printf("DILB created Succesfully\n");
}

void InitialiseSuperBlock()
{
int i=0;
while(i< MAXINODE)
{
	UFDTArr[i].ptrfiletable= NULL;
	i++;
}
SUPERBLOCKobj.TotalInodes= MAXINODE;
SUPERBLOCKobj.FreeInode= MAXINODE;
}
int CreateFile(char *name,int Permission)
{
  int i=0;
  PINODE temp= head;
  
  if((name == NULL)||(Permission == 0)||(Permission > 3))
  return -1;
  
  if(SUPERBLOCKobj.FreeInode == 0)
  return -2;
  
  (SUPERBLOCKobj.FreeInode)--;
  
  if(Get_Inode(name)!=NULL)
  return -3;
  
  while(temp!=NULL)
  {
  	if(temp->FileType ==0)
  	break;
  	temp= temp->next;
  }
  while(i<50)
  {
  	if(UFDTArr[i].ptrfiletable == NULL)
  	break;
  	i++;
  }
  UFDTArr[i].ptrfiletable =(PFILETABLE)malloc(sizeof(FILETABLE));
  
  UFDTArr[i].ptrfiletable->count =1;
  UFDTArr[i].ptrfiletable->mode = Permission;
  UFDTArr[i].ptrfiletable->readoffset =0;
  UFDTArr[i].ptrfiletable->writeoffset =0;
  
  UFDTArr[i].ptrfiletable->ptrinode = temp;
  
  strcpy(UFDTArr[i].ptrfiletable->ptrinode->FileName,name);
  UFDTArr[i].ptrfiletable->ptrinode->FileType =REGULAR;
  UFDTArr[i].ptrfiletable->ptrinode->ReferenceCount=1;
  UFDTArr[i].ptrfiletable->ptrinode->LinkCount=1;
  UFDTArr[i].ptrfiletable->ptrinode->FileSize=MAXFILESIZE;
  UFDTArr[i].ptrfiletable->ptrinode->FileActualSize=0;
  UFDTArr[i].ptrfiletable->ptrinode->Permission=Permission;
  UFDTArr[i].ptrfiletable->ptrinode->Buffer =(char *)malloc(MAXFILESIZE);
  
  return i;
}
//rm_file("Demo.txt")
int rm_File(char *name)
{
	int fd=0;
	
	fd=GetFDFromName(name);
	if(fd == -1)
	return -1;
	
	(UFDTArr[fd].ptrfiletable->ptrinode->LinkCount)--;
	
	if(UFDTArr[fd].ptrfiletable->ptrinode->LinkCount == 0)
	{
		UFDTArr[fd].ptrfiletable->ptrinode->FileType=0;
		//free(UFDTArr[fd].ptrfiletable->ptrinode->Buffer);
		free(UFDTArr[fd].ptrfiletable);
	}
	UFDTArr[fd].ptrfiletable = NULL;
	(SUPERBLOCKobj.FreeInode)++;
}
int ReadFile(int fd,char *arr,int isize)
{
  int read_size = 0;
  if(UFDTArr[fd].ptrfiletable == NULL)
  return -1;
  
  if(UFDTArr[fd].ptrfiletable->mode!=READ && UFDTArr[fd].ptrfiletable->mode!=READ+WRITE)
  return -2;
  
  if(UFDTArr[fd].ptrfiletable->ptrinode->Permission!=READ && UFDTArr[fd].ptrfiletable->ptrinode->Permission!=READ+WRITE)
  return -2;
  
  if(UFDTArr[fd].ptrfiletable->readoffset == UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)
  return -3;
  
  if(UFDTArr[fd].ptrfiletable->ptrinode->FileType!=REGULAR)
  return -4;
  
  read_size =(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)- (UFDTArr[fd].ptrfiletable->readoffset);
  if(read_size<isize)
  {
  	strncpy(arr,(UFDTArr[fd].ptrfiletable->ptrinode->Buffer)+ (UFDTArr[fd].ptrfiletable->readoffset),read_size);
  	UFDTArr[fd].ptrfiletable->readoffset = UFDTArr[fd].ptrfiletable->readoffset+read_size;
	  }
	  else
	  {
	  	strncpy(arr,(UFDTArr[fd].ptrfiletable->ptrinode->Buffer)+(UFDTArr[fd].ptrfiletable->readoffset),isize);
	  	
	  	(UFDTArr[fd].ptrfiletable->readoffset)= (UFDTArr[fd].ptrfiletable->readoffset)+ isize;
	  }
	  return isize;
  }

int writeFile(int fd,char *arr,int isize)
{
if(((UFDTArr[fd].ptrfiletable->mode)!=WRITE)&&((UFDTArr[fd].ptrfiletable->mode)!=READ+WRITE))
return -1;

if(((UFDTArr[fd].ptrfiletable->ptrinode->Permission)!=WRITE)&&((UFDTArr[fd].ptrfiletable->ptrinode->Permission)!=READ+WRITE))	
return -1;

if((UFDTArr[fd].ptrfiletable->writeoffset)==MAXFILESIZE)
return -2;

if((UFDTArr[fd].ptrfiletable->ptrinode->FileType)!=REGULAR)
return -3;

strncpy((UFDTArr[fd].ptrfiletable->ptrinode->Buffer)+(UFDTArr[fd].ptrfiletable->writeoffset),arr,isize);

(UFDTArr[fd].ptrfiletable->writeoffset)=(UFDTArr[fd].ptrfiletable->writeoffset)+ isize;

(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)=(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)+ isize;

return isize;
}
int  OpenFile(char *name,int mode)
{
	int i=0;
	PINODE temp =NULL;
	
	if(name == NULL || mode<=0)
	return -1;
	
	temp =Get_Inode(name);
	if(temp== NULL)
	return -2;
	
	if(temp->Permission<mode)
	return -3;
	
	while(i<50)
	{
		if(UFDTArr[i].ptrfiletable == NULL)
		break;
		i++;
	}
	
	UFDTArr[i].ptrfiletable=(PFILETABLE)malloc(sizeof(FILETABLE));
	if(UFDTArr[i].ptrfiletable == NULL)
	return -1;
	UFDTArr[i].ptrfiletable->count=1;
	UFDTArr[i].ptrfiletable->mode=mode;
	if(mode ==READ + WRITE)
	{
		UFDTArr[i].ptrfiletable->readoffset=0;
		UFDTArr[i].ptrfiletable->writeoffset=0;
	}
	else if(mode ==READ)
	{
		UFDTArr[i].ptrfiletable->readoffset=0;
	}
	else if(mode ==WRITE)
	{
		UFDTArr[i].ptrfiletable->writeoffset=0;
	}
	UFDTArr[i].ptrfiletable->ptrinode = temp;
	(UFDTArr[i].ptrfiletable->ptrinode->ReferenceCount)++;
	
	return i;
}
void CloseFileByName(int fd)
{
	UFDTArr[fd].ptrfiletable->readoffset=0;
	UFDTArr[fd].ptrfiletable->writeoffset=0;
	(UFDTArr[fd].ptrfiletable->ptrinode->ReferenceCount)--;
}
int  CloseFileByName(char *name)
{
	int i=0;
	i= GetFDFromName(name);
	if(i == -1)
	return -1;
	
	UFDTArr[i].ptrfiletable->readoffset=0;
	UFDTArr[i].ptrfiletable->writeoffset=0;
	(UFDTArr[i].ptrfiletable->ptrinode->ReferenceCount)--;
	
	return 0;
}
void closeAllFile()
{
	int i=0;
	while(i<50)
	{
		if(UFDTArr[i].ptrfiletable != NULL)
		{
			UFDTArr[i].ptrfiletable->readoffset=0;
			UFDTArr[i].ptrfiletable->writeoffset=0;
			(UFDTArr[i].ptrfiletable->ptrinode->ReferenceCount)--;
			break;
		}
		i++;
	}
}
int LseekFile(int fd,int size,int from)
{
if((fd<0)|| (from> 2))
return -1;

if(UFDTArr[fd].ptrfiletable == NULL)
return -1;

if((UFDTArr[fd].ptrfiletable->mode ==READ)|| (UFDTArr[fd].ptrfiletable->mode ==READ+WRITE))
{
	if(from == CURRENT)
	{
		if(((UFDTArr[fd].ptrfiletable->readoffset)+ size)>UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)
		return -1;
		
		if(((UFDTArr[fd].ptrfiletable->readoffset)+ size)<0)
		return -1;
		(UFDTArr[fd].ptrfiletable->readoffset)= (UFDTArr[fd].ptrfiletable->readoffset)+ size;
	}
else if(from == START)
{
	if(size >(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize))
	return -1;
	if(size< 0)
	return -1;
	(UFDTArr[fd].ptrfiletable->readoffset)= size;
}
else if(from == END)
{
	if((UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)+ size > MAXFILESIZE)
	return -1;
	if(((UFDTArr[fd].ptrfiletable->readoffset)+ size)<0)
	return -1;
	(UFDTArr[fd].ptrfiletable->readoffset)=(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)+ size;
}
}
else if(UFDTArr[fd].ptrfiletable->mode == WRITE)
{
	if(from == CURRENT)
	{
		if(((UFDTArr[fd].ptrfiletable->writeoffset)+ size)> MAXFILESIZE)
		return -1;
		if(((UFDTArr[fd].ptrfiletable->writeoffset)+ size)<0)
		return -1;
		
		if(((UFDTArr[fd].ptrfiletable->writeoffset)+ size)>(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize))
		(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)=(UFDTArr[fd].ptrfiletable->writeoffset)+ size;
		(UFDTArr[fd].ptrfiletable->writeoffset)=(UFDTArr[fd].ptrfiletable->writeoffset)+ size;
	}
else if(from == START)
{
	if(size > MAXFILESIZE)
	return -1;
	if( size < 0)
	return  -1;
	if( size >(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize))
	(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)= size;
	(UFDTArr[fd].ptrfiletable->writeoffset)= size;
}
else if(from == END)
{
	if((UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize) + size > MAXFILESIZE)
	return -1;
	if(((UFDTArr[fd].ptrfiletable->writeoffset)+ size)< 0)
	return -1;
	(UFDTArr[fd].ptrfiletable->writeoffset)=(UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize)+ size;
}
}
}
void ls_File()
{
   int i=0;
   PINODE temp = head;
   
   if(SUPERBLOCKobj.FreeInode == MAXINODE)
   {
   	printf(" Error : there are no file\n");
   	return ;
   }
   printf("\nfile name\tInode number\tfile size\tlink count\n");
   printf("\nfile name\tInode number\tfile size\tlink count\n");
   while(temp!=NULL)
   {
   	if(temp->FileType!=0)
   	{
   		printf("%s\t\t%d\t\t%d\t\t%d\n",temp->FileName,temp->InodeNumber,temp->FileActualSize,temp->LinkCount);
   		
	   }
	   temp = temp->next;
   }
printf("\nfile name\tInode number\tfile size\tlinkcount\n");
}
int fstat_File(int fd)
{
	PINODE temp= head;
	int i=0;
	
	if(fd<0)
	return -1;
	
	if(UFDTArr[fd].ptrfiletable == NULL)
	return -2;
	
	temp = UFDTArr[fd].ptrfiletable->ptrinode;
	
	printf("\n----statistical inormation about file------\n");
	printf("file name: %s\n",temp->FileName);
	printf("Inode number%d\n",temp->InodeNumber);
	printf("File size: %d\n",temp->FileSize);
	printf("Actual File size: %d\n",temp->FileActualSize);
	printf("Link count: %d\n",temp->LinkCount);
	printf("Reference Count:%d\n",temp->ReferenceCount);
	
	if(temp->Permission == 1)
	printf("File Permission: Read Only\n");
	else if(temp->Permission == 2)
	printf("file Permission : Write\n");
	else if(temp->Permission == 3)
	printf(" File Permission: Read & Write\n");
	printf(" File Permission: Read & Write\n\n");
	
	return 0;
}
int stat_file(char *name)
{
  PINODE temp =head;
  int i=0;
  
  if(name == NULL)
  return -1;
  while(temp!= NULL)
  {
  	if(strcmp(name,temp->FileName)==0)
  	break;
  	temp= temp->next;
	}  
	if(temp == NULL)
	return -2;
	
	printf("\n-----statistical Informatin about file----\n");
	printf("file name: %s\n",temp->FileName);
	printf(" Inode Number: %d\n",temp->InodeNumber);
	printf("File size: %d\n",temp->FileSize);
	printf("Actual file size: %d\n",temp->FileActualSize);
	printf("Link Count : %d\n",temp->LinkCount);
	printf("Reference count: %d\n",temp->ReferenceCount);
	
	if(temp->Permission == 1)
	printf("File Permission : Read only\n");
	else if(temp->Permission == 2)
	printf(" File Permission : Write\n");
	else if(temp->Permission == 3)
	printf("File Permission: Read & Write\n");
	printf(" File Permission: Read & Write\n\n");
	
	return 0;
}
int truncate_File(char *name)
{
	int fd = GetFDFromName(name);
	if(fd==-1)
	return -1;
	
	memset(UFDTArr[fd].ptrfiletable->ptrinode->Buffer,0,1024);
	UFDTArr[fd].ptrfiletable->readoffset =0;
	UFDTArr[fd].ptrfiletable->writeoffset =0;
	UFDTArr[fd].ptrfiletable->ptrinode->FileActualSize=0;
}


int main()
{
	char *ptr = NULL;
	int ret=0,fd=0,count=0;
	char command[4][80],str[80],arr[1024];
	
	InitialiseSuperBlock();
	CreateDILB();
	
	while(1)
	{
		fflush(stdin);
		strcpy(str,"");
		
		printf("\n marvellous VFS: >");
		
		fgets(str,80,stdin);//scanf("%[^\n]s",str);
		
		count = sscanf(str,"%s %s %s",command[0],command[1],command[2],command[3]);
		
		if(count==1)
		{
			if(strcmp(command[0],"ls")==0)
			{
				ls_File();
			}
			else if(strcmp(command[0],"closeall")==0)
			{
				closeAllFile();
				printf("all the file closed succesfully \n");
				continue;
			}
			else if(strcmp(command[0],"clear")==0)
			{
				system("cls");
				continue;
			}
			else if(strcmp(command[0],"help")==0)
			{
				DisplayHelp();
				continue;
			}
			else if(strcmp(command[0],"exit")==0)
			{
				printf(" terminating the marvellous virtual File System\n");
				break;
			}
			else
			{
				printf("\nERROR :Command Not Found!!!\n");
				continue;
			}
		}
		else if(count==2)
		{
			if(strcmp(command[0],"stat")==0)
			{
				ret=stat_file(command[1]);
				if(ret==-1)
				printf("ERROR: Incorrect Parameters\n");
				if(ret==-2)
				printf("ERROR :there is no such file\n");
				continue;
			}
		else if(strcmp(command[0],"fstat")==0)
			{
				ret=fstat_File(atoi(command[1]));
				if(ret==-1)
				printf("ERROR: Incorrect Parameters\n");
				if(ret==-2)
				printf("ERROR :there is no such file\n");
				continue;
			}
				else if(strcmp(command[0],"close")==0)
			{
				ret=CloseFileByName(command[1]);
				if(ret==-1)
				printf("ERROR :there is no such file\n");
				continue;
			}
				else if(strcmp(command[0],"rm")==0)
			{
				ret=rm_File(command[1]);
				if(ret==-1)
				printf("ERROR :there is no such file\n");
				continue;
			}
			else if(strcmp(command[0],"man")==0)
			{
				man(command[1]);
			}
			else if(strcmp(command[0],"write")==0)
			{
			fd=GetFDFromName(command[1]);
			if(fd==-1)
			{
				printf("RRROR: incorrct Parameters\n");
				continue;
				}	
				printf(" enter the data:\n");
				scanf("%[^\n]",arr);
				
				ret=strlen(arr);
				if(ret==0)
				{
					printf("Error: Incorrect Parameters\n");
					continue;
				}
				ret=writeFile(fd,arr,ret);
				if(ret==-1)
				printf("Error :Permittion Denied\n");
				if(ret==-2)
				printf("Error:There is no Sufficint memory to write\n");
				if(ret==-3)
				printf("Error: it is not Regular File\n");
			}
			else if(strcmp(command[0],"truncate")==0)
			{
			ret= truncate_File(command[1]);
			if(ret==-1)
			printf(" Error:Incorret Parameter\n");
			}
			else
			{
				printf("\nERROR: Command not Fount!!!\n");
				continue;
			}
		}
		else if(count==3)
		{
			if(strcmp(command[0],"create")==0)
			{
				ret=CreateFile(command[1],atoi(command[2]));
				if(ret>=0)
				printf("File is the succesfully Created with File Descriptor:%d\n",ret);
				if(ret==-1)
				printf("Error: Incorrect Parameters\n");
					if(ret==-2)
				printf("Error: there is no inodes\n");
					if(ret==-3)
				printf("Error: file already exists\n");
				if(ret ==-4)
					printf (" ERROR : memory alocation failure\n");
				
				   continue;
			}
		
			else if(strcmp(command[0],"open")==0)
			{
				ret=OpenFile(command[1],atoi(command[2]));
				if(ret >= 0)
				printf("File is the succesfully opened with file descripter : %d\n",ret);
				if(ret == -1)
				printf("ERROR :incorrect Parameters\n");
				if(ret == -2)
				printf("ERROR : File is not Present\n");
				if(ret == -3)
				printf("ERROR : Permission denied\n");
				continue;
			}
			else if(strcmp(command[0],"read")==0)
			{
				fd=GetFDFromName(command[1]);
				if(fd==-1)
				{
					printf(" Error: Incorrect  Parameters\n");
					continue;
				}
				ptr=(char *)malloc(sizeof(atoi(command[2]))+1);
				if(ptr == NULL)
				{
					printf(" Error:Memory Allocation Faliure\n");
					continue;
				}
				ret=ReadFile(fd,ptr,atoi(command[2]));
				if(ret==-1)
				printf("Error:File is Not Existing\n");
				if(ret==-2)
				printf("Error:Permition Defined\n");
				if(ret==-3)
				printf("Error:Reached at end of file\n");
				if(ret==-4)
				printf("Error:it is not Regular File \n");
				if(ret==0)
				printf("Error:File Empty\n");
				if(ret>0)
				{
					write(2,ptr,ret);
				}
				continue;
			}
			else
			{
				printf("\nERROR: Command not Found!!!\n");
				continue;
			}
		}
		else if(count ==4)
		{
			if(strcmp(command[0],"lseek")==0)
			{
				fd=GetFDFromName(command[1]);
				if(fd==-1)
				{
					printf("Error: Incorrect Parameters\n");
					continue;
				}
				ret=LseekFile(fd,atoi(command[2]),atoi(command[3]));
				if(ret ==-1)
				{
					printf("Error: Unable to perform lseek\n");
				}
			}
			else
			{
				printf("\n ERROR: Command Not Found!!!\n");
				continue;
			}
		}
		else
		{
			printf("\nERROR: Command Not Found!!!!\n");
			continue;
		}
	}
	return 0;
}

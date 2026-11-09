//Author: Abu Hossain
//Create: 05/11/2026 11:09 PM Colombo Sri Lanka
//Last Edit: 05/11/2026 11:09 PM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int is_palindrome(char s[])
{

    int len=strlen(s);
    int loop=len/2;
    int status=1;
    len=len-1;
    for(int i=0;i<loop;i++)
    {
        if(s[i]!=s[len-i])
        {
            status=0;
            break;
        }
    }
    return status;
}

int main()
{
    char s[1009];
    scanf("%s",s);
    int status=is_palindrome(s);

    if(status)
    {
        printf("Palindrome");
    }
    else
    {
        printf("Not Palindrome");
    }
    
    
    return 0;
}
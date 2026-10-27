//https://codeforces.com/group/MWSDmqGsZm/contest/219856/problem/G

//Author: Abu Hossain
//Create: 27/10/2026 10:06 AM Colombo Sri Lanka
//Last Edit: 27/10/2026 10:06 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    char s[100001];
    scanf("%s",&s);
    int dif='a'-'A';

    for(int i=0;i<strlen(s);i++)
    {
        if(s[i]==',')
        {
            s[i]=' ';
        }
        else if(s[i]>='a' && s[i]<='z')
        {
            s[i] -=dif;
        }
        else if(s[i]>='A' && s[i]<='Z')
        {
            s[i] +=dif;
        }
    }
    
    printf("%s",s);
    
    
    return 0;
}
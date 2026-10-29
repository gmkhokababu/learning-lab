//https://codeforces.com/group/MWSDmqGsZm/contest/219856/problem/C

//Author: Abu Hossain
//Create: 29/10/2026 08:13 AM Colombo Sri Lanka
//Last Edit: 29/10/2026 08:13 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    char s[25],c[25];
    scanf("%s %s",s,c);

    int val=strcmp(s,c);

    if(val<0)
    {
        printf("%s",s);
    }
    else if(val>0)
    {
        printf("%s",c);
    }
    else if(val==0)
    {
        printf("%s",s);
    }
    
    
    return 0;
}
//https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/N

//Author: Abu Hossain
//Create: 05/11/2026 09:22 AM Colombo Sri Lanka
//Last Edit: 05/11/2026 09:22 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    int a,b;
    scanf("%d %d",&a,&b);
    char s[a+b+5];
    scanf("%s",s);
    // printf("%s",s);
    if(s[a]!='-')
    {
        printf("No");
        return 0;
    }
    int len=strlen(s);
    // for(int i=a+2;i<len;i++)
    int def=len-(a+1);
    if(def!=b)
    {
        printf("No");
        return 0;
    }

    for(int i=a+1;i<len;i++)
    {
        if(s[i]<'0' || s[i]>'9')
        {
            printf("No");
            return 0;
        }
    }
    for(int i=0;i<a;i++)
    {
        if(s[i]<'0' || s[i]>'9')
        {
            printf("No");
            return 0;
        }
    }
    
    printf("Yes");
    
    return 0;
}
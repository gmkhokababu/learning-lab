//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/W

//Author: Abu Hossain
//Create: 22/10/2026 11:34 PM Colombo Sri Lanka
//Last Edit: 22/10/2026 11:34 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b,c;
    char s,q;
    scanf("%d %c %d %c %d",&a,&s,&b,&q,&c);

    if(s=='+' && a+b==c)
    {
        printf("Yes");
    }
    else if(s=='-' && a-b==c)
    {
        printf("Yes");
    }
    else if(s=='*' && a*b==c)
    {
        printf("Yes");
    }
    else
    {
        if(s=='+')
        {
            printf("%d",a+b);
        }
        else if(s=='-')
        {
            printf("%d",a-b);
        }
        else if(s=='*')
        {
            printf("%d",a*b);
        }
    }
    
    return 0;
}
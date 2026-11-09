//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/W

//Author: Abu Hossain
//Create: 05/11/2026 02:14 PM Colombo Sri Lanka
//Last Edit: 05/11/2026 02:14 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b,c;
    char s,q;
    scanf("%d %c %d %c %d",&a,&s,&b,&q,&c);
    // printf("%d %c %d %c %d",a,s,b,q,c);

    if(s=='+')
    {
        if(a+b==c)
        {
            printf("Yes");
        }
        else
        {
            printf("%d",a+b);
        }
    }
    else if(s=='-')
    {
        if(a-b==c)
        {
            printf("Yes");
        }
        else
        {
            printf("%d",a-b);
        }
    }
    else if(s=='*')
    {
        if(a*b==c)
        {
            printf("Yes");
        }
        else
        {
            printf("%d",a*b);
        }
    }

    
    
    return 0;
}
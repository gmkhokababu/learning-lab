// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/O

//Author: Abu Hossain
//Create: 22/10/2026 01:58 AM Colombo Sri Lanka
//Last Edit: 22/10/2026 01:58 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b,result;
    char s;
    scanf("%d %c %d",&a,&s,&b);
    // printf("%c",s);

    if(s=='+')
    {
        result=a+b;
    }
    else if(s=='-')
    {
        result=a-b;
    }
    else if(s=='*')
    {
        result=a*b;
    }
    else if(s=='/')
    {
        result=a/b;
    }
    printf("%d\n",result);


    
    
    return 0;
}
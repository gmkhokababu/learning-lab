//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/V

//Author: Abu Hossain
//Create: 22/10/2026 11:21 PM Colombo Sri Lanka
//Last Edit: 22/10/2026 11:21 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b;
    char s;
    scanf("%d %c %d",&a,&s,&b);
    if(s=='>')
    {
        if(a>b)
        {
            printf("Right");
        }
        else
        {
            printf("Wrong");
        }
    }
    else if(s=='<')
    {
        if(a<b)
        {
            printf("Right");
        }
        else
        {
            printf("Wrong");
        }
    }
    else if(s=='=')
    {
        if(a==b)
        {
            printf("Right");
        }
        else
        {
            printf("Wrong");
        }
    }
    
    
    return 0;
}
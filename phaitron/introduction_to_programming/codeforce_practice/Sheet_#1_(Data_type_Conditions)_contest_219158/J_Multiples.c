//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/J

//Author: Abu Hossain
//Create: 21/10/2026 09:37 PM Colombo Sri Lanka
//Last Edit: 21/10/2026 09:37 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b;
    scanf("%d %d",&a,&b);
    if(a>b)
    {
        if(a%b==0)
        {
            printf("Multiples");
        }
        else
        {
            printf("No Multiples");
        }
    }
    else
    {
        if(b%a==0)
        {
            printf("Multiples");
        }
        else
        {
            printf("No Multiples");
        }
    }
    
    
    return 0;
}
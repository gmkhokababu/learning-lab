// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/K

//Author: Abu Hossain
//Create: 21/10/2026 09:48 PM Colombo Sri Lanka
//Last Edit: 21/10/2026 09:48 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b,c;
    scanf("%d %d %d",&a,&b,&c);
    int max=a,min=a;

    // if(a>=b && a>=c)
    // {
    //     max=a;
    //     if(b>=c)
    //     {
    //         min = c;
    //     }
    //     else
    //     {
    //         min=b;
    //     }
    // }
    // else if(b>=a && b>=c)
    // {
    //     max=b;
    //     if(a>=c)
    //     {
    //         min=c;
    //     }
    //     else
    //     {
    //         min = a;
    //     }
    // }
    // else if(c>=a && c>=b)
    // {
    //     max=c;
    //     if(a>=b)
    //     {
    //         min=b;
    //     }
    //     else
    //     {
    //         min=a;
    //     }
    // }

    if(max<=b && b>=c)
    {
        max=b;
        
    }
    else if(max<=c && c>=b)
    {
        max=c;
    }

    if(min>=b && b<=c)
    {
        min =b;
    }
    else if(min>=c && c<=b)
    {
        min=c;
    }

    printf("%d %d",min,max);
    
    return 0;
}
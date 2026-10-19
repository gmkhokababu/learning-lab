//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/L

//Author: Abu Hossain
//Create: 16/10/2026 04:06 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b;
    scanf("%d %d",&a,&b);
    int gcd;
    if(a<b)
    {
        for(int i=1;i<=a;i++)
        {
            if(a%i==0 && b%i==0)
            {
                gcd=i;
            }
        }
    }
    else
    {
        for(int i=1;i<=b;i++)
        {
            if(a%i==0 && b%i==0)
            {
                gcd=i;
            }
        }
    }

    printf("%d",gcd);

    
    
    return 0;
}
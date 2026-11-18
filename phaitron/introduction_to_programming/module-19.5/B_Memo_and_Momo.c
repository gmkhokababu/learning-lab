//https://codeforces.com/group/MWSDmqGsZm/contest/326175/problem/B


//Author: Abu Hossain
//Create: 18/11/2026 12:13 PM Colombo Sri Lanka
//Last Edit: 18/11/2026 12:13 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    long long int a,b,k;
    scanf("%lld %lld %lld",&a,&b,&k);

    if(a%k==0 && b%k==0)
    {
        printf("Both");
    }
    else if(a%k==0)
    {
        printf("Memo");
    }
    else if(b%k==0)
    {
        printf("Momo");
    }
    else
    {
        printf("No One");
    }
    
    
    return 0;
}
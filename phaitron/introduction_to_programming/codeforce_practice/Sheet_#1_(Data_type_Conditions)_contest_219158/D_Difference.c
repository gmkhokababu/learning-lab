// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/D

//Author: Abu Hossain
//Create: 20/10/2026 05:13 AM Colombo Sri Lanka
//Last Edit: 20/10/2026 05:13 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    long long a,b,c,d;
    scanf("%lld %lld %lld %lld",&a,&b,&c,&d);

    long long x=(a*b)-(c*d);

    printf("Difference = %lld",x);
    
    
    return 0;
}
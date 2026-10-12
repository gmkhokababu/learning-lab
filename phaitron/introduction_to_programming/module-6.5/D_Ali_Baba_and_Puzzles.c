//https://codeforces.com/group/MWSDmqGsZm/contest/326175/problem/D

//Author: Abu Hossain
//Create: 13/10/2026 03:46 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    
    long long int a;
    long long int b;
    long long int c;
    long long int d;
    scanf("%lld %lld %lld %lld",&a,&b,&c,&d);

    if(a+b-c==d || a-b+c==d || a+b*c==d || a-b*c==d || a*b+c==d || a*b-c==d)
    {
        printf("YES\n");
    }
    else
    {
        printf("NO\n");
    }
    return 0;
}
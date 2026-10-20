// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/G

// Author: Abu Hossain
// Create: 21/10/2026 03:28 AM Colombo Sri Lanka
// Last Edit: 21/10/2026 03:28 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    long long n;
    scanf("%lld", &n);
    long long sum = 0;

    sum=(1+n)*(n/2);

    if(n%2!=0)
    {
        sum +=(n+1)/2;
    }
    printf("%lld", sum);

    return 0;
}
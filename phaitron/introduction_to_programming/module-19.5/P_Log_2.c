//https://codeforces.com/group/MWSDmqGsZm/contest/223339/problem/P

//Author: Abu Hossain
//Create: 18/11/2026 19:34 PM Colombo Sri Lanka
//Last Edit: 18/11/2026 19:34 PM Colombo Sri Lanka

#include <stdio.h>

long long int log_2(long long int n)
{
    long long int count=0;

    if(n/2==0)
    {
        // count++;
        return count;
    }
    count++;
    count +=log_2(n/2);
    return count;
}

int main()
{
    long long int n;
    scanf("%lld",&n);

    printf("%lld",log_2(n));
    
    
    return 0;
}
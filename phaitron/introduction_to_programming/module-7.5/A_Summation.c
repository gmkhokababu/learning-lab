// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/A

//Author: Abu Hossain
//Create: 15/10/2026 01:04 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    long long int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%lld",&arr[i]);
    }
    
    long long int sum=0;
    for(int i=0;i<n;i++)
    {
        sum +=arr[i];
    }

    if(sum<0)
    {
        sum *= -1;
        printf("%lld",sum);
    }
    else
    {
        printf("%lld",sum);
    }
    
    return 0;
}
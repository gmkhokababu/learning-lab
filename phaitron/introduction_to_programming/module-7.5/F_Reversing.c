// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/F

//Author: Abu Hossain
//Create: 15/10/2026 03:10 AM Colombo Sri Lanka

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

    for(int i=n-1;i>=0;i--)
    {
        printf("%d ",arr[i]);
    }

    
    
    return 0;
}
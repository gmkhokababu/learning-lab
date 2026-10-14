// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/B

//Author: Abu Hossain
//Create: 15/10/2026 01:19 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    long long int arr[n];

    for(int i = 0; i<n; i++)
    {
        scanf("%lld",&arr[i]);
    }

    long long int s;
    scanf("%lld",&s);

    // printf("ok");

    for(int i=0;i<n;i++)
    {
        if(arr[i]==s)
        {
            printf("%d",i);
            return 0;
        }
    }

    printf("%d", -1);
    
    
    return 0;
}
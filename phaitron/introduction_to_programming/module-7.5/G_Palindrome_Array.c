// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/G

//Author: Abu Hossain
//Create: 15/10/2026 03:19 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    long long int a[n];
    for(int i=0;i<n;i++)
    {
        scanf("%lld",&a[i]);
    }
    long long int rev[n];
    for(int i=n;i>0;i--)
    {
        rev[n-i]=a[i-1];
    }
    for(int i=0;i<n;i++)
    {
        if(a[i]!=rev[i])
        {
            printf("NO");
            return 0;
        }
    }

    printf("YES");
    
    
    return 0;
}
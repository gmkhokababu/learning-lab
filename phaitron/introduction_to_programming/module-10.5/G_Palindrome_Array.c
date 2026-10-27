//https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/G

//Author: Abu Hossain
//Create: 27/10/2026 09:44 AM Colombo Sri Lanka
//Last Edit: 27/10/2026 09:44 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int a[n], b[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&a[i]);
    }

    for(int i=0;i<n/2;i++)
    {
        if(a[i]!=a[n-1-i])
        {
            printf("NO");
            return 0;
        }
    }

    printf("YES");
    
    
    return 0;
}
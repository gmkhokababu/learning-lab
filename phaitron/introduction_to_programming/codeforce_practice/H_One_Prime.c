// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/H

//Author: Abu Hossain
//Create: 14/10/2026 06:36 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int count=1;
    for(int i=1;i<=n/2;i++)
    {
        if(n%i==0)
        {
            count++;
        }
    }

    if(count==2)
    {
        printf("YES");
    }
    else
    {
        printf("NO");
    }
    
    
    return 0;
}
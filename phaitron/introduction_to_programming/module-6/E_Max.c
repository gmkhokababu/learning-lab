// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/E

//Author: Abu Hossain
//Create: 12/10/2026 08:23 PM Colombo Sri Lanka

#include <stdio.h>
#include <limits.h>

int main()
{
    
    int n;
    scanf("%d",&n);
    int max=INT_MIN;
    scanf("%d",&max);
    for(int i=1;i<n;i++)
    {
        int x;
        scanf("%d",&x);
        if(max<=x)
        {
            max=x;
        }
    }

    printf("%d",max);
    
    return 0;
}
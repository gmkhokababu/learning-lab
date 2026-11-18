//https://codeforces.com/group/MWSDmqGsZm/contest/223206/problem/B

//Author: Abu Hossain
//Create: 18/11/2026 09:11 AM Colombo Sri Lanka
//Last Edit: 18/11/2026 09:11 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int w;
    scanf("%d",&w);

    int slice=2;

    int temp=w-slice;
    if(w>2 && temp%2==0)
    {
        printf("YES");
        return 0;
    }
    
    printf("NO");
    
    
    return 0;
}
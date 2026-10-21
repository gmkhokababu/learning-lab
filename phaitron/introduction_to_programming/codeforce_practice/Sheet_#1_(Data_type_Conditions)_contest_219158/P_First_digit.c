//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/P

//Author: Abu Hossain
//Create: 22/10/2026 02:35 AM Colombo Sri Lanka
//Last Edit: 22/10/2026 02:35 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int x;
    scanf("%d",&x);
    x/=1000;
    if(x%2==0)
    {
        printf("EVEN");
    }
    else
    {
        printf("ODD");
    }
    
    
    return 0;
}
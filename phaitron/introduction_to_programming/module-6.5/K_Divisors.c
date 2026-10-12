// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/K

//Author: Abu Hossain
//Create: 13/10/2026 04:42 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    
    int x;
    scanf("%d",&x);
    for(int i=1;i<=x;i++)
    {
        if(x%i==0)
        {
            printf("%d\n",i);
        }
    }
    
    return 0;
}
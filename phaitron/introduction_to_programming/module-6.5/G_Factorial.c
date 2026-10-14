//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/G

//Author: Abu Hossain
//Create: 13/10/2026 06:30 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int x;
    scanf("%d",&x);
    for(int i=1;i<=x;i++)
    {
        long long int fac;
        scanf("%lld",&fac);
        long long int result=1;
        for(int j=1;j<=fac;j++)
        {
            result *=j;
        }
        printf("%lld\n",result);
    }
    
    
    return 0;
}
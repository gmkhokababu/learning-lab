//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/Q

//Author: Abu Hossain
//Create: 13/10/2026 02:56 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int x;
    scanf("%d",&x);
    for(int i=1;i<=x;i++)
    {
        long long int num;
        scanf("%lld",&num);
        do
        {
            printf("%d ",num%10);
            num/=10;
        }
        while(num!=0);
        printf("\n");
    }
    
    
    return 0;
}
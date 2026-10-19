//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/Y

//Author: Abu Hossain
//Create: 19/10/2026 04:38 AM Colombo Sri Lanka
//Last Edit: 19/10/2026 04:38 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int a=0;
    int b=1;
    int temp;
    for(int i=1;i<=n;i++)
    {
        printf("%d ",a);
        temp=a;
        a=b;
        b=temp+a;
    }
    
    
    return 0;
}
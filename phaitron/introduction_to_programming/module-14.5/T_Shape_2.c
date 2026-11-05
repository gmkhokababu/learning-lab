//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/T

//Author: Abu Hossain
//Create: 05/11/2026 11:47 AM Colombo Sri Lanka
//Last Edit: 05/11/2026 11:47 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int star=1;
    for(int i=1;i<=n;i++)
    {
        for(int k=1;k<=n-i;k++)
        {
            printf(" ");
        }
        for(int j=0;j<star;j++)
        {
            printf("*");
        }
        printf("\n");
        star+=2;
    }
    
    
    return 0;
}
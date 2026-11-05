//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/W


//Author: Abu Hossain
//Create: 05/11/2026 12:05 PM Colombo Sri Lanka
//Last Edit: 05/11/2026 12:05 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int star=1;
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=n-i;j++)
        {
            printf(" ");
        }
        for(int k=0;k<star;k++)
        {
            printf("*");
        }
        printf("\n");
        star+=2;
    }
    
    for(int i=1;i<=n;i++)
    {
        star -= 2;
        for(int j=1;j<i;j++)
        {
            printf(" ");
        }
        for(int k=0;k<star;k++)
        {
            printf("*");
        }
        printf("\n");
        
    }
    
    
    return 0;
}
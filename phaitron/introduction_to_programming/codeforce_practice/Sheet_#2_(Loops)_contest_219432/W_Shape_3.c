// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/W

//Author: Abu Hossain
//Create: 19/10/2026 01:36 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    for(int i=1;i<=n;i++)
    {
        for(int j=n-i;j>0;j--)
        {
            printf(" ");
        }
        for(int k=1;k<i*2;k++)
        {
            printf("%c",'*');
        }
        printf("\n");
    }
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<i;j++)
        {
            printf(" ");
        }
        int s=(n-i)*2;
        for(int k=s+1;k>0;k--)
        {
            printf("%c",'*');
        }
        printf("\n");

    }
    
    
    return 0;
}
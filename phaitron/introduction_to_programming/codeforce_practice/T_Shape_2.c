// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/T

//Author: Abu Hossain
//Create: 19/10/2026 12:47 AM Colombo Sri Lanka

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
    
    
    return 0;
}
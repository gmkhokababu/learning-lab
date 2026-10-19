// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/N

//Author: Abu Hossain
//Create: 18/10/2026 06:54 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    char ch;
    int n, t;
    scanf("%c\n%d",&ch,&n);
    for(int i=1;i<=n;i++)
    {
        scanf("%d",&t);
        for (int j=1;j<=t;j++)
        {
            printf("%c",ch);
        }
        printf("\n");
    }
    
    
    return 0;
}
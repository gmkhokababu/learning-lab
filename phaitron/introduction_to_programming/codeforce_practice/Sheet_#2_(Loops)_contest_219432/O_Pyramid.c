// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/O

//Author: Abu Hossain
//Create: 18/10/2026 07:30 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    for(int i=1;i<=n;i++)
    {
        for(int j=1;j<=i;j++)
        {
            printf("%c",'*');
        }
        printf("\n");
    }
    
    
    return 0;
}
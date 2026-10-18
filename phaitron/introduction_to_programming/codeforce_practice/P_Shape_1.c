// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/P

//Author: Abu Hossain
//Create: 18/10/2026 11:21 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    for(int i=n;i>0;i--)
    {
        for(int j=1;j<=i;j++)
        {
            printf("%c",'*');
        }
        printf("\n");
    }
    
    
    return 0;
}
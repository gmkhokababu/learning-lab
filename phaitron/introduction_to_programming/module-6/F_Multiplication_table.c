// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/F

//Author: Abu Hossain
//Create: 12/10/2026 09:21 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    
    int x;
    scanf("%d",&x);

    for(int i=1;i<=12;i++)
    {
        printf("%d * %d = %d\n",x,i,i*x);
    }
    
    return 0;
}
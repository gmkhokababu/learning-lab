//https://codeforces.com/group/MWSDmqGsZm/contest/223205/problem/B

//Author: Abu Hossain
//Create: 05/11/2026 08:13 AM Colombo Sri Lanka
//Last Edit: 05/11/2026 08:13 AM Colombo Sri Lanka

#include <stdio.h>
void print(int x)
{
    for(int i=1;i<=x;i++)
    {
        printf("%d",i);
        if(i!=x)
        {
            printf(" ");
        }
    }
}

int main()
{
    int n;
    scanf("%d",&n);
    print(n);
    
    
    return 0;
}
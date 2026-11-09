// https://codeforces.com/group/MWSDmqGsZm/contest/223339/problem/B

//Author: Abu Hossain
//Create: 08/11/2026 11:38 AM Colombo Sri Lanka
//Last Edit: 08/11/2026 11:38 AM Colombo Sri Lanka

#include <stdio.h>

void print_num(int n)
{
    if(n==0)
    {
        return;
    }
    print_num(n-1);
    printf("%d\n",n);
}

int main()
{
    int n;
    scanf("%d",&n);

    print_num(n);
    
    return 0;
}
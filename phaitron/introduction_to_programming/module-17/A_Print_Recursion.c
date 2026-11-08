// https://codeforces.com/group/MWSDmqGsZm/contest/223339/problem/A

//Author: Abu Hossain
//Create: 08/11/2026 11:30 AM Colombo Sri Lanka
//Last Edit: 08/11/2026 11:30 AM Colombo Sri Lanka

#include <stdio.h>

void print_rec(int n)
{
    if(n==0)
    {
        return;
    }
    printf("I love Recursion\n");
    print_rec(n-1);
}

int main()
{
    int n;
    scanf("%d",&n);
    
    print_rec(n);
    
    return 0;
}
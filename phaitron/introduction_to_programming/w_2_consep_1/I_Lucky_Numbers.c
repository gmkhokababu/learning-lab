//https://codeforces.com/group/MWSDmqGsZm/contest/326175/problem/I

//Author: Abu Hossain
//Create: 12/10/2026 11:11 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    
    int n;
    scanf("%d",&n);
    int first=n/10;
    int last=n%10;

    if(last%first==0 || first%last==0)
    {
        printf("YES");
    }
    else
    {
        printf("NO");
    }

    
    return 0;
}
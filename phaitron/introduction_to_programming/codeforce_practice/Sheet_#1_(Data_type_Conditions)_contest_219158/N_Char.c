// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/N

//Author: Abu Hossain
//Create: 22/10/2026 01:07 AM Colombo Sri Lanka
//Last Edit: 22/10/2026 01:07 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    char x;
    scanf("%c",&x);

    if(x>='a' && x<='z')
    {
        x-=32;
    }
    else
    {
        x+=32;
    }

    printf("%c",x);
    
    
    return 0;
}
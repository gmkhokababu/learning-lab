//https://codeforces.com/group/MWSDmqGsZm/contest/219856/problem/B

//Author: Abu Hossain
//Create: 26/10/2026 03:22 AM Colombo Sri Lanka
//Last Edit: 26/10/2026 03:22 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    char s[1000001];
    fgets(s,1000001,stdin);
    for(int i=0; s[i]!='\\';i++)
    {
        printf("%c",s[i]);
    }
    
    
    return 0;
}
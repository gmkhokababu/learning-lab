// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/M

//Author: Abu Hossain
//Create: 22/10/2026 12:04 AM Colombo Sri Lanka
//Last Edit: 22/10/2026 12:04 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    char x;
    scanf("%c",&x);
    if(x>='A' && x<='Z')
    {
        printf("ALPHA\nIS CAPITAL");
    }
    else if(x>='a' && x<='z')
    {
        printf("ALPHA\nIS SMALL");
    }
    else
    {
        printf("IS DIGIT");
    }
    
    
    return 0;
}
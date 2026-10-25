// https://codeforces.com/group/MWSDmqGsZm/contest/219856/problem/E

//Author: Abu Hossain
//Create: 26/10/2026 03:33 AM Colombo Sri Lanka
//Last Edit: 26/10/2026 03:33 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    char s[1000001];
    scanf("%s",s);
    int result = 0;
    for(int i=0;i<strlen(s);i++)
    {
        result += s[i]-'0';
        // printf("%d\n",result);

    }

    printf("%d",result);
    
    
    return 0;
}
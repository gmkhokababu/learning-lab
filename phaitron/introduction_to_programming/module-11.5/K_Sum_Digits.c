//https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/K

//Author: Abu Hossain
//Create: 29/10/2026 08:51 AM Colombo Sri Lanka
//Last Edit: 29/10/2026 08:51 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    int n;
    scanf("%d",&n);
    char s[n+5];
    scanf("%s",s);
    int val='0';
    int sum=0;

    for(int i=0;i<strlen(s);i++)
    {
        sum+= s[i]-val;
        // printf("%c\n",s[i]);
    }

    printf("%d",sum);
    
    
    return 0;
}
//https://codeforces.com/group/MWSDmqGsZm/contest/219856/problem/J

//Author: Abu Hossain
//Create: 29/10/2026 09:06 AM Colombo Sri Lanka
//Last Edit: 29/10/2026 09:06 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

    char s[10000001];

int main()
{
    scanf("%s",s);

    int val = 'a';
    int free[26]={0};
    int len = strlen(s);

    for(int i=0;i<len;i++)
    {
        int ind=s[i]-val;
        free[ind]++;
    }

    for(int i=0;i<26;i++)
    {
        if(free[i]>0)
        {
            printf("%c : %d\n",i+val,free[i]);
        }
    }
    
    return 0;
}
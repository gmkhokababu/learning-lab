//https://codeforces.com/group/MWSDmqGsZm/contest/219856/problem/K

//Author: Abu Hossain
//Create: 29/10/2026 11:37 AM Colombo Sri Lanka
//Last Edit: 29/10/2026 11:37 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    int n;
    scanf("%d",&n);
    char s[55],t[55];
    for(int i=0;i<n;i++)
    {
        scanf("%s %s",s,t);
        int len_s=strlen(s),len_t=strlen(t);
        int i;
        for(i=0;i<len_s && i<len_t;i++)
        {
           
            printf("%c%c",s[i],t[i]);
            
        }
        if(i<len_s)
        {
            for(;i<len_s;i++)
            {
                printf("%c",s[i]);
            }
        }
        if(i<len_t)
        {
            for(;i<len_t;i++)
            {
                printf("%c",t[i]);
            }
        }
        printf("\n");

    }
    
    
    return 0;
}
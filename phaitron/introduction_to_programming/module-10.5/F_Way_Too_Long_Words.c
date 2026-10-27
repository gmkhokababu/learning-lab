//https://codeforces.com/group/MWSDmqGsZm/contest/219856/problem/F

//Author: Abu Hossain
//Create: 27/10/2026 09:54 AM Colombo Sri Lanka
//Last Edit: 27/10/2026 09:54 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    int n,lenth;
    char s[101];

    scanf("%d",&n);

    for(int i=0;i<n;i++)
    {
        scanf("%s",&s);
        lenth= strlen(s);
        // printf("%d\n",lenth);
        if(lenth>10)
        {
            printf("%c%d%c\n",s[0],lenth-2,s[lenth-1]);
        }
        else
        {
            printf("%s\n",s);
        }
    }
    
    
    return 0;
}
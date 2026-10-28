//https://codeforces.com/group/MWSDmqGsZm/contest/219856/problem/I

//Author: Abu Hossain
//Create: 27/10/2026 05:08 PM Colombo Sri Lanka
//Last Edit: 27/10/2026 05:08 PM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    char s[1005];
    scanf("%s",s);

    int len=strlen(s);
    for(int i=0;i<len/2;i++)
    {
        if(s[i]!=s[len-1-i])
        {
            printf("NO");
            return 0;
        }
    }
    printf("YES");

    
    
    return 0;
}
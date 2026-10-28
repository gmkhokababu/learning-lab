//Author: Abu Hossain
//Create: 28/10/2026 06:12 PM Colombo Sri Lanka
//Last Edit: 28/10/2026 06:12 PM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    char s[1001], st[1001];
    scanf("%s %s",s,st);
    // int len=strlen(st);
    // for(int i=0;i<=len;i++)
    // {
    //     s[i]=st[i];
    // }
    strcpy(s,st);
    printf("%s %s",s,st);
    
    
    return 0;
}
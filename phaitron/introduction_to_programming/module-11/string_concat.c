//Author: Abu Hossain
//Create: 28/10/2026 06:35 PM Colombo Sri Lanka
//Last Edit: 28/10/2026 06:35 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    char s[101], st[101];
    scanf("%s %s",s,st);
    // int len=strlen(s);
    // for(int i=0;i<=strlen(st);i++)
    // {
    //     s[i+len]=st[i];
    // }
    strcat(s,st);
    printf("%s %s",s,st);
    
    
    return 0;
}
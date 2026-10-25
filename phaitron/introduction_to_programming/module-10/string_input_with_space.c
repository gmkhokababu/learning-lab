//Author: Abu Hossain
//Create: 26/10/2026 02:23 AM Colombo Sri Lanka
//Last Edit: 26/10/2026 02:23 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    char s[50];
    // gets(s);  //basic format for get input string
    fgets(s,25,stdin); //standerd format for get input string
    // scanf("%s",&s);
    printf("%s",s);
    
    
    return 0;
}
//Question: Write a function named my_len() which receives a string as a parameter and then counts the length of that string and returns that count. Don’t use strlen() function to get the length of the string. After receiving that count in the main function print it.
//Note: The string will not have any spaces.


//Author: Abu Hossain
//Create: 05/11/2026 09:12 AM Colombo Sri Lanka
//Last Edit: 05/11/2026 09:12 AM Colombo Sri Lanka

#include <stdio.h>

int my_len(char s[])
{
    int i=0;
    while(s[i]!='\0')
    {
        
        i++;
    }
    return i;
}

int main()
{
    char s[1005];
    scanf("%s",s);
    int len=my_len(s);

    printf("%d",len);
    
    
    return 0;
}
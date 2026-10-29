//https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-programming-a-batch-10/challenges/count-me-2-2/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 30/10/2026 05:07 AM Colombo Sri Lanka
//Last Edit: 30/10/2026 05:07 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>


int main()
{
    char s[100005];
    scanf("%s",s);

    int len=strlen(s);
    int count=0;
    for(int i=0;i<len;i++)
    {
        if(s[i]!='a' && s[i]!='e' && s[i]!='i' && s[i]!='o' && s[i]!='u')
        {
            count++;
        }
    }
    
    printf("%d",count);
    
    return 0;
}
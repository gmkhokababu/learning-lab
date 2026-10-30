//https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-programming-a-batch-10/challenges/count-me-4/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 30/10/2026 06:20 AM Colombo Sri Lanka
//Last Edit: 30/10/2026 06:20 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    char s[10005];
    scanf("%s",s);

    int count[26]={0};
    int len=strlen(s);
    
    for(int i=0;i<len;i++)
    {
        int ind = s[i]-'a';
        count[ind]++;
    }

    for(int i=0;i<26;i++){
        if(count[i]>0){
            printf("%c - %d\n",i+'a',count[i]);
        }
    }
    
    return 0;
}
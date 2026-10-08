//Hacker Rank Link: https://www.hackerrank.com/challenges/playing-with-characters/problem?isFullScreen=true

//Author: Abu Hossain
//Creat: 08/10/2026 04:14 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

int main() 
{

    char ch;
    char s[200];
    char sen[500];
      scanf("%c\n%[^\n]%*c\n%[^\n]*c\n",&ch,&s,&sen);
      printf("%c\n%s\n%s",ch,s,sen);
    return 0;
}
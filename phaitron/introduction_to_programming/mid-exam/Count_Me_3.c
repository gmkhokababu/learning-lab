//https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-programming-a-batch-10/challenges/count-me-3/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 30/10/2026 05:36 AM Colombo Sri Lanka
//Last Edit: 30/10/2026 05:36 AM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    int t;
    scanf("%d",&t);
    for(int i=0;i<t;i++)
    {
        char s[10005];
        scanf("%s",s);
        int count_small=0,count_cap=0,count_num=0,len=strlen(s);
        for(int j=0;j<len;j++)
        {
            if(s[j]>='a' && s[j]<='z')
            {
                count_small++;
            }
            else if(s[j]>='A' && s[j]<='Z')
            {
                count_cap++;
            }
            if(s[j]>='0' && s[j]<='9')
            {
                count_num++;
            }
        }

        printf("%d %d %d\n",count_cap,count_small,count_num);
        

    }
    
    
    return 0;
}
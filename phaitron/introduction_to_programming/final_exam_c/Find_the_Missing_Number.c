// https://www.hackerrank.com/contests/final-exam-a-introduction-to-c-programming-a-cc-10/challenges/find-the-missing-number-11-3/problem?isFullScreen=true


//Author: Abu Hossain
//Create: 13/11/2026 09:05 PM Colombo Sri Lanka
//Last Edit: 13/11/2026 09:05 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int t;
    long long int m,a,b,c;
    scanf("%d",&t);
    for(int i=0;i<t;i++)
    {
        scanf("%lld %lld %lld %lld",&m,&a,&b,&c);
        long long int mul=a*b*c;
        if(m%mul==0)
        {
            long long int missing=m/mul;
            printf("%lld\n",missing);
        }
        else
        {
            printf("%d\n",-1);
        }
    }
    
    
    return 0;
}
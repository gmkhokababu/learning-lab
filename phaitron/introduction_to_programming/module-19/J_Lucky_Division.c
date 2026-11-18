//https://codeforces.com/group/MWSDmqGsZm/contest/223206/problem/J

//Author: Abu Hossain
//Create: 18/11/2026 06:42 AM Colombo Sri Lanka
//Last Edit: 18/11/2026 06:42 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);

    int divisor[14]={4,7,44,47,74,77,444,447,474,477,744,747,774,777};

    for(int i=0;i<14;i++)
    {
        if(divisor[i]>n)
        {
            break;
        }

        if(n%divisor[i]==0)
        {

            printf("YES");
            return 0;
        }
    }

    printf("NO");

    return 0;
}
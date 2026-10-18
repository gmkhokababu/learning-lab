// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/R

//Author: Abu Hossain
//Create: 18/10/2026  Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n,m;
    while (scanf("%d %d",&n,&m) != EOF)
    {
        int sum=0;
        if(n<=0 || m<=0)
        {
            break;
        }
        if(n>m)
        {
            for(int i=m;i<=n;i++)
            {
                sum +=i;
                printf("%d ",i);
            }
            printf("sum =%d\n",sum);
        }
        else
        {
            for(int i=n;i<=m;i++)
            {
                sum +=i;
                printf("%d ",i);
            }
            printf("sum =%d\n",sum);
        }
    }
    
    
    
    return 0;
}
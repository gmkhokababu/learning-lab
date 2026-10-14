// https://codeforces.com/contest/2276/problem/A

//Author: Abu Hossain
//Create: 14/10/2026 08:18 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int t;
    scanf("%d",&t);

    for(int i=0; i<t;i++)
    {
        int a;
        int b;
        scanf("%d %d",&a,&b);
        if(b>=a)
        {
            printf("%d\n",-1);
        }
        else
        {
            if(b<a-b)
            {
                printf("%d\n",b);
            }
            else
            {
                printf("%d\n",a-b);
            }
        }
    }

    
    
    
    return 0;
}


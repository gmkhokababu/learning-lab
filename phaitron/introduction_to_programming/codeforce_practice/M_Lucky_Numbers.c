// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/M

//Author: Abu Hossain
//Create: 16/10/2026 04:24 AM Colombo Sri Lanka
//Last Edit: 18/10/2026 06:39 PM Colombo Sri Lanka

#include <stdio.h>
#include <stdbool.h>

int main()
{
    int a,b;
    scanf("%d %d",&a,&b);
    int count=0;
    for(int i=a;i<=b;i++)
    {
        int temp=i;
        bool check=false;
        while(temp!=0)
        {
            if(temp%10==4 || temp%10==7)
            {
            // printf("IF\n");

                check=true;
            }
            else
            {
                check=false;
                break;
            }
            temp /=10;
        }
        if(check)
        {
            printf("%d ",i);
            count++;
        }
        
    }

    if(count==0)
    {
        printf("%d",-1);
    }
    
    
    return 0;
}
// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/M

//Author: Abu Hossain
//Create: 16/10/2026 04:24 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int a,b;
    scanf("%d %d",&a,&b);
    for(int i=a;i<=b;i++)
    {
        int temp=i;
        
        while(temp!=0)
        {
            if(temp%10!=4 || temp%10!=7)
            {
                continue;
            }
        }
    }
    
    
    return 0;
}
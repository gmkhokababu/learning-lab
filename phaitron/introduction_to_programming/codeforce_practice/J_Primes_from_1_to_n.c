//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/J

//Author: Abu Hossain
//Create: 16/10/2026 12:23 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d", &n);
    
    for(int i=2;i<=n;i++)
    {
        int count=0;

        for(int j=1;j<=i/2;j++){
            if(i%j==0)
            {
                count++;
            }
        }
        if(count<2)
        {
            printf("%d ",i);
        }
        
    }
    
    
    return 0;
}
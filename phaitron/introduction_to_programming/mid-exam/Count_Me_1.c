//https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-programming-a-batch-10/challenges/count-me-2-1/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 30/10/2026 05:00 AM Colombo Sri Lanka
//Last Edit: 30/10/2026 05:00 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int a[n];
    for(int i=0;i<n;i++){
        scanf("%d",&a[i]);
    }

    int count_2=0,count_3=0;

    for(int i=0;i<n;i++)
    {
        // scanf("%d",&a[i]);
        if(a[i]%2==0)
        {
            count_2++;
        }
        else if(a[i]%3==0)
        {
            count_3++;
        }
    }

    printf("%d %d",count_2,count_3);
    
    
    return 0;
}
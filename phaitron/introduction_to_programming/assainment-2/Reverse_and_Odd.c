// https://www.hackerrank.com/contests/assignment-02-a-introduction-to-c-programming-a-batch-10/challenges/reverse-and-odd/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 15/10/2026 10:25 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int a[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&a[i]);
    }

    for(int i=n-1;i>0;i--)
    {
        if(i%2!=0)
        {
            printf("%d ",a[i]);
        }
    }
    
    
    return 0;
}
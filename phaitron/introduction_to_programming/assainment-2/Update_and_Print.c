// https://www.hackerrank.com/contests/assignment-02-a-introduction-to-c-programming-a-batch-10/challenges/update-and-print/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 15/10/2026 10:44 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n,x,v;
    scanf("%d",&n);
    int a[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&a[i]);
    }
    scanf("%d %d",&x,&v);

    a[x]=v;

    for(int i=n-1;i>=0;i--)
    {
        printf("%d ",a[i]);
    }
    
    
    return 0;
}
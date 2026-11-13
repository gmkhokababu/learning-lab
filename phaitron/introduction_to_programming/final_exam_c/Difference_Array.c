//https://www.hackerrank.com/contests/final-exam-a-introduction-to-c-programming-a-cc-10/challenges/difference-array/problem?isFullScreen=true


//Author: Abu Hossain
//Create: 13/11/2026 10:36 PM Colombo Sri Lanka
//Last Edit: 13/11/2026 10:36 PM Colombo Sri Lanka

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int t;
    scanf("%d",&t);
    for(int i=0;i<t;i++)
    {
        int n;
        scanf("%d",&n);
        int a[n],b[n],c[n];
        for(int j=0;j<n;j++)
        {
            scanf("%d",&a[j]);
            b[j]=a[j];
        }
        for(int j=0;j<n;j++)
        {
            for(int k=j+1;k<n;k++)
            {
                if(b[j]>b[k])
                {
                    int temp=b[j];
                    b[j]=b[k];
                    b[k]=temp;
                }
            }
        }
        for(int j=0;j<n;j++)
        {
            c[j]=abs(a[j]-b[j]);
        }
        for(int j=0;j<n;j++)
        {
            printf("%d ",c[j]);
        }
        printf("\n");
        
    }
    
    
    return 0;
}
// https://www.hackerrank.com/contests/assignment-02-a-introduction-to-c-programming-a-batch-10/challenges/sum-sum-2/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 15/10/2026 10:35 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int v[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&v[i]);
    }
    int posSum=0;
    int negSum=0;
    for(int i=0;i<n;i++){
        if(v[i]>0)
        {
            posSum += v[i];
        }
        else
        {
            negSum += v[i];
        }
    }

    printf("%d %d",posSum,negSum);
    
    
    return 0;
}
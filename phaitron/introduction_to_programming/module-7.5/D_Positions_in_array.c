// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/D

//Author: Abu Hossain
//Create: 15/10/2026 01:56 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }

    for(int i=0;i<n;i++)
    {
        if(arr[i]<=10)
        {
            printf("A[%d] = %d\n",i,arr[i]);
        }
    }
    
    
    return 0;
}
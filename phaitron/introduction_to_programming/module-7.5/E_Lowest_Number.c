// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/E

//Author: Abu Hossain
//Create: 15/10/2026 02:16 AM Colombo Sri Lanka

#include <stdio.h>
#include <limits.h>

int main()
{
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }
    int index=0;
    int min=INT_MAX;
    for(int i=0;i<n;i++)
    {
        if(min>arr[i])
        {
            min=arr[i];
            index=i+1;
        }
    }
    
    printf("%d %d",min,index);
    
    return 0;
}
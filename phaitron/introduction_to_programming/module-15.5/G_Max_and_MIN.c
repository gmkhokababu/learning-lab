//https://codeforces.com/group/MWSDmqGsZm/contest/223205/problem/G


//Author: Abu Hossain
//Create: 05/11/2026 08:25 AM Colombo Sri Lanka
//Last Edit: 05/11/2026 08:25 AM Colombo Sri Lanka

#include <stdio.h>
#include <limits.h>


void min_max(int arr[], int n)
{

    int min=INT_MAX;
    int max=INT_MIN;
    for(int i=0;i<n;i++)
    {
        if(min>arr[i])
        {
            min=arr[i];
        }
        if(max<arr[i])
        {
            max=arr[i];
        }
        
    }
    printf("%d %d",min,max);
}

int main()
{
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }
    
    min_max(arr,n);
    
    return 0;
}
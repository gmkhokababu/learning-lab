//https://codeforces.com/group/MWSDmqGsZm/contest/223339/problem/K

//Author: Abu Hossain
//Create: 18/11/2026 09:12 PM Colombo Sri Lanka
//Last Edit: 18/11/2026 09:12 PM Colombo Sri Lanka

#include <stdio.h>
#include <limits.h>

int n,max=INT_MIN;

void find_max(int arr[],int i)
{
    if(i==n)
    {
        return;
    }
    if(max<arr[i])
    {
        max=arr[i];
    }
    find_max(arr,i+1);
}

int main()
{
    scanf("%d",&n);
    int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }
    find_max(arr,0);
    printf("%d",max);
    
    
    return 0;
}
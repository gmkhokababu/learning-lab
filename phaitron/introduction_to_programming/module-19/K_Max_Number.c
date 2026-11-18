//https://codeforces.com/group/MWSDmqGsZm/contest/223339/problem/K

//Author: Abu Hossain
//Create: 18/11/2026 06:11 AM Colombo Sri Lanka
//Last Edit: 18/11/2026 06:11 AM Colombo Sri Lanka

#include <stdio.h>
#include <limits.h>
int max=INT_MIN;
void find_max(int arr[],int i,int n)
{
    if(i==n)
    {
        return;
    }

    if(arr[i]>max)
    {
        max=arr[i];
    }
    find_max(arr,i+1,n);
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

    find_max(arr,0,n);

    printf("%d",max);
    
    return 0;
}
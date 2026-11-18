// https://codeforces.com/group/MWSDmqGsZm/contest/223339/problem/L


//Author: Abu Hossain
//Create: 18/11/2026 06:21 AM Colombo Sri Lanka
//Last Edit: 18/11/2026 06:21 AM Colombo Sri Lanka

#include <stdio.h>


long long int sum=0;

void summition(int arr[],int i,int n)
{
    if(i==n)
    {
        return;
    }
    sum+=arr[i];
    summition(arr,i+1,n);
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

    summition(arr,0,n);
    printf("%lld",sum);
    
    
    return 0;
}
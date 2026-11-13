//https://codeforces.com/group/MWSDmqGsZm/contest/223339/problem/L

//Author: Abu Hossain
//Create: 13/11/2026 01:53 PM Colombo Sri Lanka
//Last Edit: 13/11/2026 01:53 PM Colombo Sri Lanka

#include <stdio.h>
long long int addition(int arr[],int n)
{   
    long long int sum=0;
    if(n<=0)
    {
        return 0;
    }
    int val=arr[n-1];
    sum=val+addition(arr,n-1);

    return sum;
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

    long long int sum=addition(arr,n);

    printf("%lld",sum);
    
    
    return 0;
}
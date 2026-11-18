// https://codeforces.com/group/MWSDmqGsZm/contest/329103/problem/C


//Author: Abu Hossain
//Create: 18/11/2026 01:49 PM Colombo Sri Lanka
//Last Edit: 18/11/2026 03:25 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n,k;
    scanf("%d %d",&n,&k);
    int arr[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&arr[i]);
    }

    long long int sum=0;
    for(int i=0;i<n;i++)
    {
        int temp;
        for(int j=i+1;j<n;j++)
        {
            if(arr[i]<arr[j])
            {
                temp=arr[i];
                arr[i]=arr[j];
                arr[j]=temp;
            }
            
        }
    }

    for(int i=0;i<k;i++)
    {
        if(arr[i]>0)
        {
            sum+=arr[i];
        }
        
    }
    printf("%lld",sum);
    
    
    return 0;
}
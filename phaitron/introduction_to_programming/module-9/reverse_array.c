//Author: Abu Hossain
//Create: 25/10/2026 03:55 AM Colombo Sri Lanka
//Last Edit: 25/10/2026 03:55 AM Colombo Sri Lanka

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
    int temp;
    for(int i=0;i<n/2;i++)
    {
        temp=arr[i];
        arr[i]=arr[n-1-i];
        arr[n-1-i]=temp;
        
    }
    for(int i=0;i<n;i++)
    {
        printf("%d ",arr[i]);
    }
    
    
    return 0;
}
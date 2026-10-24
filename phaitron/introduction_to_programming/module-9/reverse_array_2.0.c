//Author: Abu Hossain
//Create: 25/10/2026 04:13 AM Colombo Sri Lanka
//Last Edit: 25/10/2026 04:13 AM Colombo Sri Lanka

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
    for(int i=0;i<n/2;i++)
    {
        int temp;
        for(int j=n-1;j>=n/2;j--)
        {
            temp=arr[i];
            arr[i]=arr[j];
            arr[j]=temp;
            i++;
        }
        break;
    }
    for(int i=0;i<n;i++)
    {
        printf("%d ",arr[i]);
    }
    
    
    return 0;
}
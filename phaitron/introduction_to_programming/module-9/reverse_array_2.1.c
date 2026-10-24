//Author: Abu Hossain
//Create: 25/10/2026 04:35 AM Colombo Sri Lanka
//Last Edit: 25/10/2026 04:35 AM Colombo Sri Lanka

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
    int i=0;
    int j=n-1;
    while(i<j)
    {
        int temp=arr[i];
        arr[i]=arr[j];
        arr[j]=temp;
        i++;
        j--;
        
    }
    for(int i=0;i<n;i++)
    {
        printf("%d ",arr[i]);
    }
    
    
    return 0;
}
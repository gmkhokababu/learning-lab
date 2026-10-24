//Author: Abu Hossain
//Create: 25/10/2026 02:18 AM Colombo Sri Lanka
//Last Edit: 25/10/2026 02:18 AM Colombo Sri Lanka

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
    int idx;
    scanf("%d",&idx);

    for(int i=idx;i<n-1;i++)
    {
        arr[i]=arr[i+1];
    }
    n--;
    for(int i=0;i<n;i++)
    {
        printf("%d ",arr[i]);
    }
    
    
    return 0;
}
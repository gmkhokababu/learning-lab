//Author: Abu Hossain
//Create: 19/10/2026 09:05 PM Colombo Sri Lanka
//Last Edit: 19/10/2026 09:05 PM Colombo Sri Lanka

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

    for(int i=0;i<n;i++)
    {
        int temp=0;
        for(int j=0;j<n-1;j++)
        {
            if(arr[j]<arr[j+1])
            {
                temp=arr[j];
                arr[j]=arr[j+1];
                arr[j+i]=temp;
            }
        }
    }

    printf("%d",arr[0]);
    
    
    return 0;
}
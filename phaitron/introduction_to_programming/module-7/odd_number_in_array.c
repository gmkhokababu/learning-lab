// Take an array from input and count how many odd numbers are present in that array.


//Author: Abu Hossain
//Create: 14/10/2026 02:37 AM Colombo Sri Lanka

#include <stdio.h>
#include <limits.h>

int main()
{
    
    int s;
    scanf("%d",&s);
    int arr[s];
    for(int i=0;i<s;i++)
    {
        scanf("%d",&arr[i]);
    }

    int count=0;

    for(int i=0;i<s;i++)
    {
        if(arr[i]%2!=0){
            count++;
        }
    }

    printf("Total Odd: %d\n",count);
    int max=INT_MIN;
    int min=INT_MAX;
    for(int i=0;i<s;i++)
    {
        if(arr[i]>max){
            max=arr[i];
        }
        if(arr[i]<min)
        {
            min=arr[i];
        }
    }

    printf("Maximum value: %d\n",max);
    printf("Minimum value: %d\n",min);

    
    return 0;
}
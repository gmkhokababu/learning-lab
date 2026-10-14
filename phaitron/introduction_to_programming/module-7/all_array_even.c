// Take an array from input and print all the even numbers of that array.

//Author: Abu Hossain
//Create: 14/10/2026 02:32 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    
    int s;
    scanf("%d",&s);
    int arr[s];
    for(int i=0;i<s;i++)
    {
        scanf("%d",&arr[i]);
    }
    
    for(int i=0;i<s;i++)
    {
        if(arr[i]%2==0)
        {
            printf("%d ",arr[i]);
        }
        
    }

    
    return 0;
}
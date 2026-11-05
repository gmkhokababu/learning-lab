//Question: Make a function named change_it() which receives an array of integers and the size of that integer. In the function you need to change the value of the last index of that array and assign 100 there. You don’t need to return anything. After that print the array in the main function and see if it is updated.


//Author: Abu Hossain
//Create: 05/11/2026 09:35 AM Colombo Sri Lanka
//Last Edit: 05/11/2026 09:35 AM Colombo Sri Lanka

#include <stdio.h>
void change_it(int arr[], int n)
{
    arr[n-1]=100;
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
    change_it(arr,n);
    for(int i=0;i<n;i++)
    {
        printf("%d ",arr[i]);
    }

    
    
    return 0;
}
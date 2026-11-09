//Author: Abu Hossain
//Create: 05/11/2026 11:43 PM Colombo Sri Lanka
//Last Edit: 05/11/2026 11:43 PM Colombo Sri Lanka

#include <stdio.h>
void odd_even()
{
    int n;
    scanf("%d",&n);
    int arr[n];
    for(int i=0; i<n;i++)
    {
        scanf("%d",&arr[i]);
    }
    int even=0;
    int odd=0;
    for(int i=0;i<n;i++)
    {
        if(arr[i]%2==0)
        {
            even++;
        }
        else
        {
            odd++;
        }
    }

    printf("%d %d",even,odd);
}

int main()
{
    
    odd_even();
    
    return 0;
}
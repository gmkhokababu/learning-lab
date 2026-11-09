//https://codeforces.com/group/MWSDmqGsZm/contest/223339/problem/F

//Author: Abu Hossain
//Create: 08/11/2026 01:44 PM Colombo Sri Lanka
//Last Edit: 08/11/2026 01:44 PM Colombo Sri Lanka

#include <stdio.h>

void print_arr(int arr[],int n,int i)
{
    if(i==n)
    {
        return;
    }
    print_arr(arr,n,i+1);
    if(i%2==0)
    {
        printf("%d ",arr[i]);
    }

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
    
    print_arr(arr,n,0);
    
    return 0;
}
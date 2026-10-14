// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/H

//Author: Abu Hossain
//Create: 15/10/2026 04:16 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    
    int n;
    scanf("%d",&n);
    int a[n];
    for(int i=0;i<n;i++)
    {
        scanf("%d",&a[i]);
    }
    //======================bubble sort======================
    for (int i=0;i<n;i++)
    {
        for(int j=0;j<n-1;j++)
        {
            int temp;
            if(a[j]>a[j+1])
            {
                temp=a[j];
                a[j]=a[j+1];
                a[j+1]=temp;
            }
        }
    }

    //===================selection sort===================
    // for(int i=0;i<n;i++)
    // {
    //     int index=i;
    //     for(int j=i;j<n;j++)
    //     {
    //         if(a[index]>a[j])
    //         {
    //             index = j;
    //         }
    //     }
    //     int temp=a[index];
    //     a[index]=a[i];
    //     a[i]=temp;
    // }




    for(int i=0;i<n;i++)
    {
        printf("%d ",a[i]);
    }
    return 0;
}
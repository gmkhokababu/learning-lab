// https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/W

//Author: Abu Hossain
//Create: 13/11/2026 06:13 PM Colombo Sri Lanka
//Last Edit: 13/11/2026 06:13 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int r,c;
    scanf("%d %d",&r,&c);
    int arr[r][c];
    for(int i=0;i<r;i++)
    {
        for(int j=0;j<c;j++)
        {
            scanf("%d",&arr[i][j]);
        }
    }

    for(int i=0;i<r;i++)
    {
        int temp;
        for(int j=0;j<c/2;j++)
        {
            temp=arr[i][j];
            arr[i][j]=arr[i][c-1-j];
            arr[i][c-1-j]=temp;
        }
    }

    for(int i=0;i<r;i++)
    {
        for(int j=0;j<c;j++)
        {
            printf("%d ",arr[i][j]);
        }
        printf("\n");
    }
    
    
    return 0;
}
//https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/S

//Author: Abu Hossain
//Create: 12/11/2026 07:30 AM Colombo Sri Lanka
//Last Edit: 12/11/2026 07:30 AM Colombo Sri Lanka

#include <stdio.h>
#include <stdbool.h>

int main()
{
    int n,m,x;
    scanf("%d %d",&n,&m);
    int arr[n][m];
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<m;j++)
        {
            scanf("%d",&arr[i][j]);
        }
    }

    scanf("%d",&x);

    bool not_found=true;
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<m;j++)
        {
            if(arr[i][j]==x)
            {
                printf("will not take number");
                not_found=false;
                break;
            }
        }
        if(!not_found)
        {
            break;
        }
        
    }

    if(not_found)
    {
        printf("will take number");
    }
    
    
    return 0;
}
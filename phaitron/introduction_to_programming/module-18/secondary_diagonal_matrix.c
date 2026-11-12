//Author: Abu Hossain
//Create: 11/11/2026 02:56 PM Colombo Sri Lanka
//Last Edit: 11/11/2026 02:56 PM Colombo Sri Lanka

#include <stdio.h>
#include <stdbool.h>

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
    
    if(r==c)
    {
        bool flag = true;
        for(int i=0;i<r;i++)
        {
            for(int j=0;j<c;j++)
            {
                if(i+j!=r-1)
                {
                    if(arr[i][j]!=0)
                    {
                        flag=false;
                        printf("Not Diagonal Matrix");
                        return 0;
                    }
                }
            }
        }
        if(flag)
        {
            printf("Diagonal Matrix");
        }
    }
    else
    {
        printf("Not Diagonal Matrix");
    }
    
    return 0;
}
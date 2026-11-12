//Author: Abu Hossain
//Create: 09/11/2026 09:36 PM Colombo Sri Lanka
//Last Edit: 09/11/2026 09:36 PM Colombo Sri Lanka

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
    
    // check null matrix

    bool flag = true;

    for(int i=0;i<r;i++)
    {
        for(int j=0;j<c;j++)
        {
            if(arr[i][j]!=0)
            {
                flag=false;
                break;
            }
        }
    }
    
    if(flag)
    {
        printf("Yes");
    }
    else
    {
        printf("No");
    }
    return 0;
}
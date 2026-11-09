//Author: Abu Hossain
//Create: 09/11/2026 09:36 PM Colombo Sri Lanka
//Last Edit: 09/11/2026 09:36 PM Colombo Sri Lanka

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
    
    
    return 0;
}
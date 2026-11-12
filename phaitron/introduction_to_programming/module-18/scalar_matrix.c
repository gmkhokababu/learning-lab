//Author: Abu Hossain
//Create: 12/11/2026 09:00 AM Colombo Sri Lanka
//Last Edit: 12/11/2026 09:00 AM Colombo Sri Lanka

#include <stdio.h>
#include <stdbool.h>

int main()
{
    int r,c;
    scanf("%d %d",&r,&c);

    int matrix[r][c];
    for(int i=0;i<r;i++)
    {
        for(int j=0;j<c;j++)
        {
            scanf("%d",&matrix[i][j]);
        }
    }

    if(r==c)
    {
        bool scalar=true;
        int check=matrix[0][0];
        for(int i=0;i<r;i++)
        {
            for(int j=0;j<c;j++)
            {
                if(i==j)
                {
                    if(check!=matrix[i][j])
                    {
                        scalar=false;
                        break;
                    }
                }
                else
                {
                    if(matrix[i][j]!=0)
                    {
                        scalar=false;
                        break;
                    }
                }
            }
            if(!scalar)
            {
                printf("NO");
                break;
            }
        }
        if(scalar)
        {
            printf("YES");
        }
    }
    else
    {
        printf("NO");
    }
    
    
    return 0;
}
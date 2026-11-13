//https://www.hackerrank.com/contests/final-exam-a-introduction-to-c-programming-a-cc-10/challenges/jadu-matrix/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 13/11/2026 09:36 PM Colombo Sri Lanka
//Last Edit: 13/11/2026 09:36 PM Colombo Sri Lanka

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
        bool magic=true;
        for(int i=0;i<r;i++)
        {
            for(int j=0;j<c;j++)
            {
                if(i==j || i+j==r-1)
                {
                    if(arr[i][j]!=1)
                    {
                        magic=false;
                        break;
                    }
                }
                else
                {
                    if(arr[i][j]!=0)
                    {
                        magic=false;
                        break;
                    }
                }
            }

            if(!magic)
            {
                break;
            }
        }
        if(magic)
        {
            printf("YES");
        }
        else
        {
            printf("NO");
        }
    }
    else
    {
        printf("NO");
    }
    
    
    return 0;
}
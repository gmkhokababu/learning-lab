// https://www.hackerrank.com/contests/final-exam-a-introduction-to-c-programming-a-cc-10/challenges/matrix-38/problem?isFullScreen=true


//Author: Abu Hossain
//Create: 13/11/2026 09:52 PM Colombo Sri Lanka
//Last Edit: 13/11/2026 09:52 PM Colombo Sri Lanka

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
    for(int i=0;i<c;i++)          //print row
    {
        printf("%d ",arr[r-1][i]);
    }

    printf("\n");

    for(int i=0;i<r;i++)              // print col
    {
        printf("%d ",arr[i][c-1]);
    }
    
    
    return 0;
}
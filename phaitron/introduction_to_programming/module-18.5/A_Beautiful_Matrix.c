//https://codeforces.com/problemset/problem/263/A

//Author: Abu Hossain
//Create: 13/11/2026 01:39 PM Colombo Sri Lanka
//Last Edit: 13/11/2026 01:39 PM Colombo Sri Lanka

#include <stdio.h>
#include <stdlib.h>

int main()
{
    int arr[5][5];
    int col_pos,row_pos;
    for(int i=0;i<5;i++)
    {
        for(int j=0;j<5;j++)
        {
            scanf("%d",&arr[i][j]);
            if(arr[i][j]==1)
            {
                row_pos=i;
                col_pos=j;
            }

        }
    }
    row_pos++;
    col_pos++;

    int move=0;
    move += abs(row_pos-3);
    move += abs(col_pos-3);

    printf("%d",move);
    
    
    return 0;
}
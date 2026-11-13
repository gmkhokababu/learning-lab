//https://www.hackerrank.com/contests/final-exam-a-introduction-to-c-programming-a-cc-10/challenges/magical-tree-3/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 13/11/2026 10:07 PM Colombo Sri Lanka
//Last Edit: 13/11/2026 10:07 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int leap=5,n;
    scanf("%d",&n);
    leap+=((n/2)+1);

    int star=1;

    for(int i=0;i<leap;i++)        //line
    {
        int space=leap-i-1;
        for(int j=0;j<space;j++)          //leap space
        {
            printf(" ");
        }
        for(int k=0;k<star;k++)
        {
            printf("*");
        }
        star +=2;
        printf("\n");
    }

    for(int i=0;i<5;i++)         //line
    {
        for(int j=0;j<5;j++)     //space
        {
            printf(" ");
        }
        for(int k=0;k<n;k++)      //star print
        {
            printf("*");
        }
        printf("\n");
    }
    
    return 0;
}
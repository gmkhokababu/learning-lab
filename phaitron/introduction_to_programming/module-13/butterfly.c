// output:
// *      *
// **    **
// ***  ***
// ********
// ********
// ***  ***
// **    **
// *      *

//Author: Abu Hossain
//Create: 01/11/2026 08:37 AM Colombo Sri Lanka
//Last Edit: 01/11/2026 08:37 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    int star=1;
    int space=n-1;

    for(int i=0;i<n;i++)  //butterfly top
    {
        for(int j=0;j<star;j++)  //first *
        {
            printf("*");
        }
        for(int j=0;j<space;j++) //first space
        {
            printf(" ");
        }
        for(int j=0;j<space;j++) //second space
        {
            printf(" ");
        }
        for(int j=0;j<star;j++)  //last *
        {
            printf("*");
        }
        printf("\n");
        star++;
        space--;
    }
    star--;
    space++;

    for(int i=0;i<n;i++)  //bottom
    {
        for(int j=0;j<star;j++)  //first *
        {
            printf("*");
        }
        for(int j=0;j<space;j++) //first space
        {
            printf(" ");
        }
        for(int j=0;j<space;j++) //second space
        {
            printf(" ");
        }
        for(int j=0;j<star;j++)  //last *
        {
            printf("*");
        }
        printf("\n");
        star--;
        space++;
    }
    
    
    return 0;
}
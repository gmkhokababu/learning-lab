// K. Max and Min
// time limit per test0.25 seconds
// memory limit per test64 megabytes
// Given 3 numbers A, B and C, Print the minimum and the maximum numbers.

// Input
// Only one line containing 3 numbers A, B and C ( - 105 ≤ A, B, C ≤ 105)

// Output
// Print the minimum number followed by a single space then print the maximum number.

// Examples
// InputCopy
// 1 2 3
// OutputCopy
// 1 3
// InputCopy
// -1 -2 -3
// OutputCopy
// -3 -1
// InputCopy
// 10 20 -5
// OutputCopy
// -5 20

//Author: Abu Hossain
//Create: 11/10/2026 03:37 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{

    int a;
    int b;
    int c;

    scanf("%d %d %d",&a,&b,&c);

    int temp;
    for(int i=0;i<3;i++)
    {
        if(a>b)
        {
            temp=a;
            a=b;
            b=temp;
        }
        if(b>c)
        {
            temp=b;
            b=c;
            c=temp;
        }
    }

    printf("%d %d",a,c);

    return 0;
}
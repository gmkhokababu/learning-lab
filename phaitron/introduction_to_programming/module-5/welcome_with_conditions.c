// I. Welcome for you with Conditions
// time limit per test1 second
// memory limit per test64 megabytes
// Given two numbers A and B. Print "Yes" if A is greater than or equal to B. Otherwise print "No".

// Input
// Only one line containing two numbers A and B (0  ≤  A, B  ≤  100).

// Output
// Print "Yes" or "No" according to the statement.

// Examples
// Input
// 10 9
// Output
// Yes
// Input
// 5 5
// Output
// Yes
// Input
// 5 7
// Output
// No

// Author: Abu Hossain
// Create: 10/10/2026 11:54 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{

    int a;
    int b;
    scanf("%d %d",&a,&b);
    if (a >= b)
    {
        printf("Yes");
    }
    else
    {
        printf("No");
    }

    return 0;
}
// Write a C program that takes a year as input from the user and checks whether it is a leap year or not using nested if-else conditions.

// Author: Abu Hossain
// Create: 05/10/2026 04:30 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{

    int year;
    scanf("%d", &year);

    if (year % 4 == 0)
    {

        if (year % 100 == 0)
        {
            if (year % 400==0)
            {
                printf("%d is a leap year!",year);
            }
            else
            {
                printf("%d is not a leap year!",year);
            }
        }
        else
        {
            printf("%d is a leap year!",year);
        }
    }
    else
    {
        printf("%d is not a leap year!",year);
    }

    return 0;
}
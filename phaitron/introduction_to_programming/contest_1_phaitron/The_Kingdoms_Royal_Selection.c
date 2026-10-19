// Author: Abu Hossain
// Create: 19/10/2026 9:25 PM Colombo Sri Lanka
// Last Edit: 19/10/2026 9:25 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int status = 1;
    int a, i, p, e;
    scanf("%d", &a);
    if (a < 1 || a > 100)
    {
        status = 0;
    }
    scanf("%d", &i);
    if (i < 0 || i > 100)
    {
        status = 0;
    }
    scanf("%d", &p);
    if (p < 0 || p > 100)
    {
        status = 0;
    }
    scanf("%d", &e);
    if (e < 0 || e > 50)
    {
        status = 0;
    }

    if (status == 1)
    {

        if (a >= 21 && a <= 35 && i >= 80 && p >= 70 && e >= 2)
        {
            printf("Selected");
        }
        else if (a >= 30 && a <= 35 && i >= 95 && p >= 90)
        {
            printf("Selected");
        }
        else
        {
            printf("Rejected");
        }
    }
    else
    {
        printf("Rejected");
    }

    return 0;
}
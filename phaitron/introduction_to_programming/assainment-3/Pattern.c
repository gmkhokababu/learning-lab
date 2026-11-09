// Author: Abu Hossain
// Create: 05/11/2026 10:07 PM Colombo Sri Lanka
// Last Edit: 05/11/2026 10:07 PM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d", &n);
    int p = 1;
    int i=1;
    while (i <= n)
    {
        for (int j = 0; j < n - i; j++)
        {
            printf(" ");
        }
        if (i % 2 == 0)
        {
            for (int k = 0; k < p; k++)
            {
                printf("-");
            }
        }
        else
        {
            for (int k = 0; k < p; k++)
            {
                printf("#");
            }
        }
        printf("\n");
        p += 2;
        i++;
    }

    p -= 2;
    int down=n*2-1;
    int space=1;

    while (i <=down)
    {
        p -= 2;
        for (int j = 0; j < space; j++)
        {
            printf(" ");
        }
        if (i % 2 == 0)
        {
            for (int k = 0; k < p; k++)
            {
                printf("-");
            }
        }
        else
        {
            for (int k = 0; k < p; k++)
            {
                printf("#");
            }
        }
        printf("\n");
        i++;
        space++;
    }

    return 0;
}
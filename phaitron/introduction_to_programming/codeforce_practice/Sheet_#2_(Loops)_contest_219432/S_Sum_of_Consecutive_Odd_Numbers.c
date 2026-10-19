// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/S

// Author: Abu Hossain
// Create: 19/10/2026 12:20 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int t, x, y;
    scanf("%d", &t);
    for (int i = 1; i <= t; i++)
    {
        scanf("%d %d", &x, &y);
        int sum = 0;
        if (x < y)
        {
            for (int j = x + 1; j < y; j++)
            {
                if (j % 2 != 0)
                {
                    sum += j;
                }
            }
            printf("%d\n", sum);
        }
        else
        {
            for (int j = y + 1; j < x; j++)
            {
                if (j % 2 != 0)
                {
                    sum += j;
                }
            }
            printf("%d\n", sum);
        }
    }

    return 0;
}
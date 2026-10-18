// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/X

// Author: Abu Hossain
// Create: 19/10/2026 02:37 AM Colombo Sri Lanka
// Last Edit: 19/10/2026 04:35 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int t, n;
    scanf("%d", &t);
    for (int i = 1; i <= t; i++)
    {
        scanf("%d", &n);
        int b = 0;
        int count = 1;
        while (n != 0)
        {
            if (n % 2 != 0)
            {

                count *= 2;
            }

            n /= 2;
        }
        printf("%d\n", count - 1);
    }
    return 0;
}
// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/Z

// Author: Abu Hossain
// Create: 19/10/2026 10:43 PM Colombo Sri Lanka
// Last Edit: 19/10/2026 02:43 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int k, s;
    scanf("%d %d", &k, &s);

    int count = 0;
    for (int x = 0; x <= s && x<=k; x++)
    {
        for (int y = 0; y <= k && (x+y)<=s; y++)
        {
            int z = s - x - y;
            if (z<= k)
            {
                count++;
            }
        }
    }

    printf("%d", count);

    return 0;
}
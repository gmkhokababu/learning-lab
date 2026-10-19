// https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/V

// Author: Abu Hossain
// Create: 19/10/2026 01:21 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d", &n);
    int count = 1;
    for (int i = 1; i <= n; i++)
    {
        for (int i = 1; i < 4; i++)
        {
            printf("%d ", count);
            count++;
        }
        printf("PUM\n");
        count++;
    }

    return 0;
}
// https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-programming-a-batch-10/challenges/farmers-1/problem?isFullScreen=true

// Author: Abu Hossain
// Create: 30/10/2026 06:38 AM Colombo Sri Lanka
// Last Edit: 30/10/2026 06:38 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int t;
    scanf("%d", &t);
    int m1, m2, d;
    for (int i = 0; i < t; i++)
    {
        scanf("%d %d %d", &m1, &m2, &d);
        int work = m1 * d;
        int total_worker = m1 + m2;
        int work_finish = work / total_worker;
        int day_need = d - work_finish;
        printf("%d\n", day_need);
    }

    return 0;
}
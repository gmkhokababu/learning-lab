// https://codeforces.com/group/MWSDmqGsZm/contest/223205/problem/M

// Author: Abu Hossain
// Create: 03/11/2026 12:01 PM Colombo Sri Lanka
// Last Edit: 03/11/2026 12:01 PM Colombo Sri Lanka

#include <stdio.h>
#include <stdbool.h>

int distinct(int x)
{
    if(x==0)
    {
        return 0;
    }
    int arr[x];
    for (int i = 0; i < x; i++)
    {
        scanf("%d", &arr[i]);
    }
    int count = 1;
    for (int i = 1; i < x; i++)
    {

        bool flag = true;
        for (int j = i - 1; j >= 0; j--)
        {
            if (arr[i] == arr[j])
            {
                flag = false;
                break;
            }
        }

        if (flag)
        {
            count++;
        }
    }

    return count;
}

int main()
{
    int x;
    scanf("%d", &x);

    int count = distinct(x);
    printf("%d", count);

    return 0;
}
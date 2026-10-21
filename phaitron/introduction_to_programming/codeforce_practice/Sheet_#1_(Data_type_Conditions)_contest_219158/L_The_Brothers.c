// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/L

// Author: Abu Hossain
// Create: 21/10/2026 11:43 PM Colombo Sri Lanka
// Last Edit: 21/10/2026 11:43 PM Colombo Sri Lanka

#include <stdio.h>
#include <string.h>

int main()
{
    char first_first[100005], first_last[100005], second_first[100005], second_last[100005];
    scanf("%s %s %s %s", first_first, first_last, second_first, second_last);
    int lenth1 = strlen(first_last);
    int lenth2 = strlen(second_last);

    // printf("%c",first_last[0]);

    if (lenth1 == lenth2)
    {
        for(int i=0;i<=lenth1;i++)
        {
            if(first_last[i]!=second_last[i])
            {
                printf("NOT");
                return 0;
            }
            // printf("%d\n",i);
        }
        printf("ARE Brothers");
    }
    else
    {
        printf("NOT");
    }
    // printf("ARE Brothers");

    return 0;
}
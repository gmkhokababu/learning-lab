//=================================Question====================================
// Divisible By 5 or Not
// Time Limit: 1 Seconds

// Memory Limit: 2.93 MB

// Statement
// You will be given a positive integer N, you need to print from 1 to N and besides the value, print Yes or No Print Yes if the value is divisible by 5 and print No otherwise.

// Constraints
// 1 <= N <= 1000

// Input format
// Input will contain a positive integer N.

// Output Format
// - Output as mentioned in the question. See the sample input output for more clarifications. Put a new line after every line.

// Sample Input 1
// 10
// Sample Output 1
// 1 No
// 2 No
// 3 No
// 4 No
// 5 Yes
// 6 No
// 7 No
// 8 No
// 9 No
// 10 Yes
//=================================================================================

//Author: Abu Hossain
//Create: 06/10/2026 12:55 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int n;
    scanf("%d",&n);
    for(int i=1; i<=n;)
    {
        if(i%5==0)
        {
            printf("%d Yes\n",i);
        }
        else
        {
            printf("%d No\n",i);
        }
        i++;
    }
    return 0;
}
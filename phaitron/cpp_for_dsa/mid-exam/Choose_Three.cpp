// https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-for-dsa-a-10/challenges/choose-three/problem?isFullScreen=true

// Author: Abu Hossain
// Create: 28/11/2026 09:20 AM Colombo Sri Lanka
// Last Edit: 28/11/2026 09:20 AM Colombo Sri Lanka

#include <bits/stdc++.h>

using namespace std;

int main()
{
    int t;
    cin >> t;
    for (int k = 0; k < t; k++)
    {
        int n, s;
        cin >> n >> s;
        int arr[n];
        for (int i = 0; i < n; i++)
        {
            cin >> arr[i];
        }

        bool possible = false;
        int ind = 0;

        if (n >= 3)
        {
            while (ind < n - 2)
            {
                for (int i = ind + 1; i < n - 1; i++)
                {
                    for (int j = i + 1; j < n; j++)
                    {
                        int sum = arr[ind] + arr[i] + arr[j];
                        if (sum == s)
                        {
                            possible = true;
                            break;
                        }
                    }
                    if (possible)
                    {
                        break;
                    }
                }
                if (possible)
                {
                    break;
                }
                ind++;
            }
        }

        if (possible)
        {
            cout << "YES" << endl;
        }
        else
        {
            cout << "NO" << endl;
        }
    }

    return 0;
}
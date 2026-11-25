//https://codeforces.com/group/MWSDmqGsZm/contest/219432/problem/E

//Author: Abu Hossain
//Create: 25/11/2026 06:51 AM Colombo Sri Lanka
//Last Edit: 25/11/2026 06:51 AM Colombo Sri Lanka

#include <bits/stdc++.h>


using namespace std;

int main()
{
    int n;
    cin >> n;
    int arr[n];

    for(int i=0;i<n;i++)
    {
        cin  >> arr[i];
    }

    int max=INT_MIN;

    for(int i=0;i<n;i++)
    {
        max=max(max,arr[i]);
    }

    cout << max;
    
    
    return 0;
}
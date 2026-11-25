//https://codeforces.com/group/MWSDmqGsZm/contest/219774/problem/F

//Author: Abu Hossain
//Create: 25/11/2026 06:37 AM Colombo Sri Lanka
//Last Edit: 25/11/2026 06:37 AM Colombo Sri Lanka

#include <bits/stdc++.h>


using namespace std;

int main()
{
    int n;
    cin >>n;
    int arr[n];
    for(int i=0;i<n;i++)
    {
        cin >> arr[i];
    }

    for(int i=0;i<n/2;i++)
    {
        swap(arr[i],arr[n-1-i]);
    }

    for(int i=0;i<n;i++)
    {
        cout << arr[i] << " ";
    }
    
    return 0;
}
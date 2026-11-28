//https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-for-dsa-a-10/challenges/sort-it-6-3/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 28/11/2026 07:44 AM Colombo Sri Lanka
//Last Edit: 28/11/2026 07:44 AM Colombo Sri Lanka

#include <bits/stdc++.h>


using namespace std;

int main()
{
    int n;
    cin>>n;
    int arr[n];
    for(int i=0;i<n;i++)
    {
        cin>>arr[i];
    }

    sort(arr,arr+n);

    for(int i=0;i<n;i++)
    {
        cout<<arr[i]<<" ";
    }

    cout<<endl;

    sort(arr,arr+n,greater<int>());

    for(int i=0;i<n;i++)
    {
        cout<<arr[i]<<" ";
    }
    
    
    return 0;
}
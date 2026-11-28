//https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-for-dsa-a-10/challenges/sort-it-2-1-1/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 28/11/2026 07:51 AM Colombo Sri Lanka
//Last Edit: 28/11/2026 07:51 AM Colombo Sri Lanka

#include <bits/stdc++.h>


using namespace std;

int* sort_it(int n)
{
    int* arr= new int[n];
    for(int i=0;i<n;i++)
    {
        cin >> arr[i];
    }

    sort(arr,arr+n,greater<int>());

    return arr;
}

int main()
{
    int n;
    cin >> n;
    int* arr = sort_it(n);

    for(int i=0;i<n;i++)
    {
        cout<<arr[i]<<" ";
    }
    
    return 0;
}
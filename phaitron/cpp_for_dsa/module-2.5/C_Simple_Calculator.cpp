// https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/C

//Author: Abu Hossain
//Create: 24/11/2026 11:53 AM Colombo Sri Lanka
//Last Edit: 24/11/2026 02:45 PM Colombo Sri Lanka

#include <bits/stdc++.h>


using namespace std;

int main()
{
    long long int x,y;
    cin >>x>>y;
    long long int sum=x+y;
    long long int mul=x*y;
    long long int sub=x-y;

    cout << x << " " << '+' << " " << y << " " << '=' << " " << sum << endl;
    cout << x << " " << '*' << " " << y << " " << '=' << " " << mul << endl;
    cout << x << " " << '-' << " " << y << " " << '=' << " " << sub << endl;
    
    
    return 0;
}
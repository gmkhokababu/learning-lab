//https://codeforces.com/group/MWSDmqGsZm/contest/219158/problem/M



//Author: Abu Hossain
//Create: 24/11/2026 11:06 AM Colombo Sri Lanka
//Last Edit: 24/11/2026 11:06 AM Colombo Sri Lanka

#include <bits/stdc++.h>


using namespace std;

int main()
{
    char c;
    cin >> c;
    // cout << c;
    if(c>='0' && c<='9')
    {
        cout << "IS DIGIT";
    }
    else if(c>='A' && c<='Z')
    {
        cout << "ALPHA\nIS CAPITAL";
    }
    else if(c>='a' && c<='z')
    {
        cout << "ALPHA\nIS SMALL";
    }
    
    
    return 0;
}
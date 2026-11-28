//https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-for-dsa-a-10/challenges/monkey-1-2/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 28/11/2026 08:11 AM Colombo Sri Lanka
//Last Edit: 28/11/2026 08:11 AM Colombo Sri Lanka

#include <bits/stdc++.h>


using namespace std;

int main()
{
    char s[100005];
    while(cin.getline(s,100005))
    {
        int len=strlen(s);
        sort(s,s+len);
        for(int i=0;i<len;i++)
        {
            if(s[i]==' ')
            {
                continue;
            }
            else
            {
                cout<<s[i];
            }
        }
        cout<<endl;
    }
    
    
    return 0;
}
#include <bits/stdc++.h>


using namespace std;

int main()
{
    int a,b;
    cin >> a >> b;

    // cout << a << endl << b << endl;
    
    cout << "Min= " << min(a,b) << endl;
    cout << "Max= " << max(a,b) << endl;

    swap(a,b);

    cout << a << " " << b << endl;

    return 0;
}
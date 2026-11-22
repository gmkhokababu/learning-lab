#include <iostream>
#include <iomanip>

using namespace std;

int main()
{
    double x;
    cin >> x;

    cout << x << endl;
    cout << fixed << setprecision(2) << x << endl;

    return 0;
}
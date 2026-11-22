#include <iostream>

using namespace std;
int main()
{

    int x;
    char c;
    double d;
    cin >> x >> c >> d;
    cout << x << endl << c << endl << d << endl;

    int ascii=c;
    cout << "ascii from variable " << ascii << endl;
    cout << "ascii from type casting " << (int)c << endl;

    return 0;
}
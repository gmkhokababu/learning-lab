//Author: Abu Hossain
//Create: 26/11/2026 11:52 AM Colombo Sri Lanka
//Last Edit: 26/11/2026 11:52 AM Colombo Sri Lanka

#include <bits/stdc++.h>


using namespace std;

class Student
{
    public:
    char name[100];
    int roll;
    double gpa;

};

int main()
{
    Student a[5];
    for(int i=0;i<5;i++)
    {
        cin >>a[i].name>>a[i].roll>>a[i].gpa;
    }
    for(int i=0;i<5;i++)
    {
        cout<<a[i].name<<" "<<a[i].roll<<" "<<a[i].gpa<<endl;
    }
    


    
    
    
    return 0;
}
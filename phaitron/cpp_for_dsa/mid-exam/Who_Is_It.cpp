//https://www.hackerrank.com/contests/mid-term-a-introduction-to-c-for-dsa-a-10/challenges/who-is-it-4/problem?isFullScreen=true

//Author: Abu Hossain
//Create: 28/11/2026 08:51 AM Colombo Sri Lanka
//Last Edit: 28/11/2026 08:51 AM Colombo Sri Lanka

#include <bits/stdc++.h>


using namespace std;

class Student
{
    public:
        int id;
        string name;
        char section;
        int marks;


};

int main()
{
    int t;
    cin>>t;
    for(int i=0;i<t;i++)
    {
        Student students[3];
        for(int j=0;j<3;j++)
        {
            cin>>students[j].id>>students[j].name>>students[j].section>>students[j].marks;
        }

        Student topper=students[0];

        for(int j=1;j<3;j++)
        {
            if(topper.marks<students[j].marks)
            {
                topper=students[j];
            }
            else if(topper.marks==students[j].marks)
            {
                if(topper.id>students[j].id)
                {
                    topper=students[j];
                }
            }
        }

        cout<<topper.id<< " "<<topper.name<< " "<<topper.section<< " "<<topper.marks<<endl;

        
    }


    
    
    return 0;
}
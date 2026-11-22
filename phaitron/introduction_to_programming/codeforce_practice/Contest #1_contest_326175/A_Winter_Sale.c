//Author: Abu Hossain
//Create: 22/11/2026 05:58 AM Colombo Sri Lanka
//Last Edit: 22/11/2026 05:58 AM Colombo Sri Lanka

#include <stdio.h>

int main()
{
    float x,p;
    scanf("%f %f",&x,&p);
    float dis=100-x;
    float m_price=(100/dis)*p;
    printf("%.2f",m_price);
    
    
    return 0;
}
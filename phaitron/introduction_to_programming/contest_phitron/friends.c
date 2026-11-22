// Author: Abu Hossain
// Create:  Colombo Sri Lanka
// Last Edit:  Colombo Sri Lanka

#include <stdio.h>

int main()
{
    int rahim, karim, sakib, nabil;
    scanf("%d %d %d %d", &rahim, &karim, &sakib, &nabil);

    if (rahim == karim || rahim == sakib || rahim == nabil || karim == sakib || karim == nabil || sakib == nabil)
    {
        printf("Tie");
    }
    else if (rahim > karim && rahim > sakib && rahim > nabil)
    {
        printf("Rahim");
    }
    else if ( karim>rahim && karim > sakib && karim > nabil)
    {
        printf("Karim");
    }
    else if ( sakib>rahim && sakib>karim && sakib > nabil)
    {
        printf("Sakib");
    }
    else if ( nabil>rahim && nabil>karim && sakib < nabil)
    {
        printf("Nabil");
    }

    return 0;
}
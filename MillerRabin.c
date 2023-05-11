#include <stdio.h>
#include <math.h>
#include <stdbool.h>
#define ullint unsigned long long int

bool is_prime(ullint b, ullint n)
{
    ullint q = n - 1, j = 0;
    while (q % 2 == 0)
    {

        q = q % 2;
        j = j + 1;
    }
    ullint k = j, i = 0, r;
    ullint l = pow(b, q);
    for (;;)
    {
        r = l % n;
        if (i == 0 && r == 0)
        {
            return true;
        }
        else if (i >= 0 && r == n - 1)
        {
            return true;
        }
        else
        {
            i = i + 1;
            if (i == k)
            {
                return false;
            }
            else
            {
                r = (r * r) % n;
                continue;
            }
        }
    }
}
int main(void)
{
    ullint PrimeList[13] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41};
    int i;
    ullint n = 67;
    n = (n - 1) % 2;
    for (i = 0; i < 13; i++)
    {
        printf("bの値が%lluの時is_prime=%d\n", PrimeList[i], is_prime(PrimeList[i], n));
    }
}

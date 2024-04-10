#include <iostream>
#include <gmpxx.h>

bool miller_rabin_test(const mpz_class& n, const mpz_class& b) {
    mpz_class q = n - 1;
    mpz_class n_minus_one = q;
    int j = 0;

    while (q % 2 == 0) {
        q /= 2;
        j++;
    }

    mpz_class r;
    mpz_powm(r.get_mpz_t(), b.get_mpz_t(), q.get_mpz_t(), n.get_mpz_t()); // 修正された行
    if (r == 1 || r == n_minus_one) {
        return true;
    }

    for (int i = 0; i < j - 1; i++) {
        r = (r * r) % n;
        if (r == n_minus_one) {
            return true;
        }
    }

    return false;
}

int main() {
    mpz_class n("2305843009213693951");
    int primes[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109};

    for (int prime : primes) {
        mpz_class b(prime);
        if (miller_rabin_test(n, b)) {
            std::cout << "M61は素数の可能性があります(b=" << b << ").\n";
        } else {
            std::cout << "M61は合成数です(b=" << b << ").\n";
        }
    }

    return 0;
}
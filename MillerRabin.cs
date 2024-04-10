using System;
using System.Numerics;

class MillerRabinTest {
    public static bool IsPrime(BigInteger n, BigInteger b) {
        BigInteger nMinusOne = n - 1;
        BigInteger q = nMinusOne;
        int j = 0;

        while (q % 2 == 0) {
            q /= 2;
            j++;
        }

        BigInteger r = BigInteger.ModPow(b, q, n);
        if (r == 1 || r == nMinusOne) {
            return true;
        }

        for (int i = 0; i < j - 1; i++) {
            r = (r * r) % n;
            if (r == nMinusOne) {
                return true;
            }
        }

        return false;
    }

    static void Main(string[] args) {
        BigInteger n = BigInteger.Parse("2305843009213693951");
        int[] primes = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109};

        foreach (int prime in primes) {
            BigInteger b = prime;
            if (IsPrime(n, b)) {
                Console.WriteLine($"M61は素数の可能性があります(b={b}).");
            } else {
                Console.WriteLine($"M61は合成数です(b={b}).");
            }
        }
    }
}
import std.stdio;
import std.bigint;
import std.conv; // to関数を使用するために必要

// モジュラー累乗を計算する関数
BigInt modPow(BigInt base, BigInt exponent, BigInt modulus) {
    BigInt result = 1;
    base %= modulus;
    while (exponent > 0) {
        if (exponent % 2 == 1) {
            result = (result * base) % modulus;
        }
        exponent >>= 1;
        base = (base * base) % modulus;
    }
    return result;
}

bool millerRabinTest(BigInt n, BigInt b) {
    BigInt nMinusOne = n - 1;
    BigInt q = nMinusOne;
    int j = 0;

    while (q % 2 == 0) {
        q /= 2;
        j++;
    }

    BigInt r = modPow(b, q, n);
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

void main() {
    // 文字列からBigIntを生成する正しい方法
    BigInt n = "2305843009213693951".to!BigInt;
    int[] primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109];

    foreach (prime; primes) {
        BigInt b = BigInt(prime);
        if (millerRabinTest(n, b)) {
            writeln("M61は素数の可能性があります(b=", b, ").");
        } else {
            writeln("M61は合成数です(b=", b, ").");
        }
    }
}
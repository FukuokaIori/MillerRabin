def mod_pow(base, exponent, modulus):
    """モジュラー累乗を計算する関数"""
    result = 1
    base = base % modulus
    while exponent > 0:
        if exponent % 2 == 1:
            result = (result * base) % modulus
        exponent = exponent >> 1
        base = (base * base) % modulus
    return result

def miller_rabin_test(n, b):
    """ミラー・ラビン素数判定法"""
    n_minus_one = n - 1
    q = n_minus_one
    j = 0
    while q % 2 == 0:
        q //= 2
        j += 1
    r = mod_pow(b, q, n)
    if r == 1 or r == n_minus_one:
        return True
    for _ in range(j - 1):
        r = (r * r) % n
        if r == n_minus_one:
            return True
    return False

def main():
    n = 2305843009213693951
    primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109]
    for prime in primes:
        is_prime = miller_rabin_test(n, prime)
        if is_prime:
            print(f"M61は素数の可能性があります(b={prime}).")
        else:
            print(f"M61は合成数です(b={prime}).")

if __name__ == "__main__":
    main()
use num_bigint::BigUint;
use num_traits::{One, Zero};

fn miller_rabin_test(n: &BigUint, b: &BigUint) -> bool {
    let mut q = n - BigUint::one();
    let n_minus_one = q.clone();
    let mut j = 0;

    while &q % 2u32 == Zero::zero() {
        q /= 2u32;
        j += 1;
    }

    let mut r = b.modpow(&q, n);
    if r == BigUint::one() || r == n_minus_one {
        return true;
    }

    for _ in 0..j - 1 {
        r = (&r * &r) % n;
        if r == n_minus_one {
            return true;
        }
    }

    false
}

fn main() {
    let n = BigUint::parse_bytes(b"2305843009213693951", 10).unwrap();
    let primes = vec![2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109];

    for prime in primes {
        let b = BigUint::from(prime);
        if miller_rabin_test(&n, &b) {
            println!("M61は素数の可能性があります(b={})", b);
        } else {
            println!("M61は合成数です(b={})", b);
        }
    }
}
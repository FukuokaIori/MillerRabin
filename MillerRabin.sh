#!/bin/bash

# ミラーラビンテスト関数
miller_rabin_test() {
    n=$1
    b=$2
    n_minus_1=$(echo "$n - 1" | bc)
    q=$n_minus_1
    j=0

    # qが偶数の間、qを2で割り続ける
    while [ $(echo "$q % 2" | bc) -eq 0 ]; do
        q=$(echo "$q / 2" | bc)
        ((j++))
    done

    r=$(echo "($b ^ $q) % $n" | bc)
    if [ $r -eq 1 ] || [ $r -eq $n_minus_1 ]; then
        echo "1"
        return
    fi

    for ((i=0; i<j-1; i++)); do
        r=$(echo "($r * $r) % $n" | bc)
        if [ $r -eq $n_minus_1 ]; then
            echo "1"
            return
        fi
    done

    echo "0"
}

# メインロジック
n="2305843009213693951"
primes=(2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 101 103 107 109)

for b in "${primes[@]}"; do
    is_prime=$(miller_rabin_test $n $b)
    if [ "$is_prime" -eq "1" ]; then
        echo "M61は素数の可能性があります(b=$b)。"
    else
        echo "M61は合成数です(b=$b)。"
    fi
done
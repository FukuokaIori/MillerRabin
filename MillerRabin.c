#include <stdio.h>
#include <stdlib.h>
#include <gmp.h> // GMPライブラリを使用して大きな数を扱うためのヘッダーファイルをインクルードします。
#include <gmp.h>

// ミラーラビンテストを実行する関数
int miller_rabin_test(const mpz_t n, const mpz_t b)
{
    mpz_t q, r, n_minus_1; // 変数宣言
    mpz_inits(q, r, n_minus_1, NULL); // 初期化
    mpz_sub_ui(n_minus_1, n, 1); // n-1を計算
    mpz_set(q, n_minus_1); // qにn-1をコピー
    int j = 0; // jに0を代入
    while (mpz_even_p(q)) // while q%2=0
    {
        mpz_divexact_ui(q, q, 2); // qを2で割る
        j++; // j = j + 1;
    }
    mpz_t i, k; // 変数宣言
    mpz_inits(i, k, NULL); // 初期化
    mpz_set_ui(i, 0); // iに0を代入
    mpz_set_ui(k, j); // kにjを代入
    mpz_powm(r, b, q, n); // r = (b^q) % n
    if (mpz_cmp_ui(i, 0) == 0 && mpz_cmp_ui(r, 1) == 0) // i = 0 かつ r = 1 の時
    {
        mpz_clears(q, r, n_minus_1, i, k, NULL);
        return 1; // True
    }
    while (mpz_cmp_ui(i, 0) >= 0 && mpz_cmp(r, n_minus_1) != 0) // i >= 0 かつ r = n - 1 の時
    {
        if (mpz_cmp(i, k) >= 0) // i = k の時
        {
            mpz_clears(q, r, n_minus_1, i, k, NULL);
            return 0; // False
        }
        mpz_mul(r, r, r); // r * r
        mpz_mod(r, r, n); // ( r * r ) % n
        mpz_add_ui(i, i, 1); // i = i + 1
    }
    mpz_clears(q, r, n_minus_1, i, k, NULL);
    return 1; // True
}

int main(void)
{
    mpz_t n, b;
    mpz_inits(n, b, NULL);
    // M61(2の61乗-1)を設定
    mpz_set_str(n, "2305843009213693951", 10);
    // b109に以下の1以外の素数を設定
    int primes[] = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109};
    int num_primes = sizeof(primes) / sizeof(primes[0]);
    for (int i = 0; i < num_primes; i++)
    {
        mpz_set_ui(b, primes[i]);
        int is_prime = miller_rabin_test(n, b);
        if (is_prime)
            gmp_printf("M61は素数の可能性があります(b=%Zd)。\n", b);
        else
            gmp_printf("M61は合成数です(b=%Zd)。\n", b);
    }
}
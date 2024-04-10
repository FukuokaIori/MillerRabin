defmodule MillerRabin do
  # モジュラー累乗を計算する関数
  def mod_pow(base, exponent, modulus) do
    mod_pow(base, exponent, modulus, 1)
  end

  defp mod_pow(_base, 0, _modulus, acc), do: acc
  defp mod_pow(base, exponent, modulus, acc) do
    new_acc = if rem(exponent, 2) == 1, do: rem(acc * base, modulus), else: acc
    mod_pow(rem(base * base, modulus), div(exponent, 2), modulus, new_acc)
  end

  # Miller-Rabinテストの実装
  def miller_rabin_test(n, b) do
    n_minus_one = n - 1
    {q, j} = find_q_and_j(n_minus_one)

    r = mod_pow(b, q, n)
    if r == 1 or r == n_minus_one or loop_check(r, j - 1, n, n_minus_one), do: true, else: false
  end

  defp find_q_and_j(n_minus_one) do
    find_q_and_j(n_minus_one, n_minus_one, 0)
  end

  defp find_q_and_j(q, n_minus_one, j) when rem(q, 2) == 0 do
    find_q_and_j(div(q, 2), n_minus_one, j + 1)
  end
  defp find_q_and_j(q, _n_minus_one, j), do: {q, j}

  defp loop_check(_r, 0, _n, _n_minus_one), do: false
  defp loop_check(r, i, n, n_minus_one) do
    new_r = rem(r * r, n)
    if new_r == 1, do: false
    if new_r == n_minus_one or loop_check(new_r, i - 1, n, n_minus_one), do: true, else: false
  end

  # メイン関数
  def main do
    n = String.to_integer("2305843009213693951")
    primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109]

    Enum.each(primes, fn prime ->
      if miller_rabin_test(n, prime) do
        IO.puts("M61は素数の可能性があります(b=#{prime}).")
      else
        IO.puts("M61は合成数です(b=#{prime}).")
      end
    end)
  end
end

MillerRabin.main()
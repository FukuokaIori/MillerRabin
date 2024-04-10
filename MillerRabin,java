import java.math.BigInteger;
import java.util.Arrays;

public class MillerRabinTest {

    // ミラーラビンテストを実行するメソッド
    public static boolean millerRabinTest(BigInteger n, BigInteger b) {
        BigInteger nMinusOne = n.subtract(BigInteger.ONE);
        BigInteger q = nMinusOne;
        int j = 0;

        // qが偶数の間、qを2で割り続ける
        while (q.mod(BigInteger.TWO).equals(BigInteger.ZERO)) {
            q = q.divide(BigInteger.TWO);
            j++;
        }

        BigInteger r = b.modPow(q, n);
        if (r.equals(BigInteger.ONE) || r.equals(nMinusOne)) {
            return true;
        }

        for (int i = 0; i < j - 1; i++) {
            r = r.multiply(r).mod(n);
            if (r.equals(nMinusOne)) {
                return true;
            }import java.math.BigInteger;
import java.util.Arrays;

public class MillerRabinTest {

    /**
     * ミラーラビン素数判定テストを実行するメソッド。
     * 
     * @param n 判定対象の大きな数。
     * @param b テストに使用する基底。
     * @return nが素数の可能性がある場合はtrue、そうでない場合はfalse。
     */
    public static boolean millerRabinTest(BigInteger n, BigInteger b) {
        BigInteger nMinusOne = n.subtract(BigInteger.ONE);
        BigInteger q = nMinusOne;
        int j = 0;

        // n-1 = 2^j * q (qは奇数) を見つける
        while (q.mod(BigInteger.TWO).equals(BigInteger.ZERO)) {
            q = q.divide(BigInteger.TWO);
            j++;
        }

        // b^q mod n を計算
        BigInteger r = b.modPow(q, n);
        // b^q = 1 mod n または b^q = n-1 mod n の場合、nは素数の可能性がある
        if (r.equals(BigInteger.ONE) || r.equals(nMinusOne)) {
            return true;
        }

        // b^(2^i * q) mod n が n-1 になるかどうかをチェック
        for (int i = 0; i < j - 1; i++) {
            r = r.multiply(r).mod(n);
            if (r.equals(nMinusOne)) {
                return true;
            }
        }

        // 上記の条件に一致しない場合、nは合成数
        return false;
    }

    public static void main(String[] args) {
        BigInteger n = new BigInteger("2305843009213693951");
        int[] primes = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109};

        // 各基底に対してミラーラビンテストを実行
        for (int prime : primes) {
            BigInteger b = BigInteger.valueOf(prime);
            boolean isPrime = millerRabinTest(n, b);
            if (isPrime) {
                System.out.printf("M61は素数の可能性があります(b=%d)。\n", b);
            } else {
                System.out.printf("M61は合成数です(b=%d)。\n", b);
            }
        }
    }
}
        }

        return false;
    }

    public static void main(String[] args) {
        BigInteger n = new BigInteger("2305843009213693951");
        int[] primes = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109};

        for (int prime : primes) {
            BigInteger b = BigInteger.valueOf(prime);
            boolean isPrime = millerRabinTest(n, b);
            if (isPrime) {
                System.out.printf("M61は素数の可能性があります(b=%d)。\n", b);
            } else {
                System.out.printf("M61は合成数です(b=%d)。\n", b);
            }
        }
    }
}
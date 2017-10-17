// http://www.spoj.com/problems/PRIME1/

// Sieve of Eratosthenes
// TLE

import java.util.Scanner;
import java.util.Arrays;

public class A002Prime1Sieve {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int nTests = sc.nextInt();
        int m;
        int n;

        boolean[] primes = sieveOfEratosthenes((int)Math.pow(10, 9));

        for (int i = 0; i < nTests; i++) {
            m = sc.nextInt();
            n = sc.nextInt();
            for (int j = m; j <= n; j++) {
                if (primes[j]) {
                    System.out.println(j);
                }
            }
            System.out.println();
        }
    }

    public static boolean[] sieveOfEratosthenes(int n) {
        boolean[] primes = new boolean[n + 1];
        for (int i = 2; i < primes.length; i++) {
            primes[i] = true;
        }

        int sqrtN = (int) (Math.sqrt(n)) + 1;

        for (int p = 2; p <= sqrtN; p++) {
            if (primes[p] == true) {
                // p is prime because if it was not it would have been
                // marked as a multiple of some other smaller prime.

                // Mark all multiples of the prime p except itself.
                for (int i = p * 2; i <= n; i = i + p) {
                    primes[i] = false;
                }
            }
        }

        return primes;
    }

}

class A002Test {

    public static void main(String[] args) {
        boolean[] actual = A002Prime1Sieve.sieveOfEratosthenes(5);
        boolean[] expected = {false, false, true, true, false, true};
        System.out.println(Arrays.equals(actual, expected) ? "PASS" : "FAIL");
    }

}

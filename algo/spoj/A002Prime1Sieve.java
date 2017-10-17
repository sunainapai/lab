// http://www.spoj.com/problems/PRIME1/

// Sieve of Eratosthenes
// TLE

import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

public class A002Prime1Sieve {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int nTests = sc.nextInt();
        int m;
        int n;

        for (int i = 0; i < nTests; i++) {
            m = sc.nextInt();
            n = sc.nextInt();
            sieveOfEratosthenes(m, n);
            System.out.println();
        }
    }

    public static void sieveOfEratosthenes(int m, int n) {
        boolean[] primes = new boolean[n + 1];
        for (int i = 2; i < primes.length; i++) {
            primes[i] = true;
        }

        for (int p = 2; p <= Math.round(Math.sqrt(n)); p++) {
            if (primes[p] == true) {
                // p is prime because if it was not it would have been
                // marked as a multiple of some other smaller prime.

                // Mark all multiples of the prime p except itself.
                for (int i = p * 2; i <= n; i = i + p) {
                    primes[i] = false;
                }
            }
        }

        // Print all primes between m and n ignoring everything < m.
        for (int i = m; i < primes.length; i++) {
            if (primes[i]) {
                System.out.println(i);
            }
        }
    }

}

class A002Test {

    public static void main(String[] args) {
        A002Prime1Sieve.sieveOfEratosthenes(1, 5);
        // Output 2, 3, 5
    }

}

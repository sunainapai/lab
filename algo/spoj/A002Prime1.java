// http://www.spoj.com/problems/PRIME1/

import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;
import java.util.Arrays;

public class A002Prime1 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int nTests = sc.nextInt();
        int m;
        int n;
        List<Integer> primes;

        for (int i = 0; i < nTests; i++) {
            m = sc.nextInt();
            n = sc.nextInt();
            primes = findPrimes(m, n);
            for (int prime: primes) {
                System.out.println(prime);
            }
            System.out.println();
        }
    }

    public static List<Integer> findPrimes(int m, int n) {
        List<Integer> primes = new ArrayList<>();
        for (int i = m; i <= n; i++) {
            if (isPrime(i)) {
                primes.add(i);
            }
        }
        return primes;
    }

    private static boolean isPrime(int num) {
        if (num == 1) {
            return false;
        }

        for (int i = 2; i <= Math.round(Math.sqrt(num)); i++) {
            if (num % i == 0) {
                return false;
            }
        }

        return true;
    }

}

class A002Test {

    public static void main(String[] args) {
        List<Integer> actual = A002Prime1.findPrimes(1, 5);
        List<Integer> expected = Arrays.asList(2, 3, 5);
        System.out.println((expected.equals(actual)) ? "PASS" : "FAIL");
    }

}

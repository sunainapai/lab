// http://www.spoj.com/problems/PALIN/

// http://www.geeksforgeeks.org/given-a-number-find-next-smallest-palindrome-larger-than-this-number/

import java.util.Scanner;
import java.util.Arrays;
import java.util.stream.Collectors;

public class A005Palin {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int nTests = Integer.valueOf(sc.nextLine());

        // The input number is not more than 10^6 digits.
        String s;

        for (int i = 0; i < nTests; i++) {
            s = sc.nextLine();
            System.out.println(getNextPalindrome(s));
        }
    }

    public static String getNextPalindrome(String s) {
        int[] num = Arrays.stream(s.split(""))
                            .mapToInt(Integer::parseInt)
                            .toArray();

        int n = num.length;

        if (isAll9(num)) {
            // The input number is a palindrome and has all 9s.

            StringBuilder sb = new StringBuilder();
            sb.append("1");
            for (int i = 1; i < n; i++) {
                sb.append("0");
            }
            sb.append("1");
            return sb.toString();

        } else {
            // The input number is not a palindrome or is a palindrome
            // and does not have all 9s.

            return generateNextPalindrome(num);
        }

    }

    private static String generateNextPalindrome(int[] num) {
        int n = num.length;

        int mid = n / 2;
        int i = mid - 1;
        int j = (n % 2 == 0) ? mid : mid + 1;

        // Is copying from left side to right side sufficient?
        boolean isCopySufficient = false;

        // Ignore the same digits around the middle.
        while (i >= 0 && num[i] == num[j]) {
            i--;
            j++;
        }

        // If the number on left is smaller or the left pointer has
        // crossed the boundary (happens in case of palindrome), copying
        // left to right is not sufficient, middle digit(s) need to be
        // incremented.
        if (i < 0 || num[i] < num[j]) {
            isCopySufficient = true;
        }

        // Mirror left side to right by copying digits.
        while (i >= 0) {
            num[j++] = num[i--];
        }

        // Increment the middle digits.
        if (isCopySufficient) {
            int carry = 1;

            // If the number is odd, increment the middle digit and
            // store the carry.
            if (n % 2 == 1) {
                num[mid] += 1;
                carry = num[mid] / 10;
                num[mid] = num[mid] % 10;
            }

            i = mid - 1;
            j = (n % 2 == 0) ? mid : mid + 1;

            // Add 1 to the rightmost digit of the left side, propagate
            // the carry towards MSB digit and mirror the left side to
            // right.
            while (i >= 0) {
                num[i] = num[i] + carry;
                carry = num[i] / 10;
                num[i] = num[i] % 10;
                num[j] = num[i];
                i--;
                j++;
            }
        }

        String nextPalindrome = Arrays.stream(num)
                                      .mapToObj(Integer::toString)
                                      .collect(Collectors.joining(""));

        return nextPalindrome;
    }

    private static boolean isAll9(int[] digits) {
        for (int i = 0; i < digits.length; i++) {
            if (9 != digits[i]) {
                return false;
            }
        }
        return true;
    }

}

class A005Test {
    public static void main(String[] args) {
        String actual = A005Palin.getNextPalindrome("9");
        String expected = "11";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("99");
        expected = "101";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("1221");
        expected = "1331";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("12721");
        expected = "12821";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("1221");
        expected = "1331";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("0");
        expected = "1";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("1");
        expected = "2";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("9");
        expected = "11";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("12");
        expected = "22";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("99");
        expected = "101";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("808");
        expected = "818";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("2133");
        expected = "2222";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("321123");
        expected = "322223";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("94187978322");
        expected = "94188088149";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A005Palin.getNextPalindrome("23726");
        expected = "23732";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");
    }
}

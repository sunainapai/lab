// http://www.spoj.com/problems/TEST/

import java.util.Scanner;

public class A001Test {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int i;
        while (sc.hasNextInt() && (i = sc.nextInt()) != 42) {
            System.out.println(i);
        }
    }

}

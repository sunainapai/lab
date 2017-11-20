// http://www.spoj.com/problems/ONP/

// Reverse Polish Notation

import java.util.Scanner;
import java.util.Stack;

public class A004Onp {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int nTests = Integer.valueOf(sc.nextLine());
        for (int i = 0; i < nTests; i++) {
            System.out.println(transform(sc.nextLine()));
        }
    }

    public static String transform(String exp) {
        Stack<String> stack = new Stack<String>();
        String result = "";

        for (int i = 0; i < exp.length(); i++) {
            String left = "";
            String right = "";
            String op = "";
            String s = String.valueOf(exp.charAt(i));

            switch(s) {
                case "(": break;
                case ")": if (!stack.isEmpty()) {
                                right = stack.pop();
                                if (!stack.isEmpty()) {
                                    op = stack.pop();
                                }
                                if (!stack.isEmpty()) {
                                    left = stack.pop();
                                }
                                stack.push(left + right + op);
                           }
                           break;
                default: stack.push(s);
                         break;
            }
        }

        if (!stack.isEmpty()) {
            result = stack.pop();
        }

        return result;
    }
}

class A004Test {

    public static void main(String[] args) {
        String actual = A004Onp.transform("(a+(b*c))");
        String expected = "abc*+";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A004Onp.transform("((a+b)*(z+x))");
        expected = "ab+zx+*";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A004Onp.transform("((a+t)*((b+(a+c))^(c+d)))");
        expected = "at+bac++cd+^*";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");
    }

}

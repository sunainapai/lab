// http://www.spoj.com/problems/ONP/

// Reverse Polish Notation

import java.util.Scanner;
import java.util.Stack;

public class A004Onp2 {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int nTests = Integer.valueOf(sc.nextLine());
        for (int i = 0; i < nTests; i++) {
            System.out.println(transform(sc.nextLine()));
        }
    }

    public static String transform(String exp) {
        Stack<String> stack = new Stack<String>();
        StringBuilder output = new StringBuilder();
        String item = "";

        for (int i = 0; i < exp.length(); i++) {
            String s = String.valueOf(exp.charAt(i));

            switch(s) {
                case "(":
                case "+":
                case "-":
                case "*":
                case "/":
                case "^": stack.push(s);
                          break;
                case ")": while (!stack.isEmpty()) {
                                item = stack.pop();

                                if (item.equals("(")) {
                                    break;
                                }

                                output.append(item);
                           }
                           break;
                default: output.append(s);
                         break;
            }
        }

        while (!stack.isEmpty()) {
            item = stack.pop();

            if (!item.equals("(")) {
                output.append(item);
            }
        }

        return output.toString();
    }
}

class A004Test {

    public static void main(String[] args) {
        String actual = A004Onp2.transform("(a+(b*c))");
        String expected = "abc*+";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A004Onp2.transform("((a+b)*(z+x))");
        expected = "ab+zx+*";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");

        actual = A004Onp2.transform("((a+t)*((b+(a+c))^(c+d)))");
        expected = "at+bac++cd+^*";
        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");
    }

}

// http://www.spoj.com/problems/ARITH/

// http://patelgovind.blogspot.in/2014/08/simple-arithmetics-arith.html

import java.util.Scanner;
import java.util.Arrays;
import java.math.BigDecimal;

import java.io.IOException;
import java.io.File;
import java.io.BufferedReader;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.stream.Stream;
import java.util.stream.Collectors;

public class A006Arith {

    public static StringBuilder sb = new StringBuilder();

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int nTests = Integer.valueOf(sc.nextLine());

        String operation;
        for(int i = 0; i < nTests; i++) {
            operation = sc.nextLine();
            process(operation);
            sb.append("\n");
        }
        System.out.print(sb);
    }

    public static void process(String operation) {
        String[] matches = operation.split("(?<=[-+*])|(?=[-+*])");
        BigDecimal operand1 = new BigDecimal(matches[0]);
        BigDecimal operand2 = new BigDecimal(matches[2]);
        String operator = matches[1];

        String operand1Str = operand1.toPlainString();
        String operand2Str = operator + operand2.toPlainString();

        int lengthOfOperand2Str = operand2Str.length();

        BigDecimal result;
        BigDecimal resultTemp;
        BigDecimal numberTemp;

        int lengthOfResult = 0;
        int lengthOfDashedLine = 0;

        if (!operator.equals("*")) {
            if (operator.equals("-")) {
                operand2 = operand2.negate();
            }
            result = operand1.add(operand2);

            lengthOfResult = result.toPlainString().length();
            lengthOfDashedLine = Math.max(lengthOfOperand2Str, lengthOfResult);

            sb.append(padLeft(operand1Str, lengthOfDashedLine)).append("\n");
            sb.append(padLeft(operand2Str, lengthOfDashedLine)).append("\n");
            sb.append(line(lengthOfDashedLine)).append("\n");
            sb.append(padLeft(result, lengthOfDashedLine)).append("\n");
        } else {
            result = operand1.multiply(operand2);

            lengthOfResult = result.toPlainString().length();
            lengthOfDashedLine = Math.max(lengthOfOperand2Str, lengthOfResult);

            sb.append(padLeft(operand1Str, lengthOfDashedLine)).append("\n");
            sb.append(padLeft(operand2Str, lengthOfDashedLine)).append("\n");

            boolean haveLine = false;

            if (lengthOfOperand2Str > 2) {
                int k = 0;
                // lengthOfOperand2Str includes operator as well.
                for (int i = lengthOfOperand2Str - 1; i >= 1; i--) {
                    numberTemp = new BigDecimal(String.valueOf(operand2Str.charAt(i)));
                    resultTemp = operand1.multiply(numberTemp);
                    if (!haveLine) {
                        haveLine = true;
                        lengthOfDashedLine = Math.max(lengthOfOperand2Str, resultTemp.toPlainString().length());
                        sb.append(padLeft(line(lengthOfDashedLine), lengthOfResult)).append("\n");
                    }
                    sb.append(padLeft(resultTemp, lengthOfResult - (k))).append("\n");
                    k++;
                }
            }
            sb.append(line(lengthOfResult)).append("\n");
            sb.append(result).append("\n");
        }
    }

    public static String line(int n) {
        return String.format(String.format("%%0%dd", n), 0).replace("0", "-");
    }

    public static String padLeft(String s, int n) {
        return String.format("%1$" + n + "s", s);
    }

    public static String padLeft(BigDecimal bd, int n) {
        return padLeft(bd.toPlainString(), n);
    }

}

class A006Test {

    public static void main(String[] args) throws IOException {
        try (BufferedReader br = new BufferedReader(new FileReader("a006.in.txt"))) {
            int nTests  = Integer.valueOf(br.readLine());
            String operation;
            for(int i = 0; i < nTests; i++) {
                operation = br.readLine();
                A006Arith.process(operation);
                A006Arith.sb.append("\n");
            }
        }

        String actual = A006Arith.sb.toString();

        String expected;
        try (Stream<String> lines = Files.lines(Paths.get("a006.out.txt"))) {
            expected = lines.collect(Collectors.joining("\n"));
        }

        // The output is expected to have a new line for the output of
        // last operation as well. With Collectors.joining(), if we join
        // n lines with a new line seperator, we get n - 1 seperators
        // between lines. Compensating this by adding a new line at the
        // end.
        expected += "\n";

        System.out.println(expected.equals(actual) ? "PASS" : "FAIL");
    }

}

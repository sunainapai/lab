Solution Notes
==============
## A004Onp
If the following line of code,

    int nTests = Integer.valueOf(sc.nextLine());

is replaced with the following instead,

    int nTests = sc.nextInt();

we do not get the expected result.

If the input is:
    3
    (a+(b*c))
    ((a+b)*(z+x))
    ((a+t)*((b+(a+c))^(c+d)))

Using `nextInt()` along with `nextLine()` to the scan the input causes
the last expression in the input to be skipped. This is because the
first scan of the input using `nextLine()` returns an empty string and
this becomes our first expression. `nextInt()` returns `3` and in the
first iteration of the for loop, `nextLine()` scans the rest of the line
containing the number `3` and sets the scanner position to the beginning
of the next line which is the actual first expression.

Here is a brief description of both methods:

  - `sc.nextInt()`: scans the next token of input as an int. It does not
    advance the scanner past the current line.
  - `sc.nextLine()`: advances this scanner past the current line and
    returns the input that was skipped. This method returns the rest of
    the current line, excluding any line separator at the end. The
    position is set to the beginning of the next line.

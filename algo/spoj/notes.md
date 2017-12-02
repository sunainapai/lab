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

## A005Palin
There are 3 cases:

 1. The input number is a palindrome and has all 9s.
 2. The input number is not a palindrome.
 3. The input number is a palindrome and does not have all 9s.

Solution for case 1:

The output contains n + 1 digits where the corner digits are 1, and
all the digits between corners are 0.

    Example:
    9 -> 11
    99 -> 101

Solution for case 2 and 3:

Let us consider 2 parts left and right of the given number. Start with 2
pointers i and j, pointing to 2 middle elements when the number is even
or 2 elements around the middle when the number is odd. Do the
following.

 1. Ignore the same digits around the middle.

        Example: 8 3 4 2 2 4 6 9
                   i         j
        i points to 3 and j points to 6.

 2. After step 1, the following cases arise.

     1. Indices i and j cross boundaries. This happens in case the given
        number is palindrome.

            Example:  1 2 2 1
                     i       j

                      8 0 8
                     i      j

        In this case we add 1 to the middle digit or digits in case the
        number is even and propagate the carry towards the MSB digit of
        left side while copying the digits from left side to right side
        appropriately to form a mirror of left side on the right side.

     2. There are digits in between which are not same. In this case
        there can be 2 subcases.

         1. Copying the left side to the right side is sufficient.  We
            don't need to increment any digits. This happens when the
            first digit after the digits ignored in step 1 on the left
            side is greater than the digit on the right side.  

                Example: 7 8 3 3 2 2 -> 7 8 3 3 8 7
                           i     j

         2. Copying the left side to the right side is not sufficient.
            This happens when the first digit after the digits ignored in
            the step 1 on the left side is smaller than the digit on the
            right side. In this case we add 1 to the middle digit or digits
            in case the number is even and propagate the carry towards the
            MSB digit of left side while copying the digits from left side
            to right side appropriately to form a mirror of left side on
            the right side.

                Example: 7 1 3 3 2 2 -> 7 1 4 4 1 7
                           i     j

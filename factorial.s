    .global factorial

factorial:

    mov x1, x0          // Copy the input integer to x1
    mov x2, #1          // Initialize x2 to 1 (for the result)
factorial_loop:
    cmp x1, #1      // Compare x1 with 1
    b.le factorial_done  // If x1 <= 1, exit the loop
    mul x2, x2, x1  // Multiply the result by x1
    sub x1, x1, #1  // Decrement x1
    b factorial_loop

factorial_done:
    // x2 now contains the factorial of the input integer
    mov x21, x2
    ret
.end

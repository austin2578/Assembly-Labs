String_length:
    ldr x0, =iString   // Load the address of the input string into x0
    ldrb w2, [x0]  // Load the first byte of the input string into w2
    mov x4, #0

check_char_loop:
    cmp w2, #0   // Compare the character with '0'
    beq exit

    add x0, x0, #1   // Increment the address to the next character
    ldrb w2, [x0]    // Load the next character into w2
    add x4,x4,#1    //increment string size


    b check_char_loop    // Continue looping to check the next character

exit:
    mov x0, x4     // Move the length value from register x4 back to register x3 for return.
    ret


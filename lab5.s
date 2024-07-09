.equ MAX_BYTES, 21

.global _start  // Declare the _start label as global (the program entry point)
_start:

    // Prompt the user for input and store the values as strings
    ldr x0, =prompt  // Load the address of the input prompt into x1
    bl putstring  // Display the input prompt

    mov x1, MAX_BYTES
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl getstring  // Call the getstring function to get user input
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl ascint64   // Convert the input string to an integer and store it in A
    ldr x1, =A
    str x0, [x1]

    ldr x0, =prompt  // Load the address of the input prompt into x1
    bl putstring  // Display the input prompt

    mov x1, MAX_BYTES
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl getstring  // Call the getstring function to get user input
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl ascint64   // Convert the input string to an integer and store it in A
    ldr x1, =B
    str x0, [x1]

    ldr x0, =prompt  // Load the address of the input prompt into x1
    bl putstring  // Display the input prompt

    mov x1, MAX_BYTES
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl getstring  // Call the getstring function to get user input
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl ascint64   // Convert the input string to an integer and store it in A
    ldr x1, =C
    str x0, [x1]

    ldr x0, =prompt  // Load the address of the input prompt into x1
    bl putstring  // Display the input prompt

    mov x1, MAX_BYTES
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl getstring  // Call the getstring function to get user input
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl ascint64   // Convert the input string to an integer and store it in A
    ldr x1, =D
    str x0, [x1]

    // Calculate the result of A - B + C - D
    ldr x0, =A    // Load the address of variable A into register x0
    ldr x0, [x0]  // Load the value stored at the address in x0 into x0 (A)
    ldr x1, =B    // Load the address of variable B into register x1
    ldr x1, [x1]  // Load the value stored at the address in x1 into x1 (B)
    sub x2, x0, x1  // Sub the values of A and B and store the result in x2
    ldr x0, =C    // Load the address of variable C into register x0
    ldr x0, [x0]  // Load the value stored at the address in x0 into x0 (C)
    add x2, x2, x0  // Add the value of C to the result in x2
    ldr x0, =D    // Load the address of variable D into register x0
    ldr x0, [x0]  // Load the value stored at the address in x0 into x0 (D)
    sub x2, x2, x0  // Sub the value of D to the result in x2
    ldr x1, =result  // Load the address of the result variable into x1
    str x2, [x1]  // Store the final result from x2 into the result variable

    // Display the output
    ldr x0, =A    // Load the address of variable A into register x0
    ldr x0, [x0]  // Load the value of A into x0
    ldr x1, =tmpStr  // Load the address of tmpStr variable into x1
    bl int64asc   // Call the int64asc function to convert x0 to a string
    ldr x0, =tmpStr  // Load the address of tmpStr into x0
    bl putstring  // Call the putstring function to display the converted value

    ldr x0, =minus  // Load the address of the " - " string into x0
    bl putstring  // Display the minus sign

    ldr x0, =B    // Load the address of variable B into register x0
    ldr x0, [x0]  // Load the value of B into x0
    ldr x1, =tmpStr  // Load the address of tmpStr variable into x1
    bl int64asc   // Call the int64asc function to convert x0 to a string
    ldr x0, =tmpStr  // Load the address of tmpStr into x0
    bl putstring  // Call the putstring function to display the converted value

    ldr x0, =plus  // Load the address of the " + " string into x0
    bl putstring  // Display the plus sign

    ldr x0, =C    // Load the address of variable C into register x0
    ldr x0, [x0]  // Load the value of C into x0
    ldr x1, =tmpStr  // Load the address of tmpStr variable into x1
    bl int64asc   // Call the int64asc function to convert x0 to a string
    ldr x0, =tmpStr  // Load the address of tmpStr into x0
    bl putstring  // Call the putstring function to display the converted value

    ldr x0, =minus  // Load the address of the " - " string into x0
    bl putstring  // Display the minus sign

    ldr x0, =D    // Load the address of variable D into register x0
    ldr x0, [x0]  // Load the value of D into x0
    ldr x1, =tmpStr  // Load the address of tmpStr variable into x1
    bl int64asc   // Call the int64asc function to convert x0 to a string
    ldr x0, =tmpStr  // Load the address of tmpStr into x0
    bl putstring  // Call the putstring function to display the converted value

    ldr x0, =equal  // Load the address of the " = " string into x0
    bl putstring  // Display the equal sign

    ldr x0, =result
    ldr x0, [x0]  // Load the value of the result into x0
    ldr x1, =tmpStr  // Load the address of tmpStr into x1
    bl int64asc   // Convert x0 to a string
    ldr x0, =tmpStr  // Load the address of tmpStr into x0
    bl putstring  // Display the converted result

    ldr x0, =newline  // Load the address of the newline character into x0
    bl putch  // Display a newline character

    // Exit the program
    mov x8, #93  // Set the system call number for exit (93)
    mov x0, #0   // Set the exit status (0)
    svc #0       // Perform a system call to exit the program

    .data
A: .quad 0
B: .quad 0
C: .quad 0
D: .quad 0
result: .quad 0
tmpStr: .asciz "                     "  // A buffer for converting integers to strings
plus: .asciz " + "  // String for the plus sign
minus: .asciz " - "  // String for the minus sign
equal: .asciz " = "  // String for the equal sign
newline: .byte 10  // ASCII code for a newline character
prompt: .asciz "Enter a value: "  // Input prompt message

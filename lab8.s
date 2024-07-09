//GLOBAL
.equ MAX_BYTES, 21 //Max string size
.equ ARRAY_SIZE, 10 //Array size
.global _start

_start:
ldr x3, =array      //Load the address of dbX in x1
mov x4, ARRAY_SIZE
mov x2, #0
get_numbers_loop:
    ldr x0, =promptX  // Load the address of the input promptx into x1
    bl putstring  // Display the input prompt
    mov x1, MAX_BYTES
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl getstring  // Call the getstring function to get user input
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl ascint64   // Convert the input string to an integer and store it in dbX
    str x0, [x3]    //Store value of x0 into x1
    add x3, x3, #8
    sub x4, x4, #1
    add x2, x2, x0
    cbnz x4, get_numbers_loop
    ldr x3, =array      //Load the address of dbX in x1
    mov x4, ARRAY_SIZE

display_numbers_loop:
    ldr x0, [x3]     // Load the value from the array
    ldr x1, =tmpStr  // Load the address of the tmpStr variable
    bl int64asc      // Convert the integer to a string
    ldr x0, =tmpStr  // Load the address of tmpStr
    bl putstring     // Display the converted value
    ldr x0, =newline // Load the address of the newline character
    bl putch         // Display a newline character
    add x3, x3, #8   // Move to the next element in the array
    sub x4, x4, #1   // Decrement the loop counter
    cbnz x4, display_numbers_loop

    // Display the sum of the numbers
    ldr x0, =sumText // Load the address of the sumText
    bl putstring     // Display the sumText
    mov x0, x2
    ldr x1, =tmpStr  // Load the address of tmpStr
    bl int64asc      // Convert the integer to a string
    ldr x0, =tmpStr  // Load the address of tmpStr
    bl putstring     // Display the converted value


exit:
    // Exit the program
    mov x8, #93  // Set the system call number for exit (93)
    mov x0, #0   // Set the exit status (0)
    svc #0       // Perform a system call to exit the program

        .data
array:      .quad      0,0,0,0,0,0,0,0,0,0
prompt: .asciz "Enter a number: "
tmpStr: .asciz "                     "  // A buffer for converting integers to strings
resultY: .asciz "y > x : "
newline: .byte 10  // ASCII code for a newline character
sumText: .asciz "The total sum of the array is: "

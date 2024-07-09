//GLOBAL
.equ MAX_BYTES, 21 // Maximum string size
.equ ARRAY_SIZE, 10 // Array size
.global _start

_start:
    mov x21, ARRAY_SIZE
    ldr x20, =array  // Load the address of the array
    mov x15, #0     // Initialize x15 (sum) to zero

get_numbers_loop:
    ldr x0, =prompt  // Load the address of the input prompt into x0
    bl putstring     // Display the input prompt
    mov x1, MAX_BYTES
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl getstring     // Call the getstring function to get user input
    ldr x0, =tmpStr  // Load the address of the tmpStr variable into x0
    bl ascint64      // Convert the input string to an integer and store it in x0
    str x0, [x20]    // Store the input number in the array
    add x15, x15, x0 // Add the input number to the sum
    add x20, x20, #8 // Move to the next element in the array
    sub x21, x21, #1 // Decrement the loop counter
    cbnz x21, get_numbers_loop

    ldr x0, =sum
    str x15, [x0] // Store the sum in the sum variable

    ldr x20, =array      // Load the address of array into x20
    mov x21, ARRAY_SIZE

display_numbers_loop:
    ldr x0, [x20]     // Load the value from the array
    ldr x1, =tmpStr   // Load the address of the tmpStr variable into x1
    bl int64asc       // Convert the integer to a string
    ldr x0, =tmpStr   // Load the address of tmpStr into x0
    bl putstring      // Display the converted value
    ldr x0, =tab
    bl putstring
    add x20, x20, #8  // Move to the next element in the array
    sub x21, x21, #1  // Decrement the loop counter
    cbnz x21, display_numbers_loop

display_sum:
    ldr x0, =newline   // Load the address of newline into x0
    bl putch           // Display a newline
    ldr x0, =sumText   // Load the address of sumText
    bl putstring       // Display the sumText
    ldr x0, =sum       // Load the address of the sum variable into x0
    ldr x0, [x0]       // Load the value stored in the sum variable
    ldr x1, =tmpStr    // Load the address of tmpStr variable into x1
    bl int64asc        // Convert the value in x0 to a string
    ldr x0, =tmpStr    // Load the address of tmpStr into x0
    bl putstring       // Display the converted value
    ldr x0, =newline   // Load the address of newline into x0
    bl putch           // Display a newline

exit:
    // Exit the program
    mov x8, #93  // Set the system call number for exit (93)
    mov x0, #0   // Set the exit status (0)
    svc #0       // Perform a system call to exit the program

.data
array:      .quad      0,0,0,0,0,0,0,0,0,0
sum:        .quad      0
prompt: .asciz "Enter a number: "
tmpStr: .asciz "                     "  // A buffer for converting integers to strings
newline: .byte 10  // ASCII code for a newline character
tab: .asciz "\t"
sumText: .asciz "The total sum of the array is: "

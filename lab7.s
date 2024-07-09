.global _start  // Declare the _start label as global (the program entry point)
_start:
    // LOAD
    // Load bA
    mov w0, #155       //move 155 into w0
    ldr x1, =bA         //load bA address into x1
    strb w0, [x1]       //store 155 in bA

    // Load chInit
    mov w0, 'j'         //move j into w0
    ldr x1, =chInit     //load chInit address into x1
    strb w0, [x1]        //store j in chInit

    // load u16hi
    mov w0, #88
    ldr x1, =u16Hi
    strh w0, [x1]

    // Load wAlt
    ldr x0, =wAlt   // Load the address of the wAlt array into x
    // Store values into wAlt[0]
    mov w1, #16      // Example value to store
    strh w1, [x0]    // Store the value in w1 at the address in x0
    add x0, x0, #4  // Move to the next element in the array (4 bytes offset)
    // Store values into wAlt[1]
    mov w1, #-1     // Example value to store
    str w1, [x0]    // Store the value in w1 at the address in x0
    add x0, x0, #4  // Move to the next element in the array (4 bytes offset)
    // Store values into wAlt[2]
    mov w1, #-2      // Example value to store
    str w1, [x0]    // Store the value in w1 at the address in x

    // Load dbBig
    mov x0, #9223372036854775807    //move value into x0
    ldr x1, =dbBig                  //load address of dbBig into x1
    str x0, [x1]                    //store value into dbBig
    // OUTPUT

    // Load and output bA
    ldr x0, =bALabel // Load the address of the bALabel into x0
    bl putstring    // Call the putstring function to output the label
    ldr x0, =bA      // Load the address of the bA variable into x0
    ldrb w0, [x0]    // Load a byte from the address in x0 into w0
    ldr x1, =tmpStr  // Load the address of tmpStr into x1
    bl int64asc      // Convert the byte in w0 to a string in tmpStr
    ldr x0, =tmpStr  // Load the address of tmpStr into x0
    bl putstring     // Call the putstring function to output the string in tmpStr
    ldr x0, =newline // Load the address of newline into x0
    bl putch         // Call the putch function to output a newline character

    // Load and output chInit
    ldr x0, =chInitLabel  // Load the address of the chInitLabel into x0
    bl putstring          // Call the putstring function to output the label
    ldr x0, =apostrophe   // Load the address of the apostrophe character into x0
    bl putch              // Call the putch function to output an apostrophe
    ldr x0, =chInit       // Load the address of the chInit variable into x0
    bl putch              // Call the putch function to output the character in chInit
    ldr x0, =apostrophe   // Load the address of the apostrophe character into x0
    bl putch              // Call the putch function to output an apostrophe
    ldr x0, =newline      // Load the address of newline into x0
    bl putch              // Call the putch function to output a newline character

    // Load and output u16Hi
    ldr x0, =u16HiLabel   // Load the address of the u16HiLabel into x0
    bl putstring          // Call the putstring function to output the label
    ldr x0, =u16Hi        // Load the address of u16Hi into x0
    ldrh w0, [x0]         // Load the halfword at the address in x0 into w0
    ldr x1, =tmpStr       // Load the address of tmpStr into x1
    bl int64asc           // Convert the halfword in w0 to a string in tmpStr
    ldr x0, =tmpStr       // Load the address of tmpStr into x0
    bl putstring          // Call the putstring function to output the string in tmpStr
    ldr x0, =newline      // Load the address of newline into x0
    bl putch              // Call the putch function to output a newline character

    // Load and output wAlt[0]
    ldr x0, =wAltLabel0   // Load the address of the wAltLabel0 into x0
    bl putstring          // Call the putstring function to output the label
    ldr x0, =wAlt         // Load the address of the wAlt array into x0
    ldrh w0, [x0]          // Load the first word from the array into w0
    ldr x1, =tmpStr       // Load the address of tmpStr into x1
    bl int64asc           // Convert the word in w0 to a string in tmpStr
    ldr x0, =tmpStr       // Load the address of tmpStr into x0
    bl putstring          // Call the putstring function to output the string in tmpStr
    ldr x0, =newline      // Load the address of newline into x0
    bl putch              // Call the putch function to output a newline character

    // Load and output wAlt[1]
    ldr x0, =wAltLabel1   // Load the address of the wAltLabel1 into x0
    bl putstring          // Call the putstring function to output the label
    ldr x0, =wAlt         // Load the address of the wAlt array into x0
    ldr w0, [x0, #4]      // Load the second from the array into w0
    sxtw x0, w0           // Sign-extend the loaded word to x0
    ldr x1, =tmpStr       // Load the address of tmpStr into x1
    bl int64asc           // Convert the word in w0 to a string in tmpStr
    ldr x0, =tmpStr       // Load the address of tmpStr into x0
    bl putstring          // Call the putstring function to output the string in tmpStr
    ldr x0, =newline      // Load the address of newline into x0
    bl putch              // Call the putch function to output a newline character

    // Load and output wAlt[2]
    ldr x0, =wAltLabel2   // Load the address of the wAltLabel2 into x0
    bl putstring          // Call the putstring function to output the label
    ldr x0, =wAlt         // Load the address of the wAlt array into x0
    ldr w0, [x0, #8]      // Load the third from the array into w0
    sxtw x0, w0           // Sign-extend the loaded word to x0
    ldr x1, =tmpStr       // Load the address of tmpStr into x1
    bl int64asc           // Convert the word in w0 to a string in tmpStr
    ldr x0, =tmpStr       // Load the address of tmpStr into x0
    bl putstring          // Call the putstring function to output the string in tmpStr
    ldr x0, =newline      // Load the address of newline into x0
    bl putch              // Call the putch function to output a newline character

    // Load and output szMsg1
    ldr x0, =szMsg1Label  // Load the address of the szMsg1Label into x0
    bl putstring          // Call the putstring function to output the label
    ldr x0, =szMsg1       // Load the address of szMsg1 into x0
    bl putstring          // Call the putstring function to output the string in szMsg1
    ldr x0, =newline      // Load the address of newline into x0
    bl putch              // Call the putch function to output a newline character

    // Load and output dbBig
    ldr x0, =dbBigLabel   // Load the address of the dbBigLabel into x0
    bl putstring          // Call the putstring function to output the label
    ldr x0, =dbBig        // Load the address of dbBig into x0
    ldr x0, [x0]          // Load the quadword from the address in x0 into x0
    ldr x1, =tmpStr       // Load the address of tmpStr into x1
    bl int64asc           // Convert the quadword in x0 to a string in tmpStr
    ldr x0, =tmpStr       // Load the address of tmpStr into x0
    bl putstring          // Call the putstring function to output the string in tmpStr
    ldr x0, =newline      // Load the address of newline into x0
    bl putch              // Call the putch function to output a newline character

    // Exit the program
    mov x8, #93  // Set the system call number for exit (93)
    mov x0, #0   // Set the exit status (0)
    svc #0       // Perform a system call to exit the program

    .data
bA:        .skip        1
chInit:    .skip        1
u16Hi:   .hword    0
wAlt:      .word      0, 0, 0
szMsg1: .asciz        "And Sally"
dbBig:    .quad      0
tmpStr:    .asciz       "                     "
newline: .byte 10  // ASCII code for a newline character
apostrophe:     .byte '''  // ASCII code for an apostrophe character
bALabel:    .asciz "bA = "
chInitLabel:     .asciz "chInit = "
u16HiLabel:     .asciz "u16Hi = "
wAltLabel0:     .asciz "wAlt[0] = "
wAltLabel1:     .asciz "wAlt[1] = "
wAltLabel2:     .asciz "wAlt[2] = "
szMsg1Label:    .asciz "szMsg1 = "
dbBigLabel:    .asciz "dbBig = "

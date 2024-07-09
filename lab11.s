.global _start

_start:
    // x0 contains string size as int

    // Step 3: Call malloc to allocate memory
    bl malloc
    // x0 now contains the address of the allocated memory

    // Store the address in ptrString
    ldr x1, =ptrString
    str x0, [x1]

    // Copy szX to the allocated memory
    ldr x2, =szX
    bl copy_string

    mov x3, #' '
    strb w3, [x0]
    add x0, x0, #1

    // Copy szY to the allocated memory
    ldr x2, =szY
    bl copy_string

    mov x3, #'\n'
    strb w3, [x0]
    add x0, x0, #1
    
    // Print the resulting string
    ldr x0, =ptrString
    ldr x0, [x0]
    bl putstring

    // Step 4: Free the allocated memory
    ldr x0, =ptrString
    ldr x0, [x0]
    bl free

    // Exit the program
    mov x8, #93 // syscall number for exit
    mov x0, #0 // exit status
    svc #0

copy_string:
    // Load a character from the source into x3
    ldrb w3, [x2]
    add x2, x2, #1
    // Check if the character is null (end of the string)
    cbz w3, end_copy // If it's null, exit the loop
    // Store the character in the allocated memory
    strb w3, [x0]
    add x0, x0, #1

    // Repeat the loop
    b copy_string

end_copy:
    ret

.data
szX: .asciz "Cat in the hat."
ptrString: .quad 0

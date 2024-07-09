    .equ W, 0101
    .equ RW_RW___, 0660
    .equ AT_FDCWD, -100
    
.global _start

_start:

    mov x0, #AT_FDCWD
    mov x8, #56
    ldr x1, =szFile

    mov x2, #W
    mov x3, #RW_RW___
    svc #0

    ldr x1, =iFD
    strb w0, [x1]

    mov x8, #64
    ldr x1, =szX
    mov x2, #16
    svc 0

last:

    ldr x0, =iFD
    ldrb w0, [x0]
    mov x8, #57
    svc 0

_exit:

    // Exit the program
    mov x8, #93        // syscall number for exit
    mov x0, #0         // exit status
    svc #0

.data
szX: .asciz "Cat in the hat.\n"
szFile: .asciz "output.txt"  
iFD: .byte 0

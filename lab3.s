    .global _start
_start:
    // Convert szX from ASCII to an integer and store it in dbX
    ldr x0, =szX
    bl ascint64
    ldr x1, =dbX
    str x0, [x1]

    // Convert szY from ASCII to an integer and store it in dbY
    ldr x0, =szY
    bl ascint64
    ldr x1, =dbY
    str x0, [x1]

    // Calculate the sum of dbX and dbY and store it in dbSum
    ldr x0, =dbX
    ldr x0, [x0]
    ldr x1, =dbY
    ldr x1, [x1]
    add x2, x0, x1
    ldr x1, =dbSum
    str x2, [x1]

    // Display the output
    ldr x0, =szX
    bl putstring
    ldr x0, =plus
    bl putstring
    ldr x0, =szY
    bl putstring
    ldr x0, =equal
    bl putstring
    ldr x0, =dbSum
    ldr x0, [x0]
    ldr x1, =result
    bl int64asc
    ldr x0, =result
    bl putstring
    ldr x0, =newline
    bl putch

    // Exit the program
    mov x8, #93
    mov x0, #0
    svc #0

    .data
szX: .asciz "10"
szY: .asciz "15"
dbX: .quad 0
dbY: .quad 0
dbSum: .quad 0
result: .asciz "                     "
plus: .asciz " + "
equal: .asciz " = "
newline: .byte 10

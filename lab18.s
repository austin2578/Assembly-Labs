

    .global _start
_start:

    ldr x0, =str1
    bl malloc_and_copy
    // Set headPtr to point to the first node
    bl add_node_to_list
    ldr x0, =str2
    bl malloc_and_copy
    bl add_node_to_list
    ldr x0, =str3
    bl malloc_and_copy
    bl add_node_to_list
    ldr x0, =str4
    bl malloc_and_copy
    bl add_node_to_list
    ldr x0, =str5
    bl malloc_and_copy
    bl add_node_to_list

    bl print_strings

    //Free the allocated memory and linked list nodes
    b free_memory
malloc_and_copy:
    mov x21, x0        // Store the original string address
    str LR, [SP, #-16]!
    bl String_length
    mov x20, x0        // Store the length of the string
    bl malloc
    // Store the address in ptrString
    ldr x1, =ptrString
    str x0, [x1]
    mov x2, x21        // Restore the original string address
    bl copy_string

    mov x0, #16  // 16 bytes for the newNode
    bl malloc
    // Store the address in newNode
    ldr x1, =newNode
    str x0, [x1]

    // Load the address of the newNode into x0
    ldr x0, [x1]

    // Load the address of the previously malloc'd string into x1
    ldr x1, =ptrString
    ldr x1, [x1]
    // Set the newNode's data element to the address of the string
    str x1, [x0]

    // Set the newNode's next element to null (0)
    str xzr, [x0, #8]

    ldr LR, [SP], #16
    ret

add_node_to_list:
    // Load the address of the new node into x0
    ldr x0, =newNode
    ldr x0, [x0]

    // If the list is empty, set both head and tail to the new node
    ldr x1, =headPtr
    ldr x1, [x1]
    cbz x1, list_empty
    // If the list is not empty, find the current tail node
    ldr x2, =tailPtr
    ldr x2, [x2]
    ldr x3, [x2, #8]  // Load the next node (should be null)
    cbz x3, list_not_empty  // If the next node is null, the current node is the tail
    // If it's not null, keep traversing the list to find the tail
traverse_list:
    ldr x2, [x2, #8]  // Move to the next node
    ldr x3, [x2, #8]  // Check if the next node is null
    cbnz x3, traverse_list
list_not_empty:
    // Update the next pointer of the current tail node to the new node
    str x0, [x2, #8]
    b end_add_node
list_empty:
    // If the list is empty, both head and tail should point to the new node
    ldr x1, =headPtr
    str x0, [x1]
    ldr x1, =tailPtr
    str x0, [x1]  // Update tailPtr to point to the new node
end_add_node:
    ret

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

print_strings:
    // Load the address of the head node into x21
    ldr x21, =headPtr
    add x21,x21,#8
    ldr x22, [x21] // Load the address of the first node
    str LR, [SP, #-16]!
    
print_loop:
    // Check if x21 (the current node) is null (end of the list)
    mov x21,x22
    cbz x22, end_print // If it's null, exit the loop
    cbz x21, end_print // If it's null, exit the loop
    // Load the address of the string in the current node into x0
    ldr x0, [x22]
    cbz x0, end_print
    // Call putstring to print the string
    bl putstring

    // Load the address of the next node into x21 (x21 now points to the next node)
    add x21,x21,#8
    ldr x22, [x21]

    // Repeat the loop
    b print_loop

end_print:
    ldr LR, [SP], #16
    ret

free_memory:
    // Load the address of the head node into x0
    ldr x21, =headPtr
    add x21,x21,#8
    ldr x22, [x21] // Load the address of the first node

free_loop:
    // Check if x21 (the current node) is null (end of the list)
    mov x21,x22
    cbz x22, end_free // If it's null, exit the loop
    cbz x21, end_free // If it's null, exit the loop
    // Load the address of the string in the current node into x0
    ldr x0, [x22]
    cbz x0, end_free
    // Call putstring to print the string
    bl free

    // Load the address of the next node into x21 (x21 now points to the next node)
    add x21,x21,#8
    ldr x22, [x21]

    // Repeat the loop
    b free_loop

end_free:
    ldr x0, =memFree
    bl putstring
    mov x8, #93        // syscall number for exit
    mov x0, #0         // exit status
    svc #0

    .data
str1:  .asciz "The Cat in the Hat\n"
str2:  .asciz "\n"
str3:  .asciz "By Dr. Seuss\n"
str4:  .asciz "\n"
str5:  .asciz "The sun did not shine.\n"
memFree: .asciz "\nMemory has been freed\n"
newNode:  .quad  0
headPtr:  .quad 0
tailPtr:  .quad  0
ptrString: .quad 0

    .data
    float1: .single 2.343
    float2: .single 5.3
    result1: .single 0.0

    float3: .single 3.5343425445
    float4: .single 1.534443455
    result2: .single 0.0

    float5: .single 3.14e12
    float6: .single 5.55e-10
    result3: .single 0.0

.global _start
.text
_start:

    // Load and add the first pair of floating-point numbers
    ldr x0, =float1
    ldr d0, [x0]
    ldr x0, =float2
    ldr d1, [x0]
    fadd d2, d0, d1
    ldr x0, =result1
    str d2, [x0]

pause1:

    // Load and add the second pair of floating-point numbers
    ldr x0, =float3
    ldr d0, [x0]
    ldr x0, =float4
    ldr d1, [x0]
    fadd d2, d0, d1
    ldr x0, =result2
    str d2, [x0]

pause2:

    // Load and add the third pair of floating-point numbers
    ldr x0, =float5
    ldr d0, [x0]
    ldr x0, =float6
    ldr d1, [x0]
    fadd d2, d0, d1
    ldr x0, =result3
    str d2, [x0]
    b end
end:
	mov	x0,#0
	mov x8,#93
	svc	0




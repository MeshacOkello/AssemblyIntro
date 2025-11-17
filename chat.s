    .section .data
a: .word 13
b: .word 12
result: .word 0
    .section .text
    .global main
main:
    adrp x0, a
    add x0, x0, :lo12:a
    ldr w1, [x0]

    adrp x0, b
    add x0, x0, :lo12:b
    ldr w2, [x0]

    adrp x7, result
    add x7, x7, :lo12:result
    ldr w3, [x7]

    cmp w1, w2
    beq equal
    blt less

    mov w4, #1
    str w4, [x7]
    b end
equal:
    mov w4, wzr
    str w4, [x7]
    b end
less:  
    mov w4, #1
    neg w4, w4
    str w4, [x7]
  
end:
    mov w0, 0
    ret


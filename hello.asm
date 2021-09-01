RETURN      = $0D
CHROUT      = $FFD2

.org $080D
.segment "STARTUP"
.segment "INIT"
.segment "ONCE"
.segment "CODE"

    jmp start

data: .byte "hello world", RETURN

start:
    ldx #0
string_loop:
    lda data,x
    cmp #RETURN
    beq end_string_loop
    jsr CHROUT
    inx
    jmp string_loop
end_string_loop:
    rts

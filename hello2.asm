RETURN      = $0D
CHROUT      = $FFD2
ZP_PTR      = $30

.org $080D
.segment "STARTUP"
.segment "INIT"
.segment "ONCE"
.segment "CODE"

    jmp start

data: .byte "hello world", RETURN

start:
    lda #<data
    sta ZP_PTR
    lda #>data
    sta ZP_PTR+1
    ldy #0
@string_loop:
    lda (ZP_PTR),y
    cmp #RETURN
    beq @end_string_loop
    jsr CHROUT
    iny
    bra @string_loop
@end_string_loop:
    rts

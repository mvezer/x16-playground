; prints out decimal numbers

RETURN      = $0D
SPACE       = $20
CHROUT      = $FFD2
ZP_PTR      = $30
NUMBERS_COUNT = 6

.org $080D
.segment "STARTUP"
.segment "INIT"
.segment "ONCE"
.segment "CODE"

   jmp start

numbers_to_print: .byte 255, 0, 13, 1, 99, 111

print_decimal:
   phy
   ldy #0
@l1:
   cmp #100
   bcc @tens
   sec
   sbc #100
   iny
   bra @l1
@tens:
   jsr print_digit
   ldy #0
@l2:
   cmp #10
   bcc @ones
   sec
   sbc #10
   iny
   bra @l2
@ones:
   jsr print_digit
   ora #$30
   jsr CHROUT
   ply
   rts

print_digit:
   pha
   tya
   ora #$30
   jsr CHROUT
   pla
   rts

start:
   lda #<numbers_to_print
   sta ZP_PTR
   lda #>numbers_to_print
   sta ZP_PTR+1
   ldy #0
@l0:
   lda (ZP_PTR),y
   jsr print_decimal
   tya
   cmp #NUMBERS_COUNT - 1
   beq @end
   lda #SPACE
   jsr CHROUT
   iny
   bra @l0
@end:
   rts


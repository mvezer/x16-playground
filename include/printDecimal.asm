.macro print_decimal_8bit_unsigned
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
.endmacro

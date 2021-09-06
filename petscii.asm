.include "include/printDecimal.asm"

RETURN      = $0D
SPACE       = $20
CHROUT      = $FFD2
GETIN       = $FFE4
ZP_PTR      = $30
NUMBERS_COUNT = 6

.org $080D
.segment "STARTUP"
.segment "INIT"
.segment "ONCE"
.segment "CODE"

   jmp start

print_decimal_8bit_unsigned

start:
@wait_for_key:
   jsr GETIN
   cmp #0
   beq @wait_for_key
   jsr CHROUT
   pha
   lda #SPACE
   jsr CHROUT
   pla
   jsr print_decimal
   lda #RETURN
   jsr CHROUT
   bra @wait_for_key
   
;    lda #<numbers_to_print
;    sta ZP_PTR
;    lda #>numbers_to_print
;    sta ZP_PTR+1
;    ldy #0
; @l0:
;    lda (ZP_PTR),y
;    jsr print_decimal
;    tya
;    cmp #NUMBERS_COUNT - 1
;    beq @end
;    lda #SPACE
;    jsr CHROUT
;    iny
;    bra @l0
; @end:
;    rts

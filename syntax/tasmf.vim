" Vim Syntax File for a Typist's Assembler Notation in Forth 
" Language: Assembler (65816 8/16-bit CPU) 
" Maintainer: Scot W. Stevenson <scot.stevenson@gmail.com>
" Latest Revision: 25. Sep 2015

" This script is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. Use at your
" own risk.

" Don't load this file twice
if exists("b:current_syntax")
	finish
endif

" Visually mark the columns where the label directive and the 
" mnemonics go. You probably don't want to use it because it looks 
" like crap, but here you go.
" hi ColorColumn ctermbg=LightCyan
" set cc=2,3,20,21,22

" === Basic Setup ===
setlocal iskeyword=!,@,33-35,%,$,38-64,91-96,a-z,123-126,128-255
setlocal ts=4 shiftwidth=4 expandtab tw=80 nowrap number fo=cronq1

" === Keyword Lists ===

" Define Numbers
" Note we need spaces so we don't match every single number
syn match tasmNumber ' \d\+ ' display 
syn match tasmNumber ' [-+]\d+ ' display 
syn match tasmNumber ' \x\+ ' display 
syn match tasmNumber ' [-+]\x+ ' display 

" Keywords for normal 65816 assember mnemonics 
syn keyword tasmMnemonics 
    \ adc adc.# adc.d adc.dil adc.di adc.diy adc.dily adc.dx adc.dxi adc.l 
    \ adc.lx adc.s adc.siy adc.x adc.y 
    \ and. and.# and.d and.di and.dil and.dily and.diy and.dx and.dxi 
    \ and.l and.lx and.s and.siy and.x and.y asl asl.a asl.d 
    \ asl.dx asl.x
    \ bit bit.# bit.d bit.dxi bit.x 
    \ clc cld cli clv cop
    \ cmp cmp.# cmp.d cmp.di cmp.dil cmp.diy cmp.dily cmp.dx cmp.dxi 
    \ cmp.l cmp.lx cmp.s cmp.x cmp.y cmp.siy
    \ cpx cpx.# cpx.d
    \ cpy cpy.# cpy.d
    \ dec dec.a dec.d dec.dx dec.x dex dey 
    \ eor eor.# eor.d eor.dil eor.diy eor.di eor.dx eor.dxi eor.l eor.lx
    \ eor.s eor.siy 
    \ eor.x eor.y 
    \ inc inc.a inc.d inc.dx inc.x  
    \ inx iny
    \ lda lda.# lda.d lda.di lda.dil lda.diy lda.dily lda.dx
    \ lda.dxi lda.l lda.lx lda.s lda.siy lda.x lda.y 
    \ ldx ldx.# ldx.d ldx.y
    \ ldy ldy.# ldy.d ldy.dx ldy.x
    \ lsr lsr.a lsr.d lsr.dily lsr.dx lsr.x
    \ mvn mvp
    \ ora ora.# ora.d ora.di ora.dil ora.diy ora.dily ora.dx ora.dxi ora.l 
    \ ora.lx ora.s ora.x ora.y ora.siy
    \ pha phb phd phe.# phe.d phe.r phk php phx phy 
    \ pla plb pld plp plx ply
    \ rol rol.a rol.d rol.dx rol.x
    \ ror ror.a ror.d ror.dx ror.x
    \ sbc sbc.# sbc.d sbc.di sbc.dil sbc.dily sbc.diy sbc.dx sbc.dxi 
    \ sbc.l sbc.lx sbc.s sbc.siy sbc.x sbc.y
    \ sec sed sei 
    \ sta sta.d sta.di sta.dil sta.dily sta.diy sta.dx sta.dxi 
    \ sta.l sta.lx sta.s sta.siy sta.x sta.y
    \ stx stx.d stx.dy
    \ sty sty.d sty.dx
    \ stz stz.d stz.dx stz.x
    \ tax tay tcd tcs tdc trb trb.d tsb tsb.d tsc tsx txa txs txy tya tyx
    \ wai
    \ xba xce

" Keywords for 65816 branch and jump instructions
syn keyword tasmFlow 
    \ bra bra.l 
    \ bcc bcs beq bmi bne bpl bvc bvs
    \ jmp jmp.i jmp.il jmp.l jmp.xi jsr jsr.l jsr.xi
    \ rts rts.l rti 

" Keywords for 65816 special mnemonics (stp, rep ) 
syn keyword tasmSpecial brk rep sep stp wai

" Keywords for 65816 traditional instructions (pea, pei)
syn keyword tasmLegacy brl jml jsl pea pei per rtl  

" Keywords for 65816 functional nops (nop, wdm)  
syn keyword tasmBoring nop wdm

" Keywords for directives (without labels) 
syn keyword tasmDirective 
    \ advance emulated end mode? native origin 
    \ a:8 a:16 xy:8 xy:16 axy:8 axy:16 a=8? a=16? xy=8? xy=16?
    \ b, w, lw, str, str0, strlf, lsb msb bank save

" Keywords for label directives (without the label marker)
syn keyword tasmLabelDirs <j <jl <b <bl <a <al <r <rl

" Keywords for the label marker 
syn keyword tasmLabelMark -> 

" Keywords for important and common Forth commands
syn keyword tasmForth binary decimal hex value dump

" Keywords for programmer's notes
syn keyword tasmTodo TODO CHECK FEHLT FIXME


" === All Other Definitions ===

" Define comments. Note this is acutally Forth 
syn match tasmComment "\v\\.*$"
syn region tasmComment start=' ( ' end=')'

" Define Strings. We only use one of the Forth types
syn region tasmString start='s"' end='"'


" === Define our own color system === 

hi tasmBoring ctermfg=LightGrey
hi tasmDirective ctermfg=Magenta
hi tasmForth ctermfg=Magenta
hi tasmFlow ctermfg=blue
hi tasmLabelDirs ctermfg=blue
hi tasmLabelMark ctermfg=blue 
hi tasmMnemonics cterm=bold
hi tasmSpecial ctermfg=red

" === Link definitions === 

hi def link tasmLegacy     Error
hi def link tasmComment    Comment 
hi def link tasmNumber     Constant
hi def link tasmString     String
hi def link tasmTodo	   Todo

" We're done
let b:current_syntax = "tasmf"

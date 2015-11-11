Vim Syntax Plugin for Typist's Assembler Notation for the 6502 and 65816
Scot W. Stevenson <scot.stevenson@gmail.com>
First version: 28. Jul 2015
This version: 11. Nov 2015

Typist's Assembler Notation (TAN) is an alternative assembler notation for the
6502 and 65816 8/16-bit CPUs. There are two versions: One in "normal" prefix notation (mnemonic before operand), and one in "Forth" postfix notation (operand before mnemonic). These two vim syntax files provide highlighting for source code written in TAN in both versions. 

See https://github.com/scotws/tasm65816 for details about the notation.

These scripts have not been extensively tested and should be considered BETA.


INSTALLING

Copy syntax/tasmf.vim and/or syntax/tasm.vim to your own syntax file, usually
in ~/.vim/syntax , and the ftdetect/tasmf.vim to ~/.vim/ftdetect/ . Optionally,
you can add the following lines to your .vimrc file: 

  " === Typist's Assembler Postfix Settings (.tasmf) ===
  " Part of these are overwritten by the tasmf.vim syntax file
  augroup tasmf
      au!
      au BufNewfile *.tasmf :exe "normal i\\ \<cr>\<left>\<left>
          \\\ YOUR NAME HERE  <YOUR EMAIL ADDRESS HERE>\<cr>\<left>
          \\\ First version: \<C-R>=strftime('%d. %b %Y')\<esc>\<cr>\<left>
          \\\ This version: \<C-R>=strftime('%d. %b %Y')\<esc>\<cr>\<cr>
          \ \<up>\<up>\<up>\<up>\<up>\<right> " 
      au BufNewFile *.tasmf startinsert
  augroup END

  " === Typist's Assembler Prefix Settings (.tasm) ===
  " Part of these are overwritten by the tasmf.vim syntax file
  augroup tasm
      au!
      au BufNewfile *.tasm :exe "normal i\\ \<cr>\<left>\<left>
          \\\ YOUR NAME HERE  <YOUR EMAIL ADDRESS HERE>\<cr>\<left>
          \\\ First version: \<C-R>=strftime('%d. %b %Y')\<esc>\<cr>\<left>
          \\\ This version: \<C-R>=strftime('%d. %b %Y')\<esc>\<cr>\<cr>
          \ \<up>\<up>\<up>\<up>\<up>\<right> " 
      au BufNewFile *.tasm startinsert
  augroup END

These lines create a header for new files. 


FILE SUFFIXES

The script recognizes the following suffix: 

   .tasm        Normal (prefix) Typist's Assembler Notation
   .tasmf       Forth (postfix) Typist's Assembler Notation 


KNOWN PROBLEMS

The script is not able to distinguish between hex numbers and instructions that
are composed of hex digits. This affects ADC, BCC, and DEC (in the code we take
care of this by prefixing all hex numbers with zeros). This problem is
cosmetic.


LICENSE

This code is released into the public domain. Still: This program is
distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
without even the implied warranty of MERCHANTABILITY or FITNESS FOR
A PARTICULAR PURPOSE. Use at your own risk.

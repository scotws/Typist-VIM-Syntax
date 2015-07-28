A vim syntax plugin for the Typist's Assembler Notation in Forth 
Scot W. Stevenson <scot.stevenson@gmail.com>
First version: 28. Jul 2015
This version: 29. Jul 2015


Typist's Assembler Notation (TAN) is an alternative assembler notation for the
65816 8/16-bit CPU, the big brother of the famous 6502. In its version for
Forth, it follows the postfix notation (operand before mnemonic). This vim
syntax file provides syntax highlighting for source code written in TAN in
Forth. See https://github.com/scotws/tasm65816 for details about the notation.

This script has not been extensively tested and should be considered BETA.


INSTALLING

Copy syntax/tasmf.vim to your own syntax file, usually in ~/.vim/syntax , and
the ftdetect/tasmf.vim to ~/.vim/ftdetect/ . Optionally, you can add the
following lines to your .vimrc file: 

  " === Typist's Assembler in Forth Settings (.tasmf) ===
  " Part of these are overwritten by the tasmf.vim syntax file
  augroup tasmf
      au!
      au BufNewfile *.tasmf :exe "normal i\\ \<cr>\<left>\<left>
          \\\ Scot W. Stevenson <scot.stevenson@gmail.com>\<cr>\<left>
          \\\ First version: \<C-R>=strftime('%d. %b %Y')\<esc>\<cr>\<left>
          \\\ This version: \<C-R>=strftime('%d. %b %Y')\<esc>\<cr>\<cr>
          \ \<up>\<up>\<up>\<up>\<up>\<right> " 
      au BufNewFile *.tasmf startinsert
  augroup END

These lines create a header for new files. 


FILE SUFFIXES

The script recognizes the following suffix: 

   .tasmf       Forth (prefix) Typist's Assembler Notation 

At some point, there will be a "conventional" assembler for "normal" TAN: 

   .tasm        Normal (postfix) Typist's Assembler Notation

Currently, however, no such assembler or files exit.


TODO 

It would be nice to highlight label names. 


KNOWN PROBLEMS

The script is not able to distinguish between hex numbers and instructions that
are composed of hex digits. This affects ADC, BCC, and DEC (in the code we take
care of this by prefixing all hex numbers with zeros). This problem is
cosmetic.


LICENSE

This code is released into the public domain. 

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
A PARTICULAR PURPOSE. Use at your own risk.

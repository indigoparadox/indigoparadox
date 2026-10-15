
; dnl :title: X86 Assembly: Hello!
;
; dnl :section: tutorials
;
; This series of articles on x86 assembly is a set of notes we're making as
; we learn DOS x86 assembly in a more systematic way than we've done so before.
; It is placed here in the hope it will be helpful (not least of all to us).
; If you have questions comments, ideas, or concerns, as always,
; please iwz_let_us_know!
;
; These articles all use syntax for iwz_a([https://www.nasm.us/], [NASM]),
; which is freely available and even works on DOS!
;
; This file can be compiled with the command
; iwz_cmd([nasm -f bin -o x86hello.com x86hello.asm]) to produce x86hello.com.
;
; dnl :sect: The Code: Preamble
;
; These statements are instructions to nasm, rather than the CPU. They setup
; some assumptions that will help the assembler warn us of issues down the line.
;
bits 16 ; Assume we're using 16-bit instructions by default.
org 100h ; Tell the assembler where the program will be loaded.
cpu 186 ; Tell the assembler not to allow instructions for the 286+.

; dnl :sect: The Code: Start Procedure
;
start:

; There are four general-purpose 16-bit registers: ax, bx, cx, and dx.
; Each is divided into high and low bytes, and can be addressed as such e.g.
; by using ah (OOXXh) and al (XXOOh) (where OO is the byte being accessed).
;
; DOS also provides interrupt 21h as a "catch-all" which performs different
; functions depending on what the byte in ah is set to when it is called.
;
; In our example here, ah is set to 09h (the equivalent for the full ax register
; being 0900h). This is the index of the function that prints a
; string at the pointer placed in the dx register, terminated by a '$' symbol.
;
   mov ax, 900h ; Print-string-until-$-char service.
   mov dx, hello ; Place a pointer to the hello string in the dx register.
   int 21h ; Call function handler interrupt.

; COM programs in DOS should call the DOS "terminate" function when they are
; finished. This lets DOS effectively clean up after us (to the extent that it
; does) and return to the command interpreter.
;
   mov ah, 04ch ; Termination service.
   int 21h ; Call function handler interrupt.

; The concludes the code section.
;
; dnl :sect: The Code: Data Section
;
; We're building a COM file which, doesn't technically have sections, but nasm
; will kinda fake that for us. This lets us store e.g. strings in an organized
; fashion for use above.
;
[SECTION .data]

; This is our string. db means "data bytes" and indicates a series of bytes,
; the string "pointer" is named for the label that precedes it, and it is
; terminated with a '$' symbol for the benefit of the iwz_func([0900h])
; function as described above.
;
hello: db "Hello!$"


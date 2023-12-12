
; dnl :title: X86 Assembly: Using the Stack to Pass Arguments
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
; Please see iwz_a_ipage([x86hello.html], [our Hello! example]) for
; basics not covered here.
;
; This file can be compiled with the command
; iwz_cmd([nasm -f bin -o x86stack.com x86stack.asm]) to produce x86hello.com.
;

; dnl :sect: The Code: Preamble and Start Procedure
;
bits 16 ; Assume we're using 16-bit instructions by default.
org 100h ; Tell the assembler where the program will be loaded.
cpu 186 ; Tell the assembler not to allow instructions for the 286+.

start:

; Our main focus in our main procedure is very simple: we push the argument
; (in this case, the address of our hello string) onto the stack, and then
; we call test_func.
;
   push hello ; Push a pointer to the hello string onto the stack.
   call test_func ; Call our test function.

; When we're done with test func, we still need to dispose of the argument we
; had pushed onto the stack. The ret instruction in test_func only removes
; the return address... not anything we put onto the stack before the call!
;
   pop ax ; Dispose of pointer to hello string by popping it to ax.

; Now we can freely overwrite ax (since we just wanted the value off the stack,
; and no longer care about it) and call our "exit to DOS" service.
;
   mov ax, 4c00h ; Termination service.
   int 21h ; Call function handler interrupt.

; dnl :sect: The Code: Test Function
;
test_func:

; First, we stow bp on the stack so we can get it back later. We then load the
; sp (stack pointer) register into bp. This is because, at least in 16-bit
; land, we can't refer to [sp + 4] like we refer to [bp + 4] below. The
; assembler will give us the error "invalid effective address" if we try.
;
   push bp ; Stow stack frame.
   mov bp, sp ; Put stack pointer on bp so we can do arithmetic below.

; With our preparation done, we can now operate on addresses relative to the
; stack pointer. In our example, we use [bp + 4]. This is bp, which we've
; pushed the stack pointer into, +2 bytes (1 word/16 bits) for the value of bp
; we pushed onto the stack above, and +2 bytes for the return address 
; (a 16-bit pointer) that the call instruction pushed onto the stack before
; jumping to test_func.
;
   mov dx, [bp + 4] ; Put the address of the char's location in si.
   mov ax, 900h ; Print-string-until-$-char service.
   int 21h ; Call function handler interrupt.

; Finally, we do our cleanup. This means restoring the previous value of bp
; before we pushed it onto the stack at the beginning of test_func, and then
; returning from the call instruction that brought us to test_func.
;
   pop bp ; Restore stack frame stored at start of midi_note_on.
   ret ; Return from the call.
 
; dnl :sect: The Code: Data Section
;
[SECTION .data]

hello: db "Hello!$"


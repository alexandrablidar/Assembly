;2. Modificati programul afisare.asm prezentat în lucrarea anterioarã,
; pentru a afisa un text introdus de la tastatura

.model small
.stack 200h
.data
;text db 'TASM',0
text db 100 DUP(?); ,0
.code
start:  mov ax,@data
        mov ds,ax
; punem val. 30 la OFFSEt 0 din bufferul fDOS 0Ah
        lea DI, text
        mov DX, DI  ; fDOS 0Ah presupune acolo inceputiul buff 
        
        mov [DI], 100; limita sir
        
        mov AH, 0Ah
        int 21h 
        
        mov CH, 0
        mov CL, [DI+1]
        
        mov DI, CX
        
        ; aici era greseala, lipsea add DI, 2 de mai jos
        ; si punea prematur terminatorul de sir, octetul de val. ZERO
        add DI, 2
        mov [DI], 0; terminator sir
    
        
        mov ah,0
        mov al,3  ; mod video 3 (tot un mod text, de rezol. 80X25)
        int 10h
        mov bh,0
        mov bl,1fh
        call linie
        mov ax,4c00h
        int 21h
        
linie:
        mov cx,1
        mov dx,0
linie_iar:
        lea si,text
        inc SI
        inc SI
iar:
        mov ah,2
        int 10h
        mov al,[si]
        cmp al,0
        jz endtext
        ;inc BL
        mov ah,9
        int 10h
        inc dl
        inc si
        cmp dl,80
        jnz iar
endtext:
        inc dh
        cmp dh,25
        jc linie_iar
        ret
    
        
END start 
ds:0
ES:0
;2. Modificati programul afisare.asm prezentat în lucrarea anterioarã,
; pentru a afisa un text introdus în linia de comandã. 

.model small
.stack 200h
.data
;text db 'TASM',0
text db 100 DUP(?); ,0
.code
start:  cld
        mov ax,@data
        mov ES, AX
        
        mov CL, [80h]
        mov CH, 0
        mov SI, 82h
        lea DI, text; mov DI, OFFSET text
        rep movsb
        ; pun terminatorul de sir, un oct de val. 0
        mov [DI], 0
       
        
        mov ax,@data
        mov ds,ax
        
        mov ah,0
        mov al,3
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
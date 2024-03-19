.model small
.stack
.data
VideoMode db ?
.code     

mov ax,@data
mov ds,ax  


mov ax,13h ;se seteaza modul 13
int 10h       
mov ah,0Ch ;scrierea unui pixel grafic la coordonate
mov al, 2   ;se seteaza culoarea
mov dx,50     ;linia/ randul
mov cx,0     ;coloana 


et2:int 10h
    inc cx
    cmp cx,30
    jb et2
    
    mov cx,60
    
et3:int 10h    
    inc cx
    cmp cx,90
    jb et3 
    
    mov cx,120
    
et4:int 10h
    inc cx
    cmp cx,150
    jb et4
    
    mov cx,180
    
et5:int 10h
    inc cx
    cmp cx,210
    jb et5
    
    mov cx,240
    
et6:int 10h
    inc cx
    cmp cx,270
    jb et6
         
    mov cx,300
    
et7:int 10h
    inc cx
    cmp cx,330
    jb et7         
         
end
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
mov cx,90     ;coloana 

et1:int 10h
    inc dx
    cmp dx,140
    jb et1
et2:int 10h
    inc cx
    cmp cx,180
    jb et2
et3:int 10h
    dec cx
    dec dx 
    cmp dx,50
    cmp cx,90
    ja et3
    end
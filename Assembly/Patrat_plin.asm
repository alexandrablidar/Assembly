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
mov dx,120     ;linia/ randul
mov cx,200     ;coloana

et1:int 10h
    inc dx
    cmp dx, 150
    jb et1
inc cx
mov dx,120
cmp cx,230
jb et1



end
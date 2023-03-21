.model small
.stack 100h
.data
    inmsg DB "Enter number between 0-3 : $"
    outmsg DB "Factorial: $"   
    
    n DB ?
    dv DB 2
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, inmsg
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h 
    
    sub al, 48
    
    mov bl, al
    mov al, 1
    mov n, 1
    
    cmp bl, 0
    je end
    
    repeat:
        mul n
        
        cmp bl, n
        je end
        inc n
        jmp repeat
    
    end:
       mov n, al
       
    call new_line
    lea dx, outmsg
    mov ah, 9
    int 21h
    mov dl, n 
    add dl, 48
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h
    
new_line proc
	 mov  ah, 2
	 mov  dl, 10
	 int  21h
	 mov  dl, 13
	 int  21h
	 ret
new_line endp

end main
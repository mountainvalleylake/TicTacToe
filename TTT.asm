;Alabi Mehzabin Anisha 1305094 B2
.Model Small
draw_row Macro x
    Local l1
    ; draws a line in row x from col 100 to col 400
    mov ah, 0ch
    ; color chosen
    mov cx, 100
    mov dx, x
L1: int 10h
    inc cx
    cmp cx, 400
    jl L1
    endM

draw_col Macro y
    Local l2
; draws a line col y from row 100 to row 400
    mov ah, 0ch
    ; color chosen
    mov cx, y
    mov dx, 100
L2: int 10h
    inc dx
    cmp dx, 400
    jl L2
endM

.Stack 100h 
.Data 
tic_tac_toe dw 9 dup(0) 
playerX     dw 8 dup(0)
playerO     dw 8 dup(0)
msg1        db "Player1 Wins$"
msg2        db "Player2 Wins$"
msg3        db "Its a Tie$"
num         dw 0
countx      dw 0 
counto      dw 0
count       dw 1
winner      dw 0 
start_row   dw 0
finish_row  dw 0
start_col   dw 0
finish_col  dw 0
row         dw 0
col         dw 0 
pos         dw 0
.Code

draw_box_row proc
    mov ah,0ch
    LabelR:
        int 10h
        inc cx
        dec bx
        cmp bx,0
        jg LabelR
    ret
draw_box_row endp
draw_box_col proc
    mov ah,0ch
    LabelC:
        int 10h
        inc dx
        dec bx
        cmp bx,0
        jg LabelC
    ret
draw_box_col endp
draw_inside_box proc
    ; draw two rows
    mov bx,98
    mov dx,start_row   ; row no 101
    mov cx,start_col   ; starting column 101 
    call draw_box_row
    
    mov bx,98
    mov dx,finish_row   ; row no 198
    mov cx,start_col  ; starting column 101 
    call draw_box_row 
    
    
    ;draw two columns
    mov bx,98
    mov cx,start_col   ; col no 101
    mov dx,start_row   ; starting row 101
    call draw_box_col
    
    mov bx,98
    mov cx,finish_col   ; col no 198                    
    mov dx,start_row    ; starting row 101 
    call draw_box_col
    
    return2:
    ret
draw_inside_box endp
check_x proc
    lea si,playerX
    mov cx,8
    x1:
       mov ax,[si]
       cmp ax,6d
       je win1
       add si,2
       loop x1
    ret
    win1:
       mov winner,1
       jmp wins1
    wins1: 
    ret
check_x endp
check_o proc
    lea si,playerO
    mov cx,8
    o2:
       mov ax,[si]
       cmp ax,15d
       je win2 
       add si,2
       loop o2
    ret
    win2:
         mov winner,2
         jmp wins2 
    wins2:
    ret
check_o endp
set_x proc 
    lea di,playerX
    lea si,tic_tac_toe
    combx1: 
    xor ax,ax
    mov bx,0    ; grid 0
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,1    ; grid 1
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,2    ; grid 2
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combx2:
    xor ax,ax
    mov bx,3    ; grid 3
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,4    ; grid 4
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,5    ; grid 5
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combx3:
    xor ax,ax
    mov bx,6    ; grid 6
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,7    ; grid 7
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,8    ; grid 8
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combx4:
    xor ax,ax
    mov bx,0    ; grid 0
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,3    ; grid 3
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,6    ; grid 6
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combx5:
    xor ax,ax
    mov bx,1    ; grid 1
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,4    ; grid 4
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,7    ; grid 7
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combx6:
    xor ax,ax
    mov bx,2    ; grid 2
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,5    ; grid 5
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,8    ; grid 8
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combx7:
    xor ax,ax
    mov bx,0    ; grid 0
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,4    ; grid 4
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,8    ; grid 8
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combx8:
    xor ax,ax
    mov bx,2    ; grid 2
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,4    ; grid 4
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,6    ; grid 6
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    ret
set_x endp
set_o proc
    lea di,playerO
    lea si,tic_tac_toe
    combo1: 
    xor ax,ax
    mov bx,0    ; grid 0
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,1    ; grid 1
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,2    ; grid 2
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combo2:
    xor ax,ax
    mov bx,3    ; grid 3
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,4    ; grid 4
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,5    ; grid 5
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combo3:
    xor ax,ax
    mov bx,6    ; grid 6
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,7    ; grid 7
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,8    ; grid 8
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combo4:
    xor ax,ax
    mov bx,0    ; grid 0
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,3    ; grid 3
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,6    ; grid 6
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combo5:
    xor ax,ax
    mov bx,1    ; grid 1
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,4    ; grid 4
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,7    ; grid 7
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combo6:
    xor ax,ax
    mov bx,2    ; grid 2
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,5    ; grid 5
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,8    ; grid 8
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combo7:
    xor ax,ax
    mov bx,0    ; grid 0
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,4    ; grid 4
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,8    ; grid 8
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    add di,2
    combo8:
    xor ax,ax
    mov bx,2    ; grid 2
    add bx,bx       
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,4    ; grid 4
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov bx,6    ; grid 6
    add bx,bx
    lea si,tic_tac_toe
    add si,bx
    add ax,[si]
    mov [di],ax
    ret
set_o endp
draw_cross proc
    lea si,tic_tac_toe
    add si,pos
    add si,pos
    cmp [si],0d
    je draw_cr
    ;mov count,1
    jne ret_cross
    
    draw_cr:
    mov al,1 
    mov dx,start_row
    add dx,25
    mov cx,start_col
    add cx,25
    mov ah,0ch
    mov bx,50
    LevelD1:
        int 10h
        inc dx
        inc cx
        dec bx
        cmp bx,0
        jg LevelD1
    
    mov al,1
    mov dx,finish_row
    sub dx,25
    mov cx,start_col
    add cx,25
    mov ah,0ch
    mov bx,50
    LevelD2:
        int 10h
        dec dx
        inc cx
        dec bx
        cmp bx,0
        jg LevelD2
    array_updatex:
    inc num
    lea si,tic_tac_toe
    mov si,pos
    add si,pos
    mov [si],2d    ; keep 2 for X 
    call set_x
    call check_x
    ;mov count,1
    ret_cross:
    ret
draw_cross endp
draw_octagon proc
    lea si,tic_tac_toe
    add si,pos
    add si,pos
    cmp [si],0d
    je draw_octa
    ;mov count,0
    jne ret_octa
    draw_octa:
    mov al,14
    mov ah,0ch
    mov bx,50
    mov dx,start_row   ; row no 
    add dx,25
    mov cx,start_col   ; starting column  
    add cx,25
    call draw_box_row
    
    mov bx,50
    mov dx,finish_row   ; row no
    sub dx,23
    mov cx,start_col  ; starting column
    add cx,25
    call draw_box_row 
    
    
    ;draw two columns
    mov bx,50
    mov cx,start_col   ; col no 
    add cx,25
    mov dx,start_row   ; starting row
    add dx,25 
    call draw_box_col
    
    mov bx,50
    mov cx,finish_col   ; col no 198
    sub cx,23    
    mov dx,start_row    ; starting row 101
    add dx,25 
    call draw_box_col
    
    array_updateo:
    inc num
    lea si,tic_tac_toe
    mov si,pos
    add si,pos
    mov [si],5d    ; keep 5 for O
    call set_o
    call check_o
    ;mov count,1
    ret_octa:
    ret
draw_octagon endp

position proc
    get_row:
        mov ax,start_row
        mov bx,100d
        xor dx,dx
        div bx
        mov row,ax
        dec row
    get_col:
        mov ax,start_col
        mov bx,100d 
        xor dx,dx
        div bx
        mov col,ax
        dec col
    array_pos:
        mov ax,row   ; ax = row
        mov bx,3d
        xor dx,dx
        mul bx       ; ax = 3*row
        add ax,col   ; 3*row + col
        mov pos,ax   ; pos = 3*row +col
        xor ax,ax
        xor bx,bx
        xor dx,dx
    ret
position endp
keyboard proc
    starting:
    mov ah,0              ; read keystroke function
    int 16h               ; al = ascii code or 0
                          ; ah = scan code 
    or al,al              ; al = 0 (function key) ?
    je comparision
    x:
    cmp al,78h            ; check if x
    jne o
    cmp count,1
    jne exitx
    inc countx
    call position 
    call draw_cross
    mov count,0
    exitx:
    ret                                                
    o:
    cmp al,6fh            ; check if o
    jne return1 
    cmp count,0
    jne exito
    inc counto
    call position
    call draw_octagon
    mov count,1
    exito:
    ret
    return1:
    ret
    comparision:
    c1:
    cmp ah,48h            ; compare if up arrow
    je up_arrow
    jne c2
    up_arrow:
    mov al,0
    ;call draw_inside_box  ; make the previous box black
    cmp start_row,101d
    jg nextup
    je wrapup
    nextup:
    sub start_row,100d
    sub finish_row,100d
    jmp up
    wrapup:
    mov start_row,301d
    mov finish_row,398d
    jmp up
    up:
    call position
    mov al,15
    ;call draw_inside_box    ; draw the white box
    ret
    c2:
    cmp ah,4bh              ; compare if left arrow
    je left_arrow
    jne c3
    left_arrow:
    mov al,0
    ;call draw_inside_box    ; make the previous box black
    cmp start_col,101d
    jg nextleft
    je wrapleft
    nextleft:
    sub start_col,100d
    sub finish_col,100d
    jmp left
    wrapleft:
    mov start_col,301d
    mov finish_col,398d
    jmp left
    left:
    call position 
    mov al,15
    ;call draw_inside_box    ; draw the white box
    ret
    c3:
    cmp ah,4dh              ; compare if right arrow
    je right_arrow
    jne c4
    right_arrow:
    mov al,0
    ;call draw_inside_box    ; make the previous box black
    cmp start_col,301d
    jl nextright
    je wrapright
    nextright:
    add start_col,100d
    add finish_col,100d
    jmp right
    wrapright:
    mov start_col,101d
    mov finish_col,198d
    jmp right
    right:
    call position      
    mov al,15
    ;call draw_inside_box   ; draw the white box
    ret
    c4:
    cmp ah,50h             ; compare if down arrow
    je down_arrow
    down_arrow:
    mov al,0
    ;call draw_inside_box   ; make the previous box black
    cmp start_row,301d
    jl nextdown
    je wrapdown
    nextdown:
    add start_row,100d
    add finish_row,100d
    jmp down
    wrapdown:
    mov start_row,101d
    mov finish_row,198d
    jmp down
    down:
    call position 
    mov al,15
    ;call draw_inside_box    ; draw the white box
    ret
       
keyboard endp
display_box proc
; sets display mode and draws boundary
    mov ah, 0
    mov al, 12h; VGA 16 color
    int 10h
; set background color
    mov bh, 0; BH has 0 for Background selection mode
    mov bl, 0; any color from 0 to 15 as background
    int 10h
;draw boundary
    mov al, 4  ; choose color
    ;draw_row 99
;    draw_row 100
;    draw_row 199
;    draw_row 200
;    draw_row 299
;    draw_row 300
;    draw_row 399
;    draw_row 400
    
    mov al, 4 ; choose color
    ;draw_col 99
;    draw_col 100
;    draw_col 199
;    draw_col 200
;    draw_col 299
;    draw_col 300
;    draw_col 399
;    draw_col 400
    ret
display_box endp
main Proc
    mov ax,@Data
    mov ds,ax
    xor ax,ax
    ; draw only red box 
    call display_box 
    
    mov start_row,101
    mov finish_row,198 
    
    mov start_col,101
    mov finish_col,198
    
    ; draw first white box
    mov al,15
    ;call draw_inside_box
    selection:
        xor ax,ax
        xor bx,bx
        call keyboard
        mov ax,countx
        mov bx,counto
        cmp winner,0
        jg print_winner
        je check_num
        check_num:
        cmp num,9
        je tie_print
        jl selection
    print_winner:
    cmp winner,1
    je print_msg_1
    jg print_msg_2
    print_msg_1:
    mov dh,0
    mov dl,0
    mov si,0
    mov cx,1
    write1:
    mov ah,2
    int 10h
    mov ah,9
    mov al,msg1[si]
    int 10h
    add si,1
    inc dl
    cmp msg1[si],'$'
    jne write1
    je return
    print_msg_2:
    mov dh,0
    mov dl,0
    mov si,0
    mov cx,1
    write2:
    mov ah,2
    int 10h
    mov ah,9
    mov al,msg2[si]
    int 10h
    add si,1
    inc dl
    cmp msg2[si],'$'
    jne write2
    je return
    
    tie_print:
    mov dh,0
    mov dl,0
    mov si,0
    mov cx,1
    write3:
    mov ah,2
    int 10h
    mov ah,9
    mov al,msg3[si]
    int 10h
    add si,1
    inc dl
    cmp msg3[si],'$'
    jne write3
    je return
    return:
    jmp ending
    ret
    main endp
ending:
end main
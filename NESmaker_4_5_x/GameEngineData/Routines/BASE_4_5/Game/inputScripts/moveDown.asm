;;;; 
   
    ;;; code adjustments taken from: https://www.nesmakers.com/index.php?threads/weapon-check-destroy-weapon-4-5-9-solved.8085/
    
    ;If the sword object is on-screen we can't move NEW CODE
    CountObjectType #1 ;;; Sword object
    BEQ +
    RTS
    + 

    TXA
    STA temp ;; assumes the object we want to move is in x.
  GetActionStep temp
    CMP #$02 ;attack
    BNE +notAttacking
        RTS
    +notAttacking
    CMP #$07
    BNE +notHurt
        RTS
    +notHurt
    CMP #$01 ;moving
    BEQ +movePlayer
        ChangeActionStep temp, #$01 ;Walking
    +movePlayer
    StartMoving temp, #DOWN
    TXA
    STA temp ;; assumes the object we want to move is in x.
    ChangeFacingDirection temp, #FACE_DOWN
 

    RTS
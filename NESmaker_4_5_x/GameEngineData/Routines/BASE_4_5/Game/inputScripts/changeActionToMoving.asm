    
    ;;; NOTE: REMOVED THIS INPUT ACTION DUE TO STILL BEING ABLE TO ROTATE
    ;;; code adjustments taken from: https://www.nesmakers.com/index.php?threads/weapon-check-destroy-weapon-4-5-9-solved.8085/
    
    ;If the sword object is on-screen we can't move NEW CODE
    CountObjectType #1 ;;; Sword object
    BEQ +
    RTS
    + 
    
    
    ;;default code from down, new code is marked
    ;;TXA
    STA temp ;; assumes the object we want to move is in x.
 GetActionStep temp
    CMP #$02 ; check for attack state NEW CODE
    BNE +notAttacking ;new
        RTS ;new
    +notAttacking ;new
    CMP #$07
    BNE +notHurt
        RTS
    +notHurt
        ChangeFacingDirection temp, #FACE_UP
        ChangeActionStep temp, #$01 ;; assumes that "walk" is in action 1
            ;arg0 = what object?
            ;arg1 = what behavior?

    RTS
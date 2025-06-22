oReverseDirection:
;;;; reverse direction.
	LDX arg0_hold
	LDA Object_direction,x
	AND #%00000111
	CLC
	ADC #$04
	AND #%00000111 ;;idk what this does
	TAY ;; this is the "direction", where
		;; 0 = down, counterclockwise, 7=down-left
	LDA DirectionTableOrdered,y
	ORA FacingTableOrdered,y
	STA Object_direction,x ;put new direction back in stash

	RTS
MACRO ReverseFacingDirection
	LDA Object_direction,x
	AND #%00000111
	CLC				;;clear carry flag
	ADC #$04		;;add $04 go the bytes, aka move 4 to the right in the table
	AND #%00000111	;;clip it so it only goes from 0 to 7
	TAY
	LDA DirectionTableOrdered,y ;load direction from table
	ORA FacingTableOrdered,y
	STA Object_direction,x ;put new direction back in object

ENDM
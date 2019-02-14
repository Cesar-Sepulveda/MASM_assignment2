;Cesar Sepulveda
;Date:02/13/19
;CPSC 240
;Assignment #2:
;Converting from Big Endian to Little Endian Write a program that uses the 
;variables below and MOV instructions to copy the value from bigEndian to 
;littleEndian, reversing the order of the bytes. The number’s 32-bit value 
;is understood to be 12345678 hexadecimal.

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	bigEndian BYTE 12h, 34h, 56h, 78h			;setting up the big endian variable
	littleEndian DWORD ?						;setting up the little endian variable

.code

main PROC
	mov al, [bigEndian]							;Moving the last 8 bits (al) from the first byte in bigEndian (12h)
	mov BYTE [littleEndian + 3], al				;Moving te value of al into the fourth address of littleEndian

	mov al, [bigEndian + 1]						;Moving the last 8 bits (al) from the second byte in bigEndian (34h)
	mov BYTE [littleEndian + 2], al				;Moving te value of al into the third address of littleEndian

	mov al, [bigEndian + 2]						;Moving the last 8 bits (al) from the third byte in bigEndian (56h)
	mov BYTE  [littleEndian + 1], al			;Moving te value of al into the second address of littleEndian

	mov al, [bigEndian + 3]						;Moving the last 8 bits (al) from the fourth byte in bigEndian (78h)
	mov BYTE [littleEndian], al					;Moving te value of al into the first address of littleEndian

	INVOKE ExitProcess, 0						;Could not figure out what was causing the syntax error
main ENDP
END main

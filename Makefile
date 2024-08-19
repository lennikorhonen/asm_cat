default:
	as at.s -o at.o
	gcc at.o -o at -nostdlib -static

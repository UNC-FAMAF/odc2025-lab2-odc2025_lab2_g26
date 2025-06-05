	.equ SCREEN_WIDTH, 		640
	.equ SCREEN_HEIGH, 		480
	.equ BITS_PER_PIXEL,  	32

	.equ GPIO_BASE,      0x3f200000
	.equ GPIO_GPFSEL0,   0x00
	.equ GPIO_GPLEV0,    0x34

	.globl main
	#include "gatito.s"

main:
	// x0 contiene la direccion base del framebuffer
 	mov x20, x0	// Guarda la dirección base del framebuffer en x20
	//---------------- CODE HERE ------------------------------------
	
	
	// Color: 0x000080FF (azul oscuro)
   movz x10, 0x00, lsl 16
   movk x10, 0x082F, lsl 00
    

	mov x2, SCREEN_HEIGH         // Y Size
loop1:
	mov x1, SCREEN_WIDTH         // X Size
loop0:
	stur w10,[x0]  // Colorear el pixel N
	add x0,x0,4	   // Siguiente pixel
	sub x1,x1,1	   // Decrementar contador X
	cbnz x1,loop0  // Si no terminó la fila, salto
	sub x2,x2,1	   // Decrementar contador Y
	cbnz x2,loop1  // Si no es la última fila, salto

	// Ejemplo de uso de gpios
	mov x9, GPIO_BASE

	// Atención: se utilizan registros w porque la documentación de broadcom
	// indica que los registros que estamos leyendo y escribiendo son de 32 bits

	// Setea gpios 0 - 9 como lectura
	str wzr, [x9, GPIO_GPFSEL0]

	// Lee el estado de los GPIO 0 - 31
	ldr w10, [x9, GPIO_GPLEV0]

	// And bit a bit mantiene el resultado del bit 2 en w10
	and w11, w10, 0b10

	// w11 será 1 si había un 1 en la posición 2 de w10, si no será 0
	// efectivamente, su valor representará si GPIO 2 está activo
	lsr w11, w11, 1

	//::::::::::::::::: PARED :::::::::::::::::::::::::::::

    mov x1, #0          // X inicio (ajustado)
    mov x2, #0         // Y inicio (mismo)
    mov x3, #640      // ancho (+8 píxeles)
    mov x4, #480        // altura (igual)
    movz x10, 0xff02, lsl 16     // color parte alta
    movk x10, 0x1823 

    bl rectangulo

//:::::::::::::::: SEGUNDA PARED :::::::::::::


    mov x1, #50         // X inicio (ajustado)
    mov x2, #0         // Y inicio (mismo)
    mov x3, #450   // ancho (+8 píxeles)
    mov x4, #480        // altura (igual)
    movz x10, 0xff01, lsl 16     // color parte alta
    movk x10, 0x2233 

    bl rectangulo
    
    
	bl puente 
	bl edificio
	bl interior
    bl gatito 
	bl animacion


	//---------------------------------------------------------------
	// Infinite Loop

InfLoop:
	b InfLoop


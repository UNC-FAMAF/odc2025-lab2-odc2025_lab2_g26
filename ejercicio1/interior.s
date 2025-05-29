.include "colores.s"
.extern dibujar_rectangulo

    .globl interior
interior:
    // Dibuja la pared completa
    mov x1, #0
    mov x2, #0
    mov x3, 640
    mov x4, 480
    movz x5, DARK_BLUE_LO           // pone 0x7D7C en bits 0-15 y limpia el resto
    movk x5, DARK_BLUE_HI, lsl #16  // pone 0x0005 en bits 16-31 y mantiene el resto


    bl dibujar_rectangulo

    // Dibuja la ventana (rectángulo)
    mov x1, #100
    mov x2, #300
    mov x3, #100
    mov x4, #150
    movz x5, LIGHT_BLUE_LO
    movk x5, LIGHT_BLUE_HI
    bl dibujar_rectangulo

    // Dibuja sombras dentro de la ventana
    mov x1, #90
    mov x2, #200
    mov x3, #80
    mov x4, #130
    movz x5, SHADOW_BLUE_LO
    movk x5, SHADOW_BLUE_HI
    bl dibujar_rectangulo

    ret

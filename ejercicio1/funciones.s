    .globl dibujar_rectangulo
dibujar_rectangulo:
    // Parámetros:
    // x0 = base framebuffer
    // x1 = x inicial
    // x2 = y inicial
    // x3 = ancho rectángulo
    // x4 = alto rectángulo
    // w5 = color

    mov x6, x0          // Guardar base framebuffer

    mov x10, #640       // uso inmediato para SCREEN_WIDTH
    mul x7, x2, x10     // y * SCREEN_WIDTH
    add x7, x7, x1      // y * SCREEN_WIDTH + x

    lsl x7, x7, 2       // multiplicar por 4 (bytes por pixel)
    add x0, x6, x7      // puntero inicial al pixel (x1, y2)

    mov x8, x4          // filas (alto)

bucle_filas:
    mov x9, x3          // columnas (ancho)
    mov x11, x0         // puntero fila actual

bucle_columnas:
    str w5, [x11], #4   // escribir color y avanzar puntero 4 bytes

    subs x9, x9, 1
    bne bucle_columnas

    add x0, x0, #(640 * 4)   // pasar a la siguiente fila (offset fila)
    subs x8, x8, 1
    bne bucle_filas

    ret
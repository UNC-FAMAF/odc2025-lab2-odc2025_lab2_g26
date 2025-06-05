
.equ SCREEN_WIDTH, 640
.equ BYTES_PER_PIXEL, 4
.equ LINE_STRIDE, SCREEN_WIDTH * BYTES_PER_PIXEL




//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::              LINEA VERTICAL                                 ::
//::  mov x0, x20              // framebuffer                    ::
//::  mov x1, #320             // coordenada X superior          ::
//::  mov x2, #0               // coordenada y superior          ::
//::  mov X3, #480             //altura de la linea              ::
//::  movz x4, 0xFF80, lsl 16  // color parte alta               ::
//::  movk x4, 0x8080, lsl 0   // color parte baja → ARGB gris   ::
//::  bl draw_vertical_line  // llamada a la función             ::
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


.global draw_vertical_line
draw_vertical_line:
    lsl x5, x1, #2          // x5 = x * 4
    mov x6, SCREEN_WIDTH    // Calcular offset vertical: y * SCREEN_WIDTH * 4 bytes
    mul x6, x6, x2          // x6 = y * SCREEN_WIDTH
    lsl x6, x6, #2          // x6 = y * SCREEN_WIDTH * 4
    add x7, x0, x5          // Dirección inicial = base + offset_x + offset_y
    add x7, x7, x6
    mov x8, x3              // contador altura = altura de la línea


.loop_vline:
    stur w4, [x7]           // pintar pixel con color (w4)
    add x7, x7, LINE_STRIDE  // bajar 1 fila
    sub x8, x8, #1
    cbnz x8, .loop_vline


    ret

/*---------------------------------------------------------------------------------------------------
funcion: dibujar un rectangulo
	parametros:	x1 (coordenada x) x2 (coordenada y)

			x3 (largo del rectangulo -> ) x4 (ancho/alto del rectangulo )
			x10 (color del rectangulo)
			
	todos los registros: x0 x1 x2 x3 x4 x5 x6 x7 x8
---------------------------------------------------------------------------------------------------*/
.global rectangulo
rectangulo:
	sub sp, sp, #8 // Guardo el puntero de retorno en el stack
    	stur lr, [sp]

	// X0 contiene la direccion base del framebuffer
 	mov x0, x20
	
	mov x5, SCREEN_WIDTH
	
	add x7, x1, x3	// fin del rectangulo en eje x, x7 = x + Largo
	add x8, x2, x4	// fin del rectangulo en eje y, x8 = y + Ancho
	
recorrecolumna:
	mov x6, x1	// coordenada x para moverme
	
recorrefila:

	bl pintar	//la coordenada donde estoy la pinto
	
siga:	
	add x6, x6, 1
	cmp x6, x7
	b.le recorrefila
	add x2, x2, 1
	cmp x2, x8
	b.le recorrecolumna

	ldur lr, [sp] // Recupero el puntero de retorno del stack
    add sp, sp, #8 
	br lr


.global paralelogramo_izq
paralelogramo_izq:
    sub sp, sp, #8
    stur lr, [sp]

    mov x0, x20             // Dirección del framebuffer
    mov x5, SCREEN_WIDTH    // Ancho de pantalla

    mov x9, x2              // Guardamos Y original
    mov x12, #0             // Desplazamiento inicial

    add x8, x2, x4          // y8 = y final = y + alto

loop_filas:
    mov x6, x1              // x6 = x original
    sub x6, x6, x12         // desplazamiento hacia la izquierda
    mov x7, x6              // x7 = x final
    add x7, x7, x3          // x7 = x6 + largo

loop_columnas:
    bl pintar

    add x6, x6, #1
    cmp x6, x7
    b.lt loop_columnas

    add x2, x2, #1          // próxima fila
    add x12, x12, #1        // aumentamos desplazamiento
    cmp x2, x8
    b.lt loop_filas

    ldur lr, [sp]
    add sp, sp, #8
    br lr


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::                      CIRCULO U OVALO                                                 ::
//::      mov x20, framebuffer_base     // framebuffer ya inicializado                    ::
//::      movz x10, 0xFF80, lsl 16      // parte alta del color (ej. gris)                ::
//::      movk x10, 0x8080, lsl 0       // parte baja del color (ej. gris)                ::
//::      mov x3, #200                  // coordenada X del centro                        ::
//::      mov x16, #120                 // coordenada Y del centro                        ::
//::      mov x4, #50                   // radio horizontal (radX)                        ::
//::      mov x7, #30                   // radio vertical (radY)                          ::
//::      bl circulo                    // llamada a función                              ::                                                          ::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


.global circulo
circulo:
    sub sp, sp, #24
    str lr, [sp, #16]
    str x3, [sp, #8]
    str x16, [sp, #0]


    mov x0, x20                  // Framebuffer
    mov x5, SCREEN_WIDTH         // Ancho de pantalla


    sub x2, x16, x7              // y inicial (fila superior del óvalo)
    add x9, x7, x7               // alto = 2 * radY
    add x8, x4, x4               // ancho = 2 * radX


    mul x19, x4, x4              // radX^2
    mul x6, x7, x7               // radY^2
    mov x7, x6                   // guardo radY^2 aparte
    mul x15, x19, x7             // radX^2 * radY^2


sig_lamina:
    sub x6, x3, x4               // x inicial (columna izquierda)
    mov x18, x8                  // contador en X (ancho)


seguir:
    sub x17, x6, x3              // (x - centroX)
    sub x11, x2, x16             // (y - centroY)


    mul x17, x17, x17
    mul x11, x11, x11


    mul x12, x11, x19            // (y - cy)^2 * radX^2
    mul x13, x17, x7             // (x - cx)^2 * radY^2


    add x14, x13, x12            // comparar con radX^2 * radY^2


    cmp x14, x15
    b.le pinto


sigo:
    add x6, x6, #1
    sub x18, x18, #1
    cbnz x18, seguir


    add x2, x2, #1
    sub x9, x9, #1
    cbnz x9, sig_lamina
    b fin


pinto:
    bl pintar
    b sigo


fin:
    ldr lr, [sp, #16]
    ldr x3, [sp, #8]
    ldr x16, [sp, #0]
    add sp, sp, #24
    br lr






//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::  FUNCIÓN: pintar                                                                    ::
//::  DESCRIPCIÓN: Pinta un solo píxel en pantalla en la posición (x6, x2).             ::
//::               Guarda el color en la dirección correspondiente del framebuffer.      ::
//::                                                                                   ::
//::  USO (típico dentro de otras funciones):                                          ::
//::      mov x0, framebuffer_base       // framebuffer ya inicializado                ::
//::      mov x5, SCREEN_WIDTH           // ancho de pantalla                          ::
//::      mov x6, columna                // X = columna                                 ::
//::      mov x2, fila                   // Y = fila                                    ::
//::      mov x10, color_ARGB            // color en formato ARGB 32 bits              ::
//::      bl pintar                                                                   ::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


.global pintar
pintar:
    madd x26, x2, x5, x6         // x26 = y * SCREEN_WIDTH + x
    str w10, [x0, x26, lsl #2]   // framebuffer[x26] = color (4 bytes por pixel)
    br lr




//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::              PARALLOGRAMO CON ALTURA PERSONALIZADA E INCLINACIÓN A LA DERECHA            ::
//::  mov x0, x20               // framebuffer base                                           ::
//::  mov x1, #100              // coordenada X (esquina superior izq)                        ::
//::  mov x2, #50               // coordenada Y (Esquina superior izq)                        ::
//::  mov x3, #200              // ancho                                                      ::
//::  mov x4, #100              // altura                                                     ::
//::  mov x5, 0xFF008080        // color ARGB gris                                            ::
//::  bl draw_parallelogram_custom_height                                                     ::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


.global draw_parallelogram_custom_height
draw_parallelogram_custom_height:
    // Calcular dirección inicial
    lsl x6, x1, #2                  // x * 4 (bytes por pixel)
    mov x7, SCREEN_WIDTH
    mul x8, x2, x7                  // y * SCREEN_WIDTH
    lsl x8, x8, #2                  // y * SCREEN_WIDTH * 4 (offset en bytes)
    add x20, x0, x6
    add x20, x20, x8               // x20 = puntero al primer píxel


    mov x21, x4                    // contador de filas (altura)


.loop_rowss:
    mov x22, x3                    // contador de columnas (ancho)
    mov x23, x20                   // puntero al píxel inicial de la fila actual


.loop_colss:
    stur w5, [x23]                 // pintar pixel
    add x23, x23, #4               // siguiente pixel (4 bytes)
    sub x22, x22, #1
    cbnz x22, .loop_colss


    // avanzar a siguiente fila + desplazamiento para inclinación
    add x20, x20, #(SCREEN_WIDTH * 4 + 4)  // bajar 1 fila + desplazar 1 pixel a la derecha


    sub x21, x21, #1
    cbnz x21, .loop_rowss


    ret


//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::              PARALLOGRAMO CON ALTURA PERSONALIZADA E INCLINACIÓN A LA IZQUIERDA          ::
//::  mov x0, x20               // framebuffer base                                           ::
//::  mov x1, #100              // coordenada X (esquina superior izq)                        ::
//::  mov x2, #50               // coordenada Y (esquina superior izq)                        ::
//::  mov x3, #200              // ancho                                                      ::
//::  mov x4, #100              // altura                                                     ::
//::  mov x5, 0xFF008080        // color ARGB gris                                            ::
//::  bl draw_parallelogram_custom_height_left                                                ::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


.global draw_parallelogram_left
draw_parallelogram_left:
    // Calcular dirección inicial
    lsl x6, x1, #2                  // x * 4 (bytes por pixel)
    mov x7, SCREEN_WIDTH
    mul x8, x2, x7                  // y * SCREEN_WIDTH
    lsl x8, x8, #2                  // y * SCREEN_WIDTH * 4 (offset en bytes)
    add x20, x0, x6
    add x20, x20, x8               // x20 = puntero al primer píxel


    mov x21, x4                    // contador de filas (altura)


.loop_rowssz:
    mov x22, x3                    // contador de columnas (ancho)
    mov x23, x20                   // puntero al píxel inicial de la fila actual


.loop_colssz:
    stur w5, [x23]                 // pintar pixel
    add x23, x23, #4               // siguiente pixel (4 bytes)
    sub x22, x22, #1
    cbnz x22, .loop_colssz


    mov x9, LINE_STRIDE
    sub x9, x9, #4
    // avanzar a siguiente fila + desplazamiento para inclinación
    add x20, x20, x9  // bajar 1 fila + desplazar 1 pixel a la izquierda


    sub x21, x21, #1
    cbnz x21, .loop_rowssz


    ret




//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::                SOMBREADO DE RECTÁNGULO POR BLOQUES 4x4 PIXELES                           ::
//::  mov x0, x20               // framebuffer base                                           ::
//::  mov x1, #50               // coordenada X (esquina superior izq)                        ::
//::  mov x2, #30               // coordenada Y (esquina superior izq)                        ::
//::  mov x3, #128              // ancho                                                      ::
//::  mov x4, #64               // alto                                                       ::
//::  mov w5, 0xFF404040        // color                                                      ::
//::  bl draw_rectangle_sombr   // llamada a la función                                       ::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


.global draw_rectangle_sombr
draw_rectangle_sombr:


    // Calculamos cuantos bloques de 4 pixeles caben en ancho y alto
    mov x6, x3
    lsr x6, x6, #2          // x6 = ancho en bloques de 4 pix (dividir por 4)
    mov x7, x4
    lsr x7, x7, #2          // x7 = alto en bloques de 4 pix


    // Calculamos offset base framebuffer (x,y)
    lsl x8, x1, #2          // x * 4 bytes por pixel
    mov x9, SCREEN_WIDTH
    mul x10, x2, x9         // y * screen_width
    lsl x10, x10, #2        // * 4 bytes por pixel
    add x11, x0, x8
    add x11, x11, x10       // framebuffer + offset


    mov x12, x7             // contador filas bloques


.loop_rowsa:
    mov x13, x6             // contador columnas bloques
    mov x14, x11            // puntero fila actual framebuffer


    // Revisamos si fila es impar o par (bit 0 de x12)
    and x15, x12, #1        // x15 = 0 si par, 1 si impar


    // Si impar sumamos desplazamiento horizontal de 4 pixeles (16 bytes)
    cbz x15, .no_offset
    add x14, x14, #16      


.no_offset:


.loop_colsa:
    // Por ahora solo pintamos un pixel para la idea (podés reemplazar por bloque 4x4)
    stur w5, [x14]
    add x14, x14, #32       // saltamos 8 pixeles (doble espacio, para efecto sombreado)
    sub x13, x13, #1
    cbnz x13, .loop_colsa


    // Bajamos a la siguiente fila de bloques (4 pixeles de alto * screen_width * 4 bytes)
    movz x16, #10240, lsl #0   // 4 * SCREEN_WIDTH * 4 = 4 * 640 * 4 = 10240 bytes
    add x11, x11, x16


    sub x12, x12, #1
    cbnz x12, .loop_rowsa


    ret

    .global delay
    delay:
    // Guardar x0 y x30 (por si delay se llama dentro de otra función)
    stp x0, x30, [sp, #-16]!  // Guardamos par: x0 original y LR

loop_delay:
    subs x0, x0, #1           // Decrementa y actualiza flags
    b.ne loop_delay           // Si no es cero, seguimos

    // Restaurar x0 y x30
    ldp x0, x30, [sp], #16

    ret





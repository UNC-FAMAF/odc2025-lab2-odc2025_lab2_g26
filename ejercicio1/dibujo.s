 .globl interior

interior:


//::::::::::::::: marco vertical izq::::::::::::::::::::::

    mov x1, #95         // X inicio (ajustado)
    mov x2, #40         // Y inicio (mismo)
    mov x3, #16   // ancho (+8 píxeles)
    mov x4, #328        // altura (igual)
    movz x10, 0xff00, lsl 16     // color parte alta
    movk x10, 0x00 

	bl rectangulo

//::::::::::::::: marco vertical der::::::::::::::::::::::

    mov x1, #450         // X inicio (ajustado)
    mov x2, #40         // Y inicio (mismo)
    mov x3, #16   // ancho (+8 píxeles)
    mov x4, #328        // altura (igual)
    movz x10, 0xff00, lsl 16     // color parte alta
    movk x10, 0x00 

	bl rectangulo

//::::::::::::::: marco vertical sup::::::::::::::::::::::

    mov x1, #95         // X inicio (ajustado)
    mov x2, #34         // Y inicio (mismo)
    mov x3, #371   // ancho (+8 píxeles)
    mov x4, #16        // altura (igual)
    movz x10, 0xff00, lsl 16     // color parte alta
    movk x10, 0x00 

	bl rectangulo

//::::::::::::::: marco vertical inf::::::::::::::::::::::

    mov x1, #95         // X inicio (ajustado)
    mov x2, #360         // Y inicio (mismo)
    mov x3, #371   // ancho (+8 píxeles)
    mov x4, #16        // altura (igual)
    movz x10, 0xff00, lsl 16     // color parte alta
    movk x10, 0x00 

	bl rectangulo

//:::::::::::: marco cruz :::::::::::::::::::.

	            
    mov x1, #265    // X inicio
    mov x2, #36 // Y inicio
    mov x3, #20  // ancho
    mov x4, #328     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x0000 

    bl rectangulo

//:::::::::::::::::: cruz ventana:::::::::::::::::::

	            
    mov x1, #270    // X inicio
    mov x2, #36 // Y inicio
    mov x3, #10  // ancho
    mov x4, #328     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x4262 

    bl rectangulo

//:::::::::::: marco cruz :::::::::::::::::::.

	            
    mov x1, #100    // X inicio
    mov x2, #185 // Y inicio
    mov x3, #350  // ancho
    mov x4, #16     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x0000 

    bl rectangulo

//:::::::::::::::::: cruz ventana:::::::::::::::::::

    mov x1, #100    // X inicio
    mov x2, #189 // Y inicio
    mov x3, #350  // ancho
    mov x4, #8     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x4262 

    bl rectangulo

    

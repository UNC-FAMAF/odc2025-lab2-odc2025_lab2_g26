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
    
//::::::::::::::::::::::::::::::::::::::::://
//::::::::::::: CALENDARIO :::::::::::::::://
//::::::::::::::::::::::::::::::::::::::::://
	            
    mov x1, #520           // X inicio
    mov x2, #150        // Y inicio
    mov x3, #100        // ancho
    mov x4, #100      // altura
    movz x10, 0xFF59, lsl 16     //Gis oscuro
    movk x10, 0x6269 

    bl rectangulo
//primer rectangulo 

	            
    mov x1, #520           // X inicio
    mov x2, #220      // Y inicio
    mov x3, #105        // ancho
    mov x4, #15     // altura
    movz x10, 0xFF59, lsl 16     //Gis oscuro
    movk x10, 0x6269 

    bl rectangulo
//segundo bloque 

	            
    mov x1, #520           // X inicio
    mov x2, #235      // Y inicio
    mov x3, #110        // ancho
    mov x4, #8      // altura
    movz x10, 0xFF59, lsl 16     //Gis oscuro
    movk x10, 0x6269 

    bl rectangulo

//tercer bloque

	            
    mov x1, #520           // X inicio
    mov x2, #243      // Y inicio
    mov x3, #105        // ancho
    mov x4, #10  // altura
    movz x10, 0xFF59, lsl 16     //Gis oscuro
    movk x10, 0x6269 

    bl rectangulo

//cuarto bloque

	            
    mov x1, #523           // X inicio
    mov x2, #253      // Y inicio
    mov x3, #97      // ancho
    mov x4, #6 // altura
    movz x10, 0xFF59, lsl 16     //Gis oscuro
    movk x10, 0x6269 

    bl rectangulo

    

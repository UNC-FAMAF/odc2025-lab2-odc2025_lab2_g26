.global puente
puente:

    //:::::::::::::::::::::::::::::::::::
    //::       PUENTE                  ::
    //:::::::::::::::::::::::::::::::::::

    //guardo x30

    stp x29, x30, [sp, #-16]!   // guardás el frame anterior y x30
mov x29, sp                 // nuevo frame pointer

	//::::: LINEA BAJA HORIZONTAL ::::
	mov x0, x20              // framebuffer base                        
	mov x1, #100             // coordenada X (Esquina superior izq)     
	mov x2, #300              // coordenada Y (esquina superior izq)     
	mov x3, #320              // ancho                                   
	mov x4, #8              // altura                                  
	movz x10, 0xFF00, lsl 16  // parte alta del color                    
	movk x10, 0x0020, lsl 0   // parte baja del color                   
	bl rectangulo 

    


	//::::::::SEGUNDA LINEA HORIZONTAL::::  
	mov x0, x20              // framebuffer base                        
	mov x1, #100             // coordenada X (Esquina superior izq)     
	mov x2, #292              // coordenada Y (esquina superior izq)     
	mov x3, #320              // ancho                                   
	mov x4, #3              // altura 
    movz x10, 0xFF00, lsl 16  // parte alta del color                    
	movk x10, 0x0020, lsl 0   // parte baja del color                                                    
	bl rectangulo




	//:::::: BARANDA (parte alta)::::::::
	mov x0, x20              // framebuffer base                        
	mov x1, #200             // coordenada X (Esquina superior izq)     
	mov x2, #230              // coordenada Y (esquina superior izq)     
	mov x3, #20              // ancho                                   
	mov x4, #70              // altura                                                     
	bl rectangulo

	//:: COSTADOS DE BARANDA (izq)::::::
	mov x0, x20              // framebuffer base                        
	mov x1, #200             // coordenada X (Esquina superior izq)     
	mov x2, #310              // coordenada Y (esquina superior izq)     
	mov x3, #2              // ancho                                   
	mov x4, #50              // altura                                                     
	bl rectangulo

	//:: COSTADOS DE BARANDA (der)::::::
	mov x0, x20              // framebuffer base                        
	mov x1, #218             // coordenada X (Esquina superior izq)     
	mov x2, #310              // coordenada Y (esquina superior izq)     
	mov x3, #2              // ancho                                   
	mov x4, #50              // altura                                                    
	bl rectangulo


	//:::::::BARANDA (uniones horizontales 1):::::::: (deberia poner un ciclo para esto despues)

    mov x0, x20              // framebuffer base                        ::
    mov x1, #200             // coordenada X (Esquina superior izq)     ::
    mov x2, #310              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #2              // altura                                  ::
	mov x13, #5                // cantidad de rectangulos 

	baranda_loop:
    bl rectangulo 
	sub x13, x13, #1
	add x2, x2, #10
	cbnz x13, baranda_loop

	//::::::::::::::: BARANDA (LA SOGA) (son 5 rectanguos) (PARTE 1)::::::://

	//rectangulo 1

	mov x0, x20              // framebuffer base                        ::
    mov x1, #100             // coordenada X (Esquina superior izq)     ::
    mov x2, #240              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    movz x10, 0xFF00, lsl 16  // parte alta del color                    ::
    movk x10, 0x00AA, lsl 0   // parte baja del color                    ::
    bl rectangulo    

		//rectangulo 2

	mov x0, x20              // framebuffer base                        ::
    mov x1, #120             // coordenada X (Esquina superior izq)     ::
    mov x2, #245              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    bl rectangulo 

		//rectangulo 3

	mov x0, x20              // framebuffer base                        ::
    mov x1, #140             // coordenada X (Esquina superior izq)     ::
    mov x2, #250              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    bl rectangulo 

		//rectangulo 4

	mov x0, x20              // framebuffer base                        ::
    mov x1, #160             // coordenada X (Esquina superior izq)     ::
    mov x2, #245              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    bl rectangulo 

		//rectangulo 5

	mov x0, x20              // framebuffer base                        ::
    mov x1, #180             // coordenada X (Esquina superior izq)     ::
    mov x2, #240              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    bl rectangulo 

	//::::::::::::::: BARANDA (LA SOGA) (son 5 rectanguos) (PARTE 2)::::::://

	//rectangulo 1

	mov x0, x20              // framebuffer base                        ::
    mov x1, #220             // coordenada X (Esquina superior izq)     ::
    mov x2, #240              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    bl rectangulo    

		//rectangulo 2

	mov x0, x20              // framebuffer base                        ::
    mov x1, #240             // coordenada X (Esquina superior izq)     ::
    mov x2, #245              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    bl rectangulo 

		//rectangulo 3

	mov x0, x20              // framebuffer base                        ::
    mov x1, #260             // coordenada X (Esquina superior izq)     ::
    mov x2, #250              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    bl rectangulo 

		//rectangulo 4

	mov x0, x20              // framebuffer base                        ::
    mov x1, #280             // coordenada X (Esquina superior izq)     ::
    mov x2, #245              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    bl rectangulo 

		//rectangulo 5

	mov x0, x20              // framebuffer base                        ::
    mov x1, #300             // coordenada X (Esquina superior izq)     ::
    mov x2, #240              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #5              // altura                                  ::
    bl rectangulo 

    ldp x29, x30, [sp], #16     // restaurás lo que guardaste
ret                         // ahora sí, volvé tranquilo


  	//::::::::::::::::::::::::
	//::  EDIFICIO          ::
	//::::::::::::::::::::::::

    .global edificio
edificio:

//guardo la direccion de retorno

stp x29, x30, [sp, #-16]!   // guardás el frame anterior y x30
mov x29, sp                 // nuevo frame pointer

//:::::::::::::::::::::::::::::::::::::
//::    CARTEL ODC 2025              ::
//:::::::::::::::::::::::::::::::::::::

//////////// CARTEL ///////////////

    // Color gris

// ===== RECTÁNGULO CONTENEDOR =====
mov x1, #345       // x
mov x2, #48        // y (nuevo valor)
mov x3, #90        // ancho
mov x4, #40        // alto
movz x10, 0xFFFF, lsl 16
movk x10, 0xFFD6, lsl 0
bl rectangulo


movz x10, 0xFF30, lsl 16
movk x10, 0x0020, lsl 0

//POSTES DEL CARTEL

//Poste 1
mov x1, #345
mov x2, #45
mov x3, #3
mov x4, #54
bl rectangulo

//Poste 2
mov x1, #435
mov x2, #45
mov x3, #3
mov x4, #54
bl rectangulo



	//:::::::rectangulo principal:::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #300             // coordenada X (Esquina superior izq)     ::
    mov x2, #100              // coordenada Y (esquina superior izq)     ::
    mov x3, #150              // ancho                                   ::
    mov x4, #260              // altura                                  ::
    movz x10, 0xFF11, lsl 16  // parte alta del color                    ::
    movk x10, 0x1111, lsl 0   // parte baja del color                    ::
    bl rectangulo   

    //::::::::::LUZ ROJA:::::::::::::::::

    //soporte

    mov x1, #330             // coordenada X (Esquina superior izq)     ::
    mov x2, #85              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF11, lsl 16  // parte alta del color                    ::
    movk x10, 0x1111, lsl 0   // parte baja del color                    ::
    bl rectangulo   

    //antena
    mov x1, #335             // coordenada X (Esquina superior izq)     ::
    mov x2, #70              // coordenada Y (esquina superior izq)     ::
    mov x3, #3              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF33, lsl 16  // parte alta del color                    ::
    movk x10, 0x3333, lsl 0   // parte baja del color                    ::
    bl rectangulo   



	//:::::::::ventanas fila 1::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #320             // coordenada X (Esquina superior izq)     ::
    mov x2, #120              // coordenada Y (esquina superior izq)     ::
    mov x3, #30              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF33, lsl 16  // parte alta del color                    ::
    movk x10, 0x3333, lsl 0   // parte baja del color                    ::
	mov x13, #8                // cantidad de rectangulos 


	ventanaUno_loop:
    bl rectangulo 
	sub x13, x13, #1
	add x2, x2, #14
	cbnz x13, ventanaUno_loop

	//:::::::::ventanas fila 2::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #360             // coordenada X (Esquina superior izq)     ::
    mov x2, #130              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF33, lsl 16  // parte alta del color                    ::
    movk x10, 0x3333, lsl 0   // parte baja del color                    ::
	mov x13, #8                // cantidad de rectangulos 


	ventanaDos_loop:
    bl rectangulo 
	sub x13, x13, #1
	add x2, x2, #14
	cbnz x13, ventanaDos_loop

		//:::::::::ventanas fila 3::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #385             // coordenada X (Esquina superior izq)     ::
    mov x2, #130              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF33, lsl 16  // parte alta del color                    ::
    movk x10, 0x3333, lsl 0   // parte baja del color                    ::
	mov x13, #8                // cantidad de rectangulos 


	ventanaTres_loop:
    bl rectangulo 
	sub x13, x13, #1
	add x2, x2, #14
	cbnz x13, ventanaTres_loop

		//:::::::::ventanas fila 4::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #415             // coordenada X (Esquina superior izq)     ::
    mov x2, #120              // coordenada Y (esquina superior izq)     ::
    mov x3, #30              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF33, lsl 16  // parte alta del color                    ::
    movk x10, 0x3333, lsl 0   // parte baja del color                    ::
	mov x13, #8                // cantidad de rectangulos 


	ventanaCuatro_loop:
    bl rectangulo 
	sub x13, x13, #1
	add x2, x2, #14
	cbnz x13, ventanaCuatro_loop

    ldp x29, x30, [sp], #16     // restaurás lo que guardaste
ret                         // ahora sí, volvé tranquilo


    .globl interior

interior:

//::::::::::::::::::::::::::::::::::::::::://
//		 VENTANA 		   //	
//::::::::::::::::::::::::::::::::::::::::://

//:::::::::: marco sup :::::::::::::::

mov x1, #84	// x inicio
mov x2, #24	// y inicio
mov x3, #382	// ancho
mov x4, #16	// altura
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0

bl rectangulo
//::::::::: marco inf ::::::::::::::

mov x1, #84	// x inicio
mov x2, #360	// y inicio
mov x3, #382	// ancho
mov x4, #16	// altura
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0

bl rectangulo
//::::::::::: marco izq ::::::::::::

mov x1, #84	// x inicio
mov x2, #40	// y inicio
mov x3, #16	// ancho
mov x4, #320	// altura
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0

bl rectangulo
//::::::::::: marco der ::::::::::::

mov x1, #450	// x inicio
mov x2, #40	// y inicio
mov x3, #16	// ancho
mov x4, #320	// altura
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0

bl rectangulo

//:::::::: relleno marco sup ::::::::::::::

mov x1, #88	// x inicio
mov x2, #28	// y inicio
mov x3, #374	// ancho
mov x4, #8	// altura
movz x10, 0xFF00, lsl 16
movk x10, 0x4262, lsl 0

bl rectangulo

//::::::::: relleno marco inf :::::::::::::

mov x1, #88	// x inicio
mov x2, #364	// y inicio
mov x3, #374	// ancho
mov x4, #8	// altura
movz x10, 0xFF00, lsl 16
movk x10, 0x4262, lsl 0

bl rectangulo

//:::::::: relleno marco izq ::::::::::

mov x1, #88	// x inicio
mov x2, #36	// y inicio
mov x3, #8	// ancho
mov x4, #328	// altura
movz x10, 0xFF00, lsl 16
movk x10, 0x4262, lsl 0

bl rectangulo

//:::::::: relleno marco der ::::::::::


mov x1, #454	// x inicio
mov x2, #36	// y inicio
mov x3, #8	// ancho
mov x4, #328	// altura
movz x10, 0xFF00, lsl 16
movk x10, 0x4262, lsl 0

bl rectangulo

//:::::::::::: marco cruz :::::::::::::::::::.

	            
    mov x1, #267    // X inicio
    mov x2, #36 // Y inicio
    mov x3, #16  // ancho
    mov x4, #328     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x0000 

    bl rectangulo

//:::::::::::: marco cruz :::::::::::::::::::.

	            
    mov x1, #96    // X inicio
    mov x2, #185 // Y inicio
    mov x3, #358  // ancho
    mov x4, #16     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x0000 

    bl rectangulo

//:::::::::::::::::: cruz ventana:::::::::::::::::::

	            
    mov x1, #271    // X inicio
    mov x2, #36 // Y inicio
    mov x3, #8  // ancho
    mov x4, #328     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x4262 

    bl rectangulo


//:::::::::::::::::: cruz ventana:::::::::::::::::::

    mov x1, #96    // X inicio
    mov x2, #189 // Y inicio
    mov x3, #358  // ancho
    mov x4, #8     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x4262 

    bl rectangulo

//////////////////// EXTRA ABRIL //////////////////////////////


//bordes pared izq//
mov x1, #48
mov x2, #0
mov x3, #1        // ancho de la línea
mov x4, #480          // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//bordes pared der//
mov x1, #500
mov x2, #0
mov x3, #1        // ancho de la línea
mov x4, #480          // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo


//calefactor abajo o detalle PARTE 1//
mov x1, #160
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #160
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #155
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #160
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #155
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #167
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #172
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #167
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #172
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #172
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #179
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #184
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #179
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #184
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #184
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #191
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #196
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #191
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #196
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #196
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #203
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #208
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #203
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #208
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #208
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #215
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #220
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #215
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #220
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #220
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #227
mov x2, #450
mov x3, #4
mov x4, #2
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #232
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #227
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #232
mov x2, #460
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #232
mov x2, #465
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #244
mov x2, #460
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #244
mov x2, #465
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #239
mov x2, #450
mov x3, #4
mov x4, #2
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #244
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #239
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #251
mov x2, #450
mov x3, #4
mov x4, #2
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #256
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #251
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #256
mov x2, #460
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #256
mov x2, #465
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #268
mov x2, #460
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #268
mov x2, #465
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #263
mov x2, #450
mov x3, #4
mov x4, #2
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #268
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #263
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #275
mov x2, #450
mov x3, #4
mov x4, #2
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #280
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #275
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #280
mov x2, #460
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #280
mov x2, #465
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #292
mov x2, #460
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #292
mov x2, #465
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #287
mov x2, #450
mov x3, #4
mov x4, #2
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #292
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #287
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #299
mov x2, #450
mov x3, #4
mov x4, #2
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #304
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #299
mov x2, #450
mov x3, #2
mov x4, #30
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #304
mov x2, #460
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

mov x1, #304
mov x2, #465
mov x3, #8
mov x4, #1
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #304
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #304
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #299
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #304
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #299
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #311
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #316
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #311
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #316
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #316
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #323
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #328
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #323
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #328
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #328
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #335
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #340
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #335
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #340
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #340
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #347
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #352
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #347
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #352
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #352
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #359
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #364
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #359
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #364
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #359
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #364
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #364
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #371
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #376
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #371
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #376
mov x2, #460
mov x3, #8     // ancho de la línea
mov x4, #1         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle PARTE 1//
mov x1, #376
mov x2, #465
mov x3, #8     // ancho de la línea
mov x4, #1        // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #383
mov x2, #450
mov x3, #4     // ancho de la línea
mov x4, #2         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #388
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo

//calefactor abajo o detalle//
mov x1, #383
mov x2, #450
mov x3, #2     // ancho de la línea
mov x4, #30         // alto de la línea
movz x10, 0xFF00, lsl 16
movk x10, 0x0000, lsl 0
bl rectangulo


//////////////////// EXTRA ABRIL FIN //////////////////////////////

//::::::: EJEMPLO DE paralelogramo ::::::::::::::::::::
//ldr x10, =0xFF00FFFF    // Color (violeta claro)
//mov x1, 250             // X inicial
//mov x2, 100             // Y inicial
//mov x3, 6               // Largo (horizontal)
//mov x4, 6               // Alto (vertical)
//bl paralelogramo_izq

//::::::::::::: RELOJ :::::::::::::::::::::::::::::::::::               
movz x10, 0xFF80, lsl 16      // parte alta del color (ej. gris)                
movk x10, 0x8080, lsl 0       // parte baja del color (ej. gris)                
mov x3, #570                  // coordenada X del centro                        
mov x16, #80                 // coordenada Y del centro                        
mov x4, #40                   // radio horizontal (radX)                        
mov x7, #40                   // radio vertical (radY)                          

bl circulo                    // llamada a función

// marco reloj

movz x10, 0xFFca, lsl 16      // parte alta del color (ej. gris)                
movk x10, 0xcaca, lsl 0       // parte baja del color (ej. gris)                
mov x3, #570                  // coordenada X del centro                        
mov x16, #80                 // coordenada Y del centro                        
mov x4, #35                   // radio horizontal (radX)                        
mov x7, #35                   // radio vertical (radY)                          

bl circulo                    // llamada a función

// centro reloj

mov x3, #4         // ancho de la línea
mov x4, #4           // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0

mov x1, #569
mov x2, #79
bl rectangulo

// hora reloj

mov x3, #2         // ancho de la línea
mov x4, #2           // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0

//12
mov x1, #569
mov x2, #49
bl rectangulo

// 6
mov x1, #569
mov x2, #109
bl rectangulo

//9
mov x1, #539
mov x2, #79
bl rectangulo

//3
mov x1, #599
mov x2, #79
bl rectangulo

// minutos reloj

mov x3, #1         // ancho de la línea
mov x4, #1           // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0

// 45
mov x1, #548
mov x2, #98
bl rectangulo
//30
mov x1, #591
mov x2, #98
bl rectangulo
//0
mov x1, #548
mov x2, #60
bl rectangulo
//15
mov x1, #591
mov x2, #60
bl rectangulo

/// estante /////

mov x1, 84             // X inicial
mov x2, 376             // Y inicial
mov x3, 382               // Largo (horizontal)
mov x4, 30               // Alto (vertical)
ldr x10, =0x024C69    // Color (azul oscuro)


bl paralelogramo_izq

///// estante borde inf///////////
mov x1, #55
mov x2, #405
mov x3, #382         // ancho de la línea
mov x4, #20           // alto de la línea
movz x10, 0xFF03, lsl 16  
movk x10, 0x374c, lsl 0

bl rectangulo

// estante borde der//
mov x1, 84             // X inicial
mov x2, 376             // Y inicial
mov x3, 382               // Largo (horizontal)
mov x4, 30               // Alto (vertical)
ldr x10, =0x024C69    // Color (azul oscuro)


bl paralelogramo_izq


/////marco estante /////
mov x1, #55
mov x3, #382         // ancho de la línea
mov x4, #4           // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0

//marco sup
mov x2, #405
bl rectangulo
//marco inf 
mov x2, #422
bl rectangulo

//marco izq
mov x1, #55
mov x2, #405
mov x3, #4         // ancho de la línea
mov x4, #20           // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//marco der

mov x1, #433
mov x2, #405
mov x3, #4         // ancho de la línea
mov x4, #20           // alto de la línea
movz x10, 0xFF00, lsl 16  
movk x10, 0x0000, lsl 0
bl rectangulo

//marco izq paralelogramo
mov x1, 84             // X inicial
mov x2, 376             // Y inicial
mov x3, 6               // Largo (horizontal)
mov x4, 30               // Alto (vertical)
ldr x10, =0x000000    // Color (violeta claro)

bl paralelogramo_izq


mov x1, 462             // X inicial
mov x2, 376             // Y inicial
mov x3, 6               // Largo (horizontal)
mov x4, 30               // Alto (vertical)
ldr x10, =0x000000    // Color (violeta claro)
bl paralelogramo_izq


.global gatito

gatito:
    
        // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 120               // Coordenada X
    mov x2, 344           // Coordenada Y
    mov x3, 60                // Ancho
    mov x4, 28               // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 124               // Coordenada X
    mov x2, 340           // Coordenada Y
    mov x3, 52               // Ancho
    mov x4, 4               // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 128               // Coordenada X
    mov x2, 332          // Coordenada Y
    mov x3, 52               // Ancho
    mov x4, 8               // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 132               // Coordenada X
    mov x2, 328          // Coordenada Y
    mov x3, 48               // Ancho
    mov x4, 4               // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 136               // Coordenada X
    mov x2, 319          // Coordenada Y
    mov x3, 44               // Ancho
    mov x4, 8               // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 140               // Coordenada X
    mov x2, 315          // Coordenada Y
    mov x3, 12              // Ancho
    mov x4, 4               // Alto
    bl rectangulo

    
    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 148               // Coordenada X
    mov x2, 311          // Coordenada Y
    mov x3, 24              // Ancho
    mov x4, 4               // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 148               // Coordenada X
    mov x2, 303          // Coordenada Y
    mov x3, 24              // Ancho
    mov x4, 4               // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 152               // Coordenada X
    mov x2, 307          // Coordenada Y
    mov x3, 20             // Ancho
    mov x4, 4               // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 144              // Coordenada X
    mov x2, 279         // Coordenada Y
    mov x3, 44             // Ancho
    mov x4, 24               // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 148              // Coordenada X
    mov x2, 275        // Coordenada Y
    mov x3, 44            // Ancho
    mov x4, 4              // Alto
    bl rectangulo

      // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 148              // Coordenada X
    mov x2, 271        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 4              // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 148              // Coordenada X
    mov x2, 267        // Coordenada Y
    mov x3, 8            // Ancho
    mov x4, 4              // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 148              // Coordenada X
    mov x2, 263        // Coordenada Y
    mov x3, 4            // Ancho
    mov x4, 4              // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 180             // Coordenada X
    mov x2, 271        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 4              // Alto
    bl rectangulo

    
    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 184            // Coordenada X
    mov x2, 267        // Coordenada Y
    mov x3, 8            // Ancho
    mov x4, 4              // Alto
    bl rectangulo

     
    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 188            // Coordenada X
    mov x2, 263        // Coordenada Y
    mov x3, 4           // Ancho
    mov x4, 36              // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 180             // Coordenada X
    mov x2, 279        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 4              // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 124              // Coordenada X
    mov x2, 372           // Coordenada Y
    mov x3, 56                // Ancho
    mov x4, 8              // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 128              // Coordenada X
    mov x2, 380          // Coordenada Y
    mov x3, 52               // Ancho
    mov x4, 4            // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 132              // Coordenada X
    mov x2, 384          // Coordenada Y
    mov x3, 40               // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 140              // Coordenada X
    mov x2, 388          // Coordenada Y
    mov x3, 28              // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 148              // Coordenada X
    mov x2, 392          // Coordenada Y
    mov x3, 8             // Ancho
    mov x4, 8            // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 152              // Coordenada X
    mov x2, 400          // Coordenada Y
    mov x3, 8             // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 156              // Coordenada X
    mov x2, 404         // Coordenada Y
    mov x3, 8            // Ancho
    mov x4, 6           // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 160              // Coordenada X
    mov x2, 408         // Coordenada Y
    mov x3, 8            // Ancho
    mov x4, 12           // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 156              // Coordenada X
    mov x2, 420         // Coordenada Y
    mov x3, 8            // Ancho
    mov x4, 6           // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 152              // Coordenada X
    mov x2, 424        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 6           // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 140            // Coordenada X
    mov x2, 426       // Coordenada Y
    mov x3, 4            // Ancho
    mov x4, 4          // Alto
    bl rectangulo

      // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 140            // Coordenada X
    mov x2, 430       // Coordenada Y
    mov x3, 18            // Ancho
    mov x4, 4          // Alto
    bl rectangulo




// PANZA GRIS:
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 124             // Coordenada X
    mov x2, 352               // Coordenada Y
    mov x3, 4               // Ancho
    mov x4, 8               // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 128           // Coordenada X
    mov x2, 348              // Coordenada Y
    mov x3, 28          // Ancho
    mov x4, 16               // Alto
    bl rectangulo

     // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 132            // Coordenada X
    mov x2, 344               // Coordenada Y
    mov x3, 36        // Ancho
    mov x4, 16             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 124             // Coordenada X
    mov x2, 356             // Coordenada Y
    mov x3, 52               // Ancho
    mov x4, 4               // Alto
    bl rectangulo

     // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 140            // Coordenada X
    mov x2, 340               // Coordenada Y
    mov x3, 20       // Ancho
    mov x4, 4             // Alto
    bl rectangulo

      // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 169            // Coordenada X
    mov x2, 348               // Coordenada Y
    mov x3, 3     // Ancho
    mov x4, 12             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 132             // Coordenada X
    mov x2, 365            // Coordenada Yh
    mov x3, 7             // Ancho
    mov x4, 4              // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 144             // Coordenada X
    mov x2, 364            // Coordenada Y
    mov x3, 7             // Ancho
    mov x4, 4               // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 148             // Coordenada X
    mov x2, 364            // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 8               // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 160             // Coordenada X
    mov x2, 360            // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 8               // Alto
    bl rectangulo

     // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 164             // Coordenada X
    mov x2, 364            // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 168             // Coordenada X
    mov x2, 360            // Coordenada Y
    mov x3, 3            // Ancho
    mov x4, 2              // Alto
    bl rectangulo

      // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE DERECHO 1
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 177           // Coordenada X
    mov x2, 319               // Coordenada Y
    mov x3, 4        // Ancho
    mov x4, 33             // Alto
    bl rectangulo

      // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 173            // Coordenada X
    mov x2, 303              // Coordenada Y
    mov x3, 4        // Ancho
    mov x4, 33             // Alto
    bl rectangulo

     // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 174            // Coordenada X
    mov x2, 303              // Coordenada Y
    mov x3, 8      // Ancho
    mov x4, 8             // Alto
    bl rectangulo

      // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 180            // Coordenada X
    mov x2, 295              // Coordenada Y
    mov x3, 8       // Ancho
    mov x4, 8             // Alto
    bl rectangulo

     // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 185            // Coordenada X
    mov x2, 287              // Coordenada Y
    mov x3, 3       // Ancho
    mov x4, 8             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 182           // Coordenada X
    mov x2, 283              // Coordenada Y
    mov x3, 3       // Ancho
    mov x4, 8             // Alto
    bl rectangulo

     // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 178           // Coordenada X
    mov x2, 283              // Coordenada Y
    mov x3, 3       // Ancho
    mov x4, 4             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 154           // Coordenada X
    mov x2, 279              // Coordenada Y
    mov x3, 28       // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 150           // Coordenada X
    mov x2, 283              // Coordenada Y
    mov x3, 8       // Ancho
    mov x4, 3           // Alto
    bl rectangulo

     // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 150           // Coordenada X
    mov x2, 286              // Coordenada Y
    mov x3, 4       // Ancho
    mov x4, 3           // Alto
    bl rectangulo

     // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 169           // Coordenada X
    mov x2, 311              // Coordenada Y
    mov x3, 4        // Ancho
    mov x4, 13             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 153           // Coordenada X
    mov x2, 315              // Coordenada Y
    mov x3, 16        // Ancho
    mov x4, 4             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 145           // Coordenada X
    mov x2, 319             // Coordenada Y
    mov x3, 26        // Ancho
    mov x4, 4             // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 141           // Coordenada X
    mov x2, 323             // Coordenada Y
    mov x3, 20        // Ancho
    mov x4, 4             // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 167           // Coordenada X
    mov x2, 323             // Coordenada Y
    mov x3, 12        // Ancho
    mov x4, 4             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 159           // Coordenada X
    mov x2, 327             // Coordenada Y
    mov x3, 12        // Ancho
    mov x4, 4             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 138           // Coordenada X
    mov x2, 327             // Coordenada Y
    mov x3, 12        // Ancho
    mov x4, 4             // Alto
    bl rectangulo

       // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 134           // Coordenada X
    mov x2, 331            // Coordenada Y
    mov x3, 4        // Ancho
    mov x4, 4             // Alto
    bl rectangulo

     // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE 
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 169            // Coordenada X
    mov x2, 328              // Coordenada Y
    mov x3, 4        // Ancho
    mov x4, 4             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C) BORDE DERECHO ABAJO #2
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 181           // Coordenada X
    mov x2, 350              // Coordenada Y
    mov x3, 4        // Ancho
    mov x4, 30             // Alto
    bl rectangulo

//COLA
     // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 176           // Coordenada X
    mov x2, 372              // Coordenada Y
    mov x3, 4        // Ancho
    mov x4, 12             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 172           // Coordenada X
    mov x2, 380              // Coordenada Y
    mov x3, 4        // Ancho
    mov x4, 8             // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 168           // Coordenada X
    mov x2, 384              // Coordenada Y
    mov x3, 4        // Ancho
    mov x4, 4             // Alto
    bl rectangulo


    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 152              // Coordenada X
    mov x2, 388          // Coordenada Y
    mov x3, 16              // Ancho
    mov x4, 4            // Alto
    bl rectangulo

  //cola gris

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 152              // Coordenada X
    mov x2, 384          // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4            // Alto
    bl rectangulo
    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 156              // Coordenada X
    mov x2, 392          // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 8            // Alto
    bl rectangulo


    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 160              // Coordenada X
    mov x2, 398        // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 8            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 164              // Coordenada X
    mov x2, 402        // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 8            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 168              // Coordenada X
    mov x2, 410        // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 12            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 164              // Coordenada X
    mov x2, 421        // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 8            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 156              // Coordenada X
    mov x2, 430        // Coordenada Y
    mov x3, 8             // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 140              // Coordenada X
    mov x2, 434       // Coordenada Y
    mov x3, 16             // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 136              // Coordenada X
    mov x2, 426        // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 8            // Alto
    bl rectangulo

 //VELA !!


    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 248              // Coordenada X
    mov x2, 371        // Coordenada Y
    mov x3, 36            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 252              // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 28            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 256              // Coordenada X
    mov x2, 379        // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 256             // Coordenada X
    mov x2, 371         // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 260             // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 260             // Coordenada X
    mov x2, 355       // Coordenada Y
    mov x3, 12             // Ancho
    mov x4, 20            // Alto
    bl rectangulo


     // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 264             // Coordenada X
    mov x2, 351      // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    // Rectángulo amarillo
    ldr x10, =0x80FFFF00  // ARGB: A=128 (50%), R=255, G=255, B=0
    mov x1, 264             // Coordenada X
    mov x2, 348      // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4           // Alto
    bl rectangulo

     // Rectángulo amarillo
    ldr x10, =0x80FFFF00  // ARGB: A=128 (50%), R=255, G=255, B=0
    mov x1, 260             // Coordenada X
    mov x2, 343      // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //                  ANIMACION
    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    //:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::




.global animacion
animacion:
loop_animacion:
    ///////////////////////////
    // FRAME 1 - llama centrada
    ///////////////////////////

    ldr x10, =0x80FFFF00
    mov x1, 264
    mov x2, 348
    mov x3, 4
    mov x4, 4
    bl rectangulo

    ldr x10, =0x80FFCC00
    mov x1, 260
    mov x2, 343
    mov x3, 4
    mov x4, 4
    bl rectangulo

    /////////////////////////
    // LUZ ROJA            //
    ////////////////////////
    mov x3, #336                  // coordenada X del centro                        ::
    mov x16, #70                 // coordenada Y del centro                        ::
    mov x4, #4                   // radio horizontal (radX)                        ::
    mov x7, #4                   // radio vertical (radY)                          ::
    movz x10, 0xFFFF, lsl 16      // parte alta del color (ej. gris)                ::
    movk x10, 0x0000, lsl 0  
    bl circulo                    // llamada a función  

    //::::::::::::::::::::::::
    //:: CARTEL VERDE ::

movz x10, 0xFF00, lsl 16
movk x10, 0xFF0, lsl 0
// ===== LETRA O =====

mov x1, #360
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #372
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #363
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #363
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo


// ===== LETRA D =====
mov x1, #386
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #389
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #389
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #398
mov x2, #56
mov x3, #3
mov x4, #4
bl rectangulo


// ===== LETRA C =====
mov x1, #410
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #413
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #413
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo

// ===== NÚMERO 2 =====
mov x1, #360
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #369
mov x2, #71
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #360
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #360
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #360
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo


// ===== NÚMERO 0 =====
mov x1, #375
mov x2, #68
mov x3, #3
mov x4, #12
bl rectangulo

mov x1, #387
mov x2, #68
mov x3, #3
mov x4, #12
bl rectangulo

mov x1, #378
mov x2, #68
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #375
mov x2, #80
mov x3, #15
mov x4, #3
bl rectangulo


// ===== NÚMERO 2 =====
mov x1, #395
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #404
mov x2, #71
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #395
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #395
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #395
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo


// ===== NÚMERO 5 =====
mov x1, #410
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #410
mov x2, #68
mov x3, #3
mov x4, #6
bl rectangulo

mov x1, #410
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #419
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #410
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo 

    // Delay rápido
    movz x0, 0x1800, lsl 16
    movk x0, 0x0000
    bl delay

    // Borrar
////// fondo de la vela
    //marco central ventana
    mov x1, #267    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #16  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x0000 

    bl rectangulo
    // relleno central ventana
    mov x1, #271    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #8  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x4262 

    bl rectangulo

    //cielo vela
    mov x1, #250    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #17  // ancho
    mov x4, #49     // altura
    movz x10, 0xFF01, lsl 16     //Gis oscuro
    movk x10, 0x2233 

    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 248              // Coordenada X
    mov x2, 371        // Coordenada Y
    mov x3, 36            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 252              // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 28            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 256              // Coordenada X
    mov x2, 379        // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 256             // Coordenada X
    mov x2, 371         // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 260             // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 260             // Coordenada X
    mov x2, 355       // Coordenada Y
    mov x3, 12             // Ancho
    mov x4, 20            // Alto
    bl rectangulo


     // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 264             // Coordenada X
    mov x2, 351      // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    //////////////////////////////////
    // FRAME 2 - chispa a la izquierda
    //////////////////////////////////

    ldr x10, =0x80FFAA00
    mov x1, 258
    mov x2, 347
    mov x3, 4
    mov x4, 4
    bl rectangulo

    ldr x10, =0x80FF6600
    mov x1, 254
    mov x2, 344
    mov x3, 4
    mov x4, 4
    bl rectangulo

    /////////////////////////
    // LUZ NEGRA            //
    ////////////////////////
    mov x3, #336                  // coordenada X del centro                        ::
    mov x16, #70                 // coordenada Y del centro                        ::
    mov x4, #4                   // radio horizontal (radX)                        ::
    mov x7, #4                   // radio vertical (radY)                          ::
    movz x10, 0xFF00, lsl 16      // parte alta del color (ej. gris)                ::
    movk x10, 0x0000, lsl 0  
    bl circulo                    // llamada a función   

    //::::::::::::::
    //:: CARTEL CIAN

movz x10, 0xFF00, lsl 16
movk x10, 0xFFFF, lsl 0
// ===== LETRA O =====

mov x1, #360
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #372
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #363
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #363
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo


// ===== LETRA D =====
mov x1, #386
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #389
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #389
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #398
mov x2, #56
mov x3, #3
mov x4, #4
bl rectangulo


// ===== LETRA C =====
mov x1, #410
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #413
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #413
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo

// ===== NÚMERO 2 =====
mov x1, #360
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #369
mov x2, #71
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #360
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #360
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #360
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo


// ===== NÚMERO 0 =====
mov x1, #375
mov x2, #68
mov x3, #3
mov x4, #12
bl rectangulo

mov x1, #387
mov x2, #68
mov x3, #3
mov x4, #12
bl rectangulo

mov x1, #378
mov x2, #68
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #375
mov x2, #80
mov x3, #15
mov x4, #3
bl rectangulo


// ===== NÚMERO 2 =====
mov x1, #395
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #404
mov x2, #71
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #395
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #395
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #395
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo


// ===== NÚMERO 5 =====
mov x1, #410
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #410
mov x2, #68
mov x3, #3
mov x4, #6
bl rectangulo

mov x1, #410
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #419
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #410
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo

    movz x0, 0x1800, lsl 16
    movk x0, 0x0000
    bl delay

////// fondo de la vela
    //marco central ventana
    mov x1, #267    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #16  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x0000 

    bl rectangulo
    // relleno central ventana
    mov x1, #271    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #8  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x4262 

    bl rectangulo

    //cielo vela
    mov x1, #250    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #17  // ancho
    mov x4, #49     // altura
    movz x10, 0xFF01, lsl 16     //Gis oscuro
    movk x10, 0x2233 

    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 248              // Coordenada X
    mov x2, 371        // Coordenada Y
    mov x3, 36            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 252              // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 28            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 256              // Coordenada X
    mov x2, 379        // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 256             // Coordenada X
    mov x2, 371         // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 260             // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 260             // Coordenada X
    mov x2, 355       // Coordenada Y
    mov x3, 12             // Ancho
    mov x4, 20            // Alto
    bl rectangulo


     // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 264             // Coordenada X
    mov x2, 351      // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4           // Alto
    bl rectangulo


    ////////////////////////////////
    // FRAME 3 - chispa a la derecha
    ////////////////////////////////


    ldr x10, =0x80FFFF33
    mov x1, 268
    mov x2, 348
    mov x3, 4
    mov x4, 4
    bl rectangulo

    ldr x10, =0x80FF9900
    mov x1, 272
    mov x2, 345
    mov x3, 4
    mov x4, 4
    bl rectangulo

        /////////////////////////
    // LUZ roja            //
    ////////////////////////
    mov x3, #336                  // coordenada X del centro                        ::
    mov x16, #70                 // coordenada Y del centro                        ::
    mov x4, #4                   // radio horizontal (radX)                        ::
    mov x7, #4                   // radio vertical (radY)                          ::
    movz x10, 0xFFFF, lsl 16      // parte alta del color (ej. gris)                ::
    movk x10, 0x0000, lsl 0  
    bl circulo                    // llamada a función   

    //:::::::::::
    // CARTEL FUCCIA

movz x10, 0xFFFF, lsl 16
movk x10, 0x00FF, lsl 0
// ===== LETRA O =====

mov x1, #360
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #372
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #363
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #363
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo


// ===== LETRA D =====
mov x1, #386
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #389
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #389
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #398
mov x2, #56
mov x3, #3
mov x4, #4
bl rectangulo


// ===== LETRA C =====
mov x1, #410
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #413
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #413
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo

// ===== NÚMERO 2 =====
mov x1, #360
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #369
mov x2, #71
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #360
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #360
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #360
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo


// ===== NÚMERO 0 =====
mov x1, #375
mov x2, #68
mov x3, #3
mov x4, #12
bl rectangulo

mov x1, #387
mov x2, #68
mov x3, #3
mov x4, #12
bl rectangulo

mov x1, #378
mov x2, #68
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #375
mov x2, #80
mov x3, #15
mov x4, #3
bl rectangulo


// ===== NÚMERO 2 =====
mov x1, #395
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #404
mov x2, #71
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #395
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #395
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #395
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo


// ===== NÚMERO 5 =====
mov x1, #410
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #410
mov x2, #68
mov x3, #3
mov x4, #6
bl rectangulo

mov x1, #410
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #419
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #410
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo

    movz x0, 0x1800, lsl 16
    movk x0, 0x0000
    bl delay

////// fondo de la vela
    //marco central ventana
    mov x1, #267    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #16  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x0000 

    bl rectangulo
    // relleno central ventana
    mov x1, #271    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #8  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x4262 

    bl rectangulo

    //cielo vela
    mov x1, #250    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #17  // ancho
    mov x4, #49     // altura
    movz x10, 0xFF01, lsl 16     //Gis oscuro
    movk x10, 0x2233 

    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 248              // Coordenada X
    mov x2, 371        // Coordenada Y
    mov x3, 36            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 252              // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 28            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 256              // Coordenada X
    mov x2, 379        // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 256             // Coordenada X
    mov x2, 371         // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 260             // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 260             // Coordenada X
    mov x2, 355       // Coordenada Y
    mov x3, 12             // Ancho
    mov x4, 20            // Alto
    bl rectangulo


     // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 264             // Coordenada X
    mov x2, 351      // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4           // Alto
    bl rectangulo


    //////////////////////////////////////
    // FRAME 4 - llama intermitente pequeña
    ///////////////////////////////////////


    ldr x10, =0x80FF8800
    mov x1, 262
    mov x2, 346
    mov x3, 4
    mov x4, 2
    bl rectangulo

    ldr x10, =0x80FFAA33
    mov x1, 266
    mov x2, 344
    mov x3, 2
    mov x4, 2
    bl rectangulo

        /////////////////////////
    // LUZ NEGRA            //
    ////////////////////////
    mov x3, #336                  // coordenada X del centro                        ::
    mov x16, #70                 // coordenada Y del centro                        ::
    mov x4, #4                   // radio horizontal (radX)                        ::
    mov x7, #4                   // radio vertical (radY)                          ::
    movz x10, 0xFF00, lsl 16      // parte alta del color (ej. gris)                ::
    movk x10, 0x0000, lsl 0  
    bl circulo                    // llamada a función


//:::::::::::::::::
//:: CARTEL AZUL

movz x10, 0xFF00, lsl 16
movk x10, 0xAFFF, lsl 0
// ===== LETRA O =====

mov x1, #360
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #372
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #363
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #363
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo


// ===== LETRA D =====
mov x1, #386
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #389
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #389
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #398
mov x2, #56
mov x3, #3
mov x4, #4
bl rectangulo


// ===== LETRA C =====
mov x1, #410
mov x2, #53
mov x3, #3
mov x4, #10
bl rectangulo

mov x1, #413
mov x2, #53
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #413
mov x2, #60
mov x3, #9
mov x4, #3
bl rectangulo

// ===== NÚMERO 2 =====
mov x1, #360
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #369
mov x2, #71
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #360
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #360
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #360
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo


// ===== NÚMERO 0 =====
mov x1, #375
mov x2, #68
mov x3, #3
mov x4, #12
bl rectangulo

mov x1, #387
mov x2, #68
mov x3, #3
mov x4, #12
bl rectangulo

mov x1, #378
mov x2, #68
mov x3, #9
mov x4, #3
bl rectangulo

mov x1, #375
mov x2, #80
mov x3, #15
mov x4, #3
bl rectangulo


// ===== NÚMERO 2 =====
mov x1, #395
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #404
mov x2, #71
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #395
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #395
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #395
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo


// ===== NÚMERO 5 =====
mov x1, #410
mov x2, #68
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #410
mov x2, #68
mov x3, #3
mov x4, #6
bl rectangulo

mov x1, #410
mov x2, #74
mov x3, #12
mov x4, #3
bl rectangulo

mov x1, #419
mov x2, #77
mov x3, #3
mov x4, #4
bl rectangulo

mov x1, #410
mov x2, #80
mov x3, #12
mov x4, #3
bl rectangulo   

    movz x0, 0x1800, lsl 16
    movk x0, 0x0000
    bl delay

////// fondo de la vela/////////

    //marco central ventana
    mov x1, #267    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #16  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x0000 

    bl rectangulo
    // relleno central ventana
    mov x1, #271    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #8  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x4262 

    bl rectangulo

    //cielo vela
    mov x1, #250    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #17  // ancho
    mov x4, #49     // altura
    movz x10, 0xFF01, lsl 16     //Gis oscuro
    movk x10, 0x2233 

    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 248              // Coordenada X
    mov x2, 371        // Coordenada Y
    mov x3, 36            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 252              // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 28            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 256              // Coordenada X
    mov x2, 379        // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 256             // Coordenada X
    mov x2, 371         // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 260             // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 260             // Coordenada X
    mov x2, 355       // Coordenada Y
    mov x3, 12             // Ancho
    mov x4, 20            // Alto
    bl rectangulo


     // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 264             // Coordenada X
    mov x2, 351      // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4           // Alto
    bl rectangulo


    ///////////////////////////////////
    // FRAME 5 - centelleo en diagonal
    //////////////////////////////////

    ldr x10, =0x80FF5500
    mov x1, 266
    mov x2, 342
    mov x3, 4
    mov x4, 4
    bl rectangulo

    ldr x10, =0x80FF8800
    mov x1, 262
    mov x2, 339
    mov x3, 2
    mov x4, 2
    bl rectangulo

        /////////////////////////
    // LUZ roja           //
    ////////////////////////
    mov x3, #336                  // coordenada X del centro                        ::
    mov x16, #70                 // coordenada Y del centro                        ::
    mov x4, #4                   // radio horizontal (radX)                        ::
    mov x7, #4                   // radio vertical (radY)                          ::
    movz x10, 0xFFFF, lsl 16      // parte alta del color (ej. gris)                ::
    movk x10, 0x0000, lsl 0  
    bl circulo                    // llamada a función   

    movz x0, 0x1800, lsl 16
    movk x0, 0x0000
    bl delay

    ldr x10, =0x00404040
    mov x1, 260
    mov x2, 338
    mov x3, 16
    mov x4, 14
    bl rectangulo


////// fondo de la vela/////////

    //marco central ventana
    mov x1, #267    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #16  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x0000 

    bl rectangulo
    // relleno central ventana
    mov x1, #271    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #8  // ancho
    mov x4, #54     // altura
    movz x10, 0xFF00, lsl 16     //Gis oscuro
    movk x10, 0x4262 

    bl rectangulo

    //cielo vela
    mov x1, #250    // X inicio
    mov x2, #310 // Y inicio
    mov x3, #17  // ancho
    mov x4, #49     // altura
    movz x10, 0xFF01, lsl 16     //Gis oscuro
    movk x10, 0x2233 

    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 248              // Coordenada X
    mov x2, 371        // Coordenada Y
    mov x3, 36            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    
    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 252              // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 28            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo gris oscuro pero perceptible (0x000C0C0C)
    ldr x10, =0x00121212  // Gris ligeramente más claro  // Un paso más claro    // Alpha (00) + R=0C, G=0C, B=0C
    mov x1, 256              // Coordenada X
    mov x2, 379        // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4            // Alto
    bl rectangulo

    // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 256             // Coordenada X
    mov x2, 371         // Coordenada Y
    mov x3, 20            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

     // Rectángulo NEGRO (0x00000000)
    movz x10, 0x00, lsl 16    // Alpha + Rojo (00)
    movk x10, 0x0000, lsl 00   // Verde + Azul (00)
    mov x1, 260             // Coordenada X
    mov x2, 375        // Coordenada Y
    mov x3, 12            // Ancho
    mov x4, 4           // Alto
    bl rectangulo

    // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 260             // Coordenada X
    mov x2, 355       // Coordenada Y
    mov x3, 12             // Ancho
    mov x4, 20            // Alto
    bl rectangulo


     // Rectángulo gris medio
    ldr x10, =0x00404040  // Gris medio (más claro que 0x00121212)
    mov x1, 264             // Coordenada X
    mov x2, 351      // Coordenada Y
    mov x3, 4             // Ancho
    mov x4, 4           // Alto
    bl rectangulo


    // Volver al loop
    b loop_animacion


    // DEJO LISTAS LAS VENTANAS PARA ANIMAR DESPUES

//////////////   ILUMINACION GENERAL, SON 6 VENTANAS     //////////

	//:::::::::::: ventana 1 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #320             // coordenada X (Esquina superior izq)     ::
    mov x2, #150              // coordenada Y (esquina superior izq)     ::
    mov x3, #30              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF55, lsl 16  // parte alta del color                    ::
    movk x10, 0x5500, lsl 0   // parte baja del color                    :: 
	bl rectangulo

    	//:::::::::::: ventana 1 FOCO ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #335             // coordenada X (Esquina superior izq)     ::
    mov x2, #150              // coordenada Y (esquina superior izq)     ::
    mov x3, #3              // ancho                                   ::
    mov x4, #2              // altura                                  ::
    movz x10, 0xFFFF, lsl 16  // parte alta del color                    ::
    movk x10, 0xFF00, lsl 0   // parte baja del color                    :: 
	bl rectangulo

		//:::::::::::: ventana 2 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #320             // coordenada X (Esquina superior izq)     ::
    mov x2, #210              // coordenada Y (esquina superior izq)     ::
    mov x3, #30              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF55, lsl 16  // parte alta del color                    ::
    movk x10, 0x5500, lsl 0   // parte baja del color                    :: 
	bl rectangulo

    		//:::::::::::: ventana 2 FOCO ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #330             // coordenada X (Esquina superior izq)     ::
    mov x2, #210              // coordenada Y (esquina superior izq)     ::
    mov x3, #8              // ancho                                   ::
    mov x4, #2              // altura                                  ::
          
	bl rectangulo

		//:::::::::::: ventana 3 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #320             // coordenada X (Esquina superior izq)     ::
    mov x2, #300              // coordenada Y (esquina superior izq)     ::
    mov x3, #30              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF55, lsl 16  // parte alta del color                    ::
    movk x10, 0x5500, lsl 0   // parte baja del color                    :: 
	bl rectangulo

    		//:::::::::::: ventana 3 FOCO::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #340             // coordenada X (Esquina superior izq)     ::
    mov x2, #300              // coordenada Y (esquina superior izq)     ::
    mov x3, #3              // ancho                                   ::
    mov x4, #3              // altura                                  ::

	bl rectangulo

		//:::::::::::: ventana 4 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #360             // coordenada X (Esquina superior izq)     ::
    mov x2, #250              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF55, lsl 16  // parte alta del color                    ::
    movk x10, 0x5500, lsl 0   // parte baja del color                    :: 
	bl rectangulo

    
		//:::::::::::: ventana 4 FOCO ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #373             // coordenada X (Esquina superior izq)     ::
    mov x2, #250              // coordenada Y (esquina superior izq)     ::
    mov x3, #2              // ancho                                   ::
    mov x4, #3              // altura                                  ::
   
	bl rectangulo

		//:::::::::::: ventana 5 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #415             // coordenada X (Esquina superior izq)     ::
    mov x2, #120              // coordenada Y (esquina superior izq)     ::
    mov x3, #30              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF55, lsl 16  // parte alta del color                    ::
    movk x10, 0x5500, lsl 0   // parte baja del color                    :: 
	bl rectangulo

    		//:::::::::::: ventana 5 FOCO ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #428             // coordenada X (Esquina superior izq)     ::
    mov x2, #120              // coordenada Y (esquina superior izq)     ::
    mov x3, #3              // ancho                                   ::
    mov x4, #3              // altura                                  ::
   
	bl rectangulo

			//:::::::::::: ventana 6 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #415             // coordenada X (Esquina superior izq)     ::
    mov x2, #300              // coordenada Y (esquina superior izq)     ::
    mov x3, #30              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF55, lsl 16  // parte alta del color                    ::
    movk x10, 0x5500, lsl 0   // parte baja del color                    :: 
	bl rectangulo



			//:::::::::::: ventana 6 FOCO::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #420             // coordenada X (Esquina superior izq)     ::
    mov x2, #300              // coordenada Y (esquina superior izq)     ::
    mov x3, #2              // ancho                                   ::
    mov x4, #2              // altura                                  ::
    
	bl rectangulo

	mov x0, x20              // framebuffer base                        ::
    mov x1, #425             // coordenada X (Esquina superior izq)     ::
    mov x2, #300              // coordenada Y (esquina superior izq)     ::
    mov x3, #2              // ancho                                   ::
    mov x4, #2              // altura                                  ::
    
	bl rectangulo






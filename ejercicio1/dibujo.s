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

    //::::::::::::::::::::::::::::AUTOS::::::::::::::::::::

    //...... RECTANGULOS PRINCIPles......


mov x1, #250             // coordenada X (Esquina superior izq)     ::
mov x2, #293              // coordenada Y (esquina superior izq)    ::
mov x3, #15              // ancho                                   ::
mov x4, #7              // altura                                   ::
movz x10, 0xFF30, lsl 16  // parte alta del color (gris)             ::
movk x10, 0x0020, lsl 0   // parte baja del color (gris)             ::
bl rectangulo 

// ...... RECTANGULOS superiores .....

mov x1, #253             // coordenada X (Esquina superior izq)     ::
mov x2, #288              // coordenada Y (esquina superior izq)    ::
mov x3, #9              // ancho                                    ::
mov x4, #5              // altura                                   ::
bl rectangulo 


// ...........LUCES AUTO ........

mov x0, x20              // framebuffer base                        ::
mov x1, #250             // coordenada X (Esquina superior izq)     ::
mov x2, #293              // coordenada Y (esquina superior izq)     ::
mov x3, #3              // ancho                                   ::
mov x4, #3              // altura                                  ::
movz x10, 0xFFFF, lsl 16  // parte alta del color                    ::
movk x10, 0xFF00, lsl 0   // parte baja del color                    ::
bl rectangulo 


    //::::::::::::::::::TERMINARON LOS AUTOS::::::::::::::::


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

    //luz

        
    movz x10, 0xFFFF, lsl 16      // parte alta del color (ej. gris)                ::
    movk x10, 0x0000, lsl 0       // parte baja del color (ej. gris)                ::


    mov x3, #336                  // coordenada X del centro                        ::
    mov x16, #70                 // coordenada Y del centro                        ::
    mov x4, #4                   // radio horizontal (radX)                        ::
    mov x7, #4                   // radio vertical (radY)                          ::
    bl circulo                    // llamada a función   





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

		//:::::::::::: ventana 2 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #320             // coordenada X (Esquina superior izq)     ::
    mov x2, #210              // coordenada Y (esquina superior izq)     ::
    mov x3, #30              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF55, lsl 16  // parte alta del color                    ::
    movk x10, 0x5500, lsl 0   // parte baja del color                    :: 
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

		//:::::::::::: ventana 4 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #360             // coordenada X (Esquina superior izq)     ::
    mov x2, #250              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF55, lsl 16  // parte alta del color                    ::
    movk x10, 0x5500, lsl 0   // parte baja del color                    :: 
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

			//:::::::::::: ventana 6 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #415             // coordenada X (Esquina superior izq)     ::
    mov x2, #300              // coordenada Y (esquina superior izq)     ::
    mov x3, #30              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF55, lsl 16  // parte alta del color                    ::
    movk x10, 0x5500, lsl 0   // parte baja del color                    :: 
	bl rectangulo

	
    //////////////////////////FOCOS DE LUZ///////////////////////////////

	//:::::::::::: ventana 1 ::::::::::::::::::::

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
    mov x1, #330             // coordenada X (Esquina superior izq)     ::
    mov x2, #210              // coordenada Y (esquina superior izq)     ::
    mov x3, #8              // ancho                                   ::
    mov x4, #2              // altura                                  ::
          
	bl rectangulo

		//:::::::::::: ventana 3 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #340             // coordenada X (Esquina superior izq)     ::
    mov x2, #300              // coordenada Y (esquina superior izq)     ::
    mov x3, #3              // ancho                                   ::
    mov x4, #3              // altura                                  ::

	bl rectangulo

		//:::::::::::: ventana 4 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #373             // coordenada X (Esquina superior izq)     ::
    mov x2, #250              // coordenada Y (esquina superior izq)     ::
    mov x3, #2              // ancho                                   ::
    mov x4, #3              // altura                                  ::
   
	bl rectangulo

		//:::::::::::: ventana 5 ::::::::::::::::::::

	mov x0, x20              // framebuffer base                        ::
    mov x1, #428             // coordenada X (Esquina superior izq)     ::
    mov x2, #120              // coordenada Y (esquina superior izq)     ::
    mov x3, #3              // ancho                                   ::
    mov x4, #3              // altura                                  ::
   
	bl rectangulo

			//:::::::::::: ventana 6 ::::::::::::::::::::

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

    ldp x29, x30, [sp], #16     // restaurás lo que guardaste
ret                         // ahora sí, volvé tranquilo


    //:::::::::::::::::::::::
	//:: LLUVIA            ::
	//:::::::::::::::::::::::

.global lluvia
lluvia:

stp x29, x30, [sp, #-16]!   // guardás el frame anterior y x30
mov x29, sp                 // nuevo frame pointer

	// Gota 1
    mov x0, x20
    mov x1, #110
    mov x2, #60     //Y
    mov x3, #2
    mov x4, #10
    movz x10, 0xFF44, lsl 16
    movk x10, 0x4444, lsl 0
    bl rectangulo


    





// Gota 2
   mov x0, x20
   mov x1, #125
   mov x2, #80
   mov x3, #1
   mov x4, #12
   bl rectangulo

// Gota 3
   mov x0, x20
   mov x1, #140
   mov x2, #100
   mov x3, #2
   mov x4, #7
   bl rectangulo

// Gota 4
   mov x0, x20
   mov x1, #160
   mov x2, #120
   mov x3, #1
   mov x4, #15
   bl rectangulo

// Gota 5
mov x0, x20
mov x1, #180
mov x2, #140
mov x3, #2
mov x4, #6
bl rectangulo

// Gota 6
mov x0, x20
mov x1, #200
mov x2, #160
mov x3, #1
mov x4, #9
bl rectangulo

// Gota 7
mov x0, x20
mov x1, #220
mov x2, #180
mov x3, #2
mov x4, #13
bl rectangulo

// Gota 8
mov x0, x20
mov x1, #240
mov x2, #75
mov x3, #1
mov x4, #11
bl rectangulo

// Gota 9
mov x0, x20
mov x1, #260
mov x2, #95
mov x3, #2
mov x4, #14
bl rectangulo

// Gota 10
mov x0, x20
mov x1, #280
mov x2, #115
mov x3, #1
mov x4, #8
bl rectangulo

// Gota 11
mov x0, x20
mov x1, #300
mov x2, #135
mov x3, #2
mov x4, #12
bl rectangulo

// Gota 12
mov x0, x20
mov x1, #320
mov x2, #155
mov x3, #1
mov x4, #9
bl rectangulo

// Gota 13
mov x0, x20
mov x1, #340
mov x2, #175
mov x3, #2
mov x4, #10
bl rectangulo

// Gota 14
mov x0, x20
mov x1, #360
mov x2, #195
mov x3, #1
mov x4, #7
bl rectangulo

// Gota 15
mov x0, x20
mov x1, #380
mov x2, #215
mov x3, #2
mov x4, #13
bl rectangulo

// Gota 16
mov x0, x20
mov x1, #400
mov x2, #235
mov x3, #1
mov x4, #6
bl rectangulo

// Gota 17
mov x0, x20
mov x1, #420
mov x2, #255
mov x3, #2
mov x4, #14
bl rectangulo

// Gota 18
mov x0, x20
mov x1, #440
mov x2, #275
mov x3, #1
mov x4, #9
bl rectangulo

// Gota 19
mov x0, x20
mov x1, #120
mov x2, #295
mov x3, #2
mov x4, #11
bl rectangulo

// Gota 20
mov x0, x20
mov x1, #145
mov x2, #315
mov x3, #1
mov x4, #10
bl rectangulo



// Gota 21
mov x0, x20
mov x1, #170
mov x2, #335
mov x3, #2
mov x4, #8
bl rectangulo

// Gota 22
mov x0, x20
mov x1, #190
mov x2, #355
mov x3, #1
mov x4, #7
bl rectangulo

// Gota 23
mov x0, x20
mov x1, #210
mov x2, #90
mov x3, #2
mov x4, #11
bl rectangulo

// Gota 24
mov x0, x20
mov x1, #230
mov x2, #115
mov x3, #1
mov x4, #6
bl rectangulo

// Gota 25
mov x0, x20
mov x1, #250
mov x2, #140
mov x3, #2
mov x4, #13
bl rectangulo

// Gota 26
mov x0, x20
mov x1, #270
mov x2, #165
mov x3, #1
mov x4, #10
bl rectangulo

// Gota 27
mov x0, x20
mov x1, #290
mov x2, #190
mov x3, #2
mov x4, #9
bl rectangulo

// Gota 28
mov x0, x20
mov x1, #310
mov x2, #215
mov x3, #1
mov x4, #12
bl rectangulo

// Gota 29
mov x0, x20
mov x1, #330
mov x2, #240
mov x3, #2
mov x4, #7
bl rectangulo

// Gota 30
mov x0, x20
mov x1, #350
mov x2, #265
mov x3, #1
mov x4, #8
bl rectangulo

// Gota 31
mov x0, x20
mov x1, #120
mov x2, #100
mov x3, #2
mov x4, #10
bl rectangulo

// Gota 32
mov x0, x20
mov x1, #145
mov x2, #280
mov x3, #1
mov x4, #6
bl rectangulo

// Gota 33
mov x0, x20
mov x1, #165
mov x2, #75
mov x3, #2
mov x4, #12
bl rectangulo

// Gota 34
mov x0, x20
mov x1, #185
mov x2, #130
mov x3, #1
mov x4, #9
bl rectangulo

// Gota 35
mov x0, x20
mov x1, #205
mov x2, #300
mov x3, #2
mov x4, #7
bl rectangulo

// Gota 36
mov x0, x20
mov x1, #225
mov x2, #60
mov x3, #1
mov x4, #11
bl rectangulo

// Gota 37
mov x0, x20
mov x1, #245
mov x2, #200
mov x3, #2
mov x4, #8
bl rectangulo

// Gota 38
mov x0, x20
mov x1, #290
mov x2, #330
mov x3, #1
mov x4, #13
bl rectangulo

// Gota 39
mov x0, x20
mov x1, #285
mov x2, #170
mov x3, #2
mov x4, #10
bl rectangulo

// Gota 40
mov x0, x20
mov x1, #305
mov x2, #110
mov x3, #1
mov x4, #6
bl rectangulo

// Gota 41
mov x0, x20
mov x1, #105
mov x2, #110
mov x3, #1
mov x4, #10
bl rectangulo

// Gota 42
mov x0, x20
mov x1, #112
mov x2, #150
mov x3, #2
mov x4, #8
bl rectangulo

// Gota 43
mov x0, x20
mov x1, #118
mov x2, #190
mov x3, #1
mov x4, #12
bl rectangulo

// Gota 44
mov x0, x20
mov x1, #125
mov x2, #130
mov x3, #2
mov x4, #6
bl rectangulo

// Gota 45
mov x0, x20
mov x1, #135
mov x2, #170
mov x3, #1
mov x4, #9
bl rectangulo

// Gota 46
mov x0, x20
mov x1, #140
mov x2, #115
mov x3, #2
mov x4, #11
bl rectangulo

// Gota 47
mov x0, x20
mov x1, #110
mov x2, #230
mov x3, #1
mov x4, #7
bl rectangulo

// Gota 48
mov x0, x20
mov x1, #122
mov x2, #260
mov x3, #2
mov x4, #10
bl rectangulo

// Gota 49
mov x0, x20
mov x1, #130
mov x2, #290
mov x3, #1
mov x4, #9
bl rectangulo

// Gota 50
mov x0, x20
mov x1, #145
mov x2, #200
mov x3, #2
mov x4, #13
bl rectangulo

// Gota 51
mov x0, x20
mov x1, #410
mov x2, #50
mov x3, #2
mov x4, #10
bl rectangulo

// Gota 52
mov x0, x20
mov x1, #420
mov x2, #60
mov x3, #1
mov x4, #8
bl rectangulo

// Gota 53
mov x0, x20
mov x1, #435
mov x2, #70
mov x3, #2
mov x4, #12
bl rectangulo

// Gota 54
mov x0, x20
mov x1, #445
mov x2, #45
mov x3, #1
mov x4, #6
bl rectangulo

// Gota 55
mov x0, x20
mov x1, #428
mov x2, #80
mov x3, #2
mov x4, #9
bl rectangulo

// Gota 56
mov x0, x20
mov x1, #412
mov x2, #100
mov x3, #1
mov x4, #7
bl rectangulo

// Gota 57
mov x0, x20
mov x1, #418
mov x2, #90
mov x3, #2
mov x4, #10
bl rectangulo

// Gota 58
mov x0, x20
mov x1, #439
mov x2, #110
mov x3, #1
mov x4, #8
bl rectangulo

// Gota 59
mov x0, x20
mov x1, #444
mov x2, #130
mov x3, #2
mov x4, #11
bl rectangulo

// Gota 60
mov x0, x20
mov x1, #430
mov x2, #140
mov x3, #1
mov x4, #9
bl rectangulo



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



//::::::::::::: CALENDARIO ::::::::::::::::

	            
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

// ::::::::::: relleno gris :::::::::::

// Rectángulo grande blanco (fondo de los días)
                
mov x1, #525             // X: borde interno
mov x2, #155             // Y: borde interno
mov x3, #90              // ancho
mov x4, #65              // alto
movz x10, 0xFFea, lsl 16    // Color blanco
movk x10, 0xeaea 

bl rectangulo

//segundo bloque

	            
    mov x1, #525           // X inicio
    mov x2, #225      // Y inicio
    mov x3, #95        // ancho
    mov x4, #10      // altura
    movz x10, 0xFFea, lsl 16     //Gis oscuro
    movk x10, 0xeaea 

bl rectangulo

//tercer bloque

	            
    mov x1, #525           // X inicio
    mov x2, #235      // Y inicio
    mov x3, #100        // ancho
    mov x4, #4      // altura
    movz x10, 0xFFcc, lsl 16     //Gis oscuro
    movk x10, 0xcccc 

bl rectangulo

//cuarto bloque

	            
    mov x1, #525           // X inicio
    mov x2, #243      // Y inicio
    mov x3, #95        // ancho
    mov x4, #6  // altura
    movz x10, 0xFFcc, lsl 16     //Gis oscuro
    movk x10, 0xcccc 

    bl rectangulo

//final

	            
    mov x1, #528           // X inicio
    mov x2, #253      // Y inicio
    mov x3, #87        // ancho
    mov x4, #6  // altura
    movz x10, 0xFFcc, lsl 16     //Gis oscuro
    movk x10, 0xcccc 

    bl rectangulo



//::::::::::::::::: CUADRICULA :::::::::::::::::::::

//

	            
    mov x1, #525           // X inicio
    mov x2, #220 // Y inicio
    mov x3, #95        // ancho
    mov x4, #5  // altura
    movz x10, 0xFFcc, lsl 16     //Gis oscuro
    movk x10, 0xCCCC 

    bl rectangulo

/////
// Líneas verticales de la grilla
 
mov x2, #150         // Y fijo
mov x3, #5           // ancho de la línea
mov x4, #70         // alto de la línea
movz x10, 0xFFcc, lsl 16  
movk x10, 0xCCCC 

mov x1, #538
mov x2, #150         // Y fijo
bl rectangulo

mov x1, #558
mov x2, #150         // Y fijo

bl rectangulo

mov x1, #578
mov x2, #150         // Y fijo

bl rectangulo

mov x1, #598
mov x2, #150         // Y fijo

bl rectangulo

 
mov x2, #225         // Y fijo
mov x3, #5           // ancho de la línea
mov x4, #10         // alto de la línea
movz x10, 0xFFcc, lsl 16  
movk x10, 0xCCCC 

mov x1, #543
mov x2, #225         // Y fijo

bl rectangulo

mov x1, #563
mov x2, #225         // Y fijo

bl rectangulo

mov x1, #583
mov x2, #225         // Y fijo

bl rectangulo

mov x1, #603
mov x2, #225         // Y fijo

bl rectangulo


// Líneas horizontales de la grilla
 
mov x1, #525         // X fijo
mov x3, #90         // ancho de la línea
mov x4, #5           // alto de la línea
movz x10, 0xFFcc, lsl 16  
movk x10, 0xCCCC 

mov x2, #160
bl rectangulo

mov x2, #180
bl rectangulo

mov x2, #200
bl rectangulo

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

////// debajo ventana ///////////////////

mov x2, #440
mov x3, #30         // ancho de la línea
mov x4, #40           // alto de la línea
movz x10, 0xFF03, lsl 16  
movk x10, 0x2837, lsl 0

mov x2, #440
mov x3, #30         // ancho de la línea
mov x4, #40           // alto de la línea
movz x10, 0xFF03, lsl 16  
movk x10, 0x2837, lsl 0
mov x1, #120

bl rectangulo

mov x2, #440
mov x3, #30         // ancho de la línea
mov x4, #40           // alto de la línea
movz x10, 0xFF03, lsl 16  
movk x10, 0x2837, lsl 0
mov x1, #134

bl rectangulo

mov x2, #440
mov x3, #30         // ancho de la línea
mov x4, #40           // alto de la línea
movz x10, 0xFF03, lsl 16  
movk x10, 0x2837, lsl 0
mov x1, #146

bl rectangulo

mov x2, #440
mov x3, #30         // ancho de la línea
mov x4, #40           // alto de la línea
movz x10, 0xFF03, lsl 16  
movk x10, 0x2837, lsl 0
mov x1, #158

bl rectangulo

mov x2, #440
mov x3, #30         // ancho de la línea
mov x4, #40           // alto de la línea
movz x10, 0xFF03, lsl 16  
movk x10, 0x2837, lsl 0
mov x1, #170

bl rectangulo

mov x2, #440
mov x3, #30         // ancho de la línea
mov x4, #40           // alto de la línea
movz x10, 0xFF03, lsl 16  
movk x10, 0x2837, lsl 0
mov x1, #182

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
    mov x2, 422        // Coordenada Y
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

    

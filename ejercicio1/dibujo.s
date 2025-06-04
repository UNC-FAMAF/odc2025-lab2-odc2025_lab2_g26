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

    mov x1, #350             // coordenada X (Esquina superior izq)     ::
    mov x2, #85              // coordenada Y (esquina superior izq)     ::
    mov x3, #20              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF11, lsl 16  // parte alta del color                    ::
    movk x10, 0x1111, lsl 0   // parte baja del color                    ::
    bl rectangulo   

    //antena
    mov x1, #355             // coordenada X (Esquina superior izq)     ::
    mov x2, #70              // coordenada Y (esquina superior izq)     ::
    mov x3, #3              // ancho                                   ::
    mov x4, #15              // altura                                  ::
    movz x10, 0xFF33, lsl 16  // parte alta del color                    ::
    movk x10, 0x3333, lsl 0   // parte baja del color                    ::
    bl rectangulo   

    //luz

        
    movz x10, 0xFFFF, lsl 16      // parte alta del color (ej. gris)                ::
    movk x10, 0x0000, lsl 0       // parte baja del color (ej. gris)                ::


    mov x3, #356                  // coordenada X del centro                        ::
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

    

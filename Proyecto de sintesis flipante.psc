Algoritmo JuegoBusquedaLlaves
    Definir nombreJugador Como Caracter
    Definir posX, posY, llavesRecolectadas, vidas, fila, columna Como Entero
    Definir llave1, llave2, llave3, llave4, salidaEncontrada Como Logico
    Definir opcion, camino Como Entero
    
    // Inicializar variables
    posX <- 1
    posY <- 1
    llavesRecolectadas <- 0
    vidas <- 3
    llave1 <- Falso
    llave2 <- Falso
    llave3 <- Falso
    llave4 <- Falso
    salidaEncontrada <- Falso
    
    // Interfaz inicial
    Escribir "=== JUEGO DE BÚSQUEDA DE LLAVES ==="
    Escribir ""
    Escribir "Objetivo: Encuentra las 4 llaves escondidas"
    Escribir "          y escapa del laberinto."
    Escribir ""
    Escribir "Controles:"
    Escribir "  W - Arriba"
    Escribir "  A - Izquierda"
    Escribir "  S - Abajo"
    Escribir "  D - Derecha"
    Escribir "  Q - Salir del juego"
    Escribir ""
    Escribir "Ingresa tu nombre: "
    Leer nombreJugador
    
    Borrar Pantalla
    
    // Bucle principal del juego
    Mientras NO salidaEncontrada Y vidas > 0 Hacer
        
        Escribir "=== LABERINTO ==="
        Escribir "Jugador: ", nombreJugador
        Escribir "Posición: (", posX, ",", posY, ")"
        Escribir "Llaves: ", llavesRecolectadas, "/4"
        Escribir "Vidas: ", vidas
        Escribir ""
        
        
        Para fila <- 1 Hasta 5 Hacer
            Para columna <- 1 Hasta 5 Hacer
                Si fila = posY Y columna = posX Entonces
                    Escribir "P " Sin Saltar
                Sino 
                    Si (fila = 2 Y columna = 3) O (fila = 4 Y columna = 1) O (fila = 5 Y columna = 4) O (fila = 3 Y columna = 5) Entonces
                        Si (fila = 2 Y columna = 3 Y NO llave1) O (fila = 4 Y columna = 1 Y NO llave2) O (fila = 5 Y columna = 4 Y NO llave3) O (fila = 3 Y columna = 5 Y NO llave4) Entonces
                            Escribir "L " Sin Saltar
                        Sino
                            Escribir ". " Sin Saltar
                        FinSi
                    Sino 
                        Si fila = 5 Y columna = 5 Entonces
                            Escribir "S " Sin Saltar
                        Sino
                            Escribir ". " Sin Saltar
                        FinSi
                    FinSi
                FinSi
            FinPara
            Escribir ""
        FinPara
        Escribir ""
        
        // Verificar si encontró una llave
        Si posX = 3 Y posY = 2 Y NO llave1 Entonces
            llave1 <- Verdadero
            llavesRecolectadas <- llavesRecolectadas + 1
            Escribir "¡Encontraste la llave 1!"
        FinSi
        
        Si posX = 1 Y posY = 4 Y NO llave2 Entonces
            llave2 <- Verdadero
            llavesRecolectadas <- llavesRecolectadas + 1
            Escribir "¡Encontraste la llave 2!"
        FinSi
        
        Si posX = 4 Y posY = 5 Y NO llave3 Entonces
            llave3 <- Verdadero
            llavesRecolectadas <- llavesRecolectadas + 1
            Escribir "¡Encontraste la llave 3!"
        FinSi
        
        Si posX = 5 Y posY = 3 Y NO llave4 Entonces
            llave4 <- Verdadero
            llavesRecolectadas <- llavesRecolectadas + 1
            Escribir "¡Encontraste la llave 4!"
        FinSi
        
        // Verificar si llegó a la salida con todas las llaves
        Si posX = 5 Y posY = 5 Entonces
            Si llavesRecolectadas = 4 Entonces
                salidaEncontrada <- Verdadero
                Escribir "¡Felicidades ", nombreJugador, "! Has escapado del laberinto."
                Escribir "Has ganado el juego."
            Sino 
                Escribir "Necesitas encontrar todas las llaves antes de escapar."
            FinSi
        FinSi
        
        // Opciones de movimiento
        Escribir ""
        Escribir "¿Qué dirección quieres moverte?"
        Escribir "1. Arriba (W)"
        Escribir "2. Izquierda (A)"
        Escribir "3. Abajo (S)"
        Escribir "4. Derecha (D)"
        Escribir "5. Salir (Q)"
        Escribir "Elige una opción (1-5): "
        Leer opcion
		Definir opcion Como Caracter
        Segun opcion Hacer
            1: // Arriba
                Si posY > 1 Entonces
                    posY <- posY - 1
                Sino
                    Escribir "¡No puedes moverte ahí! Pierdes una vida."
                    vidas <- vidas - 1
                FinSi
            2: // Izquierda
                Si posX > 1 Entonces
                    posX <- posX - 1
                Sino
                    Escribir "¡No puedes moverte ahí! Pierdes una vida."
                    vidas <- vidas - 1
                FinSi
            3: // Abajo
                Si posY < 5 Entonces
                    posY <- posY + 1
                Sino
                    Escribir "¡No puedes moverte ahí! Pierdes una vida."
                    vidas <- vidas - 1
                FinSi
            4: // Derecha
                Si posX < 5 Entonces
                    posX <- posX + 1
                Sino
                    Escribir "¡No puedes moverte ahí! Pierdes una vida."
                    vidas <- vidas - 1
                FinSi
            5: // Salir
                Escribir "¿Estás seguro que quieres salir? (s/n)"
                Leer nombreJugador // Reutilizamos esta variable para la respuesta
                Si nombreJugador = "s" O nombreJugador = "S" Entonces
                FinSi
            De Otro Modo:
                Escribir "Opción no válida. Intenta nuevamente."
        FinSegun
        
		
        Si Azar(15) > 7 Entonces 
            Escribir ""
            Escribir "Te encuentras con un obstáculo o decisión..."
            Escribir "1. Saltar el obstáculo (riesgo de perder vida)"
            Escribir "2. Buscar un camino alternativo (puede tomarte más tiempo)"
            Escribir "Elige una opción (1-2): "
            Leer camino
		FinSi
		Si camino = 1 Entonces
			Si Azar(2) = 1 Entonces 
				Escribir "¡Lograste saltar el obstáculo!"
			Sino
				Escribir "¡Fallaste! Pierdes una vida."
				vidas <- vidas - 1
			FinSi
		Sino Si camino = 2 Entonces
				Escribir "Encuentras un camino seguro pero retrocedes una posición."
				Si posX > 1 Entonces
					posX <- posX - 1
				FinSi
			FinSi
		FinSi
		
		Borrar Pantalla
		Si vidas <= 0 Entonces
			Escribir "¡Game Over! Te quedaste sin vidas."
			Escribir "Llaves recolectadas: ", llavesRecolectadas, "/4"
		FinSi
		
		Escribir "Gracias por jugar, ", nombreJugador, "!"
	FinMientras
FinAlgoritmo
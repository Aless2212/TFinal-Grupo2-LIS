Proceso LIS_FuerzaBruta
    Definir secuencia, subseq Como Entero
    Definir i, j, k, n, total, len_actual, max_len, binario, cantidad Como Entero
    Definir esCreciente Como Logico
	
    Dimensionar secuencia(10)
    Dimensionar subseq(10)
	
    Repetir
        Escribir "¿Cuántos números desea ingresar? (máximo 10):"
        Leer cantidad
    Hasta Que cantidad >= 1 Y cantidad <= 10
	
    n <- cantidad
	
    Escribir "Ingrese", n, "números:"
    Para i <- 0 Hasta n - 1 Con Paso 1 Hacer
        Escribir "Elemento [", i, "]:"
        Leer secuencia[i]
    FinPara
	
    total <- 2^n
    max_len <- 0
	
    Escribir ""
    Escribir "Secuencia ingresada:"
    Para i <- 0 Hasta n - 1 Con Paso 1 Hacer
        Escribir secuencia[i], " "
    FinPara
    Escribir ""
	
    Para i <- 1 Hasta total - 1 Con Paso 1 Hacer
        len_actual <- 0
		
        Para j <- 0 Hasta n - 1 Con Paso 1 Hacer
            Si ((Trunc(i / (2^j)) MOD 2) = 1) Entonces
                subseq[len_actual] <- secuencia[j]
                len_actual <- len_actual + 1
            FinSi
        FinPara
		
        esCreciente <- Verdadero
        Para k <- 1 Hasta len_actual - 1 Con Paso 1 Hacer
            Si subseq[k] <= subseq[k - 1] Entonces
                esCreciente <- Falso
            FinSi
        FinPara
		
        Si esCreciente Y len_actual > max_len Entonces
            max_len <- len_actual
        FinSi
    FinPara
	
    Escribir ""
    Escribir "[Fuerza bruta] Longitud de la SCL:", max_len
FinProceso
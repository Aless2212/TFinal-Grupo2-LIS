Algoritmo SCL_Programacion_Dinamica
	Definir secuencia, SCL Como Entero
	Definir i, j, n, maximo Como Entero
	
	Escribir "Ingrese la cantidad de elementos de la secuencia (máximo 10):"
	Leer n
	
	Dimensionar secuencia(n)
	Dimensionar SCL(n)
	
	Escribir "Ingrese los ", n, " elementos de la secuencia:"
	Para i <- 0 Hasta n - 1 Con Paso 1 Hacer
		Leer secuencia[i]
	FinPara
	
	Para i <- 0 Hasta n - 1 Con Paso 1 Hacer
		SCL[i] <- 1
	FinPara
	
	Para i <- 1 Hasta n - 1 Con Paso 1 Hacer
		Para j <- 0 Hasta i - 1 Con Paso 1 Hacer
			Si secuencia[i] > secuencia[j] Y SCL[i] < SCL[j] + 1 Entonces
				SCL[i] <- SCL[j] + 1
			FinSi
		FinPara
	FinPara

	maximo <- SCL[0]
	Para i <- 1 Hasta n - 1 Con Paso 1 Hacer
		Si SCL[i] > maximo Entonces
			maximo <- SCL[i]
		FinSi
	FinPara
	
	Escribir "Secuencia ingresada:"
	Para i <- 0 Hasta n - 1 Con Paso 1 Hacer
		Escribir secuencia[i], " "
	FinPara
	
	Escribir ""
	Escribir "Longitud de la SCL:", maximo
FinAlgoritmo
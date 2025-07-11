##################################
##FUERZA BRUTA##
##################################
# Contador de operaciones
op_LIS_fuerza = 0

def es_creciente(subseq):
    global op_LIS_fuerza
    for i in range(1, len(subseq)):
        op_LIS_fuerza += 1
        if subseq[i] <= subseq[i - 1]:
            return False
    return True

def generar_subsecuencias(arr, index, subseq, todas):
    if index == len(arr):
        if subseq:
            todas.append(subseq[:])
        return
    subseq.append(arr[index])
    generar_subsecuencias(arr, index + 1, subseq, todas)
    subseq.pop()
    generar_subsecuencias(arr, index + 1, subseq, todas)

def LIS_fuerza_bruta(arr):
    todas_subsecuencias = []
    generar_subsecuencias(arr, 0, [], todas_subsecuencias)

    max_len = 0
    for subseq in todas_subsecuencias:
        if es_creciente(subseq):
            max_len = max(max_len, len(subseq))

    return max_len

#################################
###PROGRAMACION DINAMICA####
#################################
op_LIS_dp = 0

def LIS_dp(arr):
    global op_LIS_dp
    n = len(arr)
    if n == 0:
        return 0

    sub_c_l = [1] * n

    for i in range(1, n):
        for j in range(i):
            op_LIS_dp += 1
            if arr[i] > arr[j] and sub_c_l[i] < sub_c_l[j] + 1:
                sub_c_l[i] = sub_c_l[j] + 1

    return max(sub_c_l)


# Generar una secuencia aleatoria
secuencia = [1, 3, 2, 4, 3, 5, 4]

###########################
##EJECUCIONES##

# Ejecutar ambos métodos
print("Secuencia generada:", secuencia)

resultado_fuerza = LIS_fuerza_bruta(secuencia)
print(f"[Fuerza bruta] Longitud LIS: {resultado_fuerza} | Operaciones: {op_LIS_fuerza}")

resultado_dp = LIS_dp(secuencia)
print(f"[Programación dinámica] Longitud LIS: {resultado_dp} | Operaciones: {op_LIS_dp}")


#################################
##FUNCÍON PARA MOSTRAR##
def encontrar_LIS_Max(arr, longitud_max):
    resultado = []
    def backtracking(indice, subseq):
        if len(subseq) == longitud_max:
            resultado.append(subseq[:])
            return
        for i in range(indice, len(arr)):
            if not subseq or arr[i] > subseq[-1]:
                subseq.append(arr[i])
                backtracking(i + 1, subseq)
                subseq.pop()
    backtracking(0, [])
    return resultado

lis_maximas = encontrar_LIS_Max(secuencia, resultado_dp)
print("Cantidad de LIS más largas:", len(lis_maximas))
print("Listas LIS más largas:")
for lis in lis_maximas:
    print(lis)